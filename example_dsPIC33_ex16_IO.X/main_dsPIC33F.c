/*
 * CANopen main program file for dsPIC33F microcontroller.
 *
 * Example code for using CANopenNode library Explorer16 board and
 * dsPIC33FJ256GP710 microcontroller.
 *
 * @file        main_dsPIC33F.c
 * @author      Janez Paternoster
 * @copyright   2010 - 2020 Janez Paternoster
 *
 * This file is part of CANopenNode, an opensource CANopen Stack.
 * Project home page is <https://github.com/CANopenNode/CANopenNode>.
 * For more information on CANopen see <http://www.can-cia.org/>.
 *
 * This file is part of CANopenNode, an opensource CANopen Stack.
 * Project home page is <https://github.com/CANopenNode/CANopenNode>.
 * For more information on CANopen see <http://www.can-cia.org/>.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


/**
 * This file is tested on explorer16 board from Microchip. Microcontroller  is
 * dsPIC33FJ256GP710. D3 and D4 LEDs are used as CANopen status LEDs (D4 should
 * be red). Device sends bootup and Heartbeat message. Default NodeID is 0x30.
 * Implemented is simple CANopen I/O device profile (DS401):
 *  - TPDO with address 0x1B0 is send, if any button (S3, S6, S4) is pressed.
 *  - LED diodes (D5...D10) are controlled by two bytes long RPDO on
 *     CAN address 0x230 (upper six bits from first byte is used to control LEDs).
 */

#define CO_FCY     24000      /* (8MHz Quartz used) */


#include "CANopen.h"
#include "OD.h"
/* (not implemented) #include "eeprom.h" */

/* Configuration bits */
#pragma config FNOSC = PRIPLL   /* Primary Oscillator (XT, HS, EC) w/ PLL */
#pragma config FCKSM = CSDCMD   /* Both Clock Switching and Fail-Safe Clock Monitor are disabled */
#pragma config OSCIOFNC = OFF   /* OSC2 pin has clock out function */
#pragma config POSCMD = XT      /* XT Oscillator Mode */


/* macros */
    #define CO_TIMER_ISR() void __attribute__((interrupt, auto_psv)) _T2Interrupt (void)
    #define CO_TMR_TMR          TMR2             /* TMR register */
    #define CO_TMR_PR           PR2              /* Period register */
    #define CO_TMR_CON          T2CON            /* Control register */
    #define CO_TMR_ISR_FLAG     IFS0bits.T2IF    /* Interrupt Flag bit */
    #define CO_TMR_ISR_PRIORITY IPC1bits.T2IP    /* Interrupt Priority */
    #define CO_TMR_ISR_ENABLE   IEC0bits.T2IE    /* Interrupt Enable bit */

    #define CO_RT_THREAD_INTERVAL_US 1000        /* Interval of the realtime thread */

    #define CO_CAN_ISR() void __attribute__((interrupt, auto_psv)) _C1Interrupt (void)
    #define CO_CAN_ISR_FLAG     IFS2bits.C1IF    /* Interrupt Flag bit */
    #define CO_CAN_ISR_PRIORITY IPC8bits.C1IP    /* Interrupt Priority */
    #define CO_CAN_ISR_ENABLE   IEC2bits.C1IE    /* Interrupt Enable bit */


/* default values for CO_CANopenInit() */
    #define NMT_CONTROL (CO_NMT_STARTUP_TO_OPERATIONAL | CO_NMT_ERR_ON_ERR_REG | CO_ERR_REG_GENERIC_ERR | CO_ERR_REG_COMMUNICATION)
    #define FIRST_HB_TIME        500
    #define SDO_SRV_TIMEOUT_TIME 1000
    #define SDO_CLI_TIMEOUT_TIME 500
    #define SDO_CLI_BLOCK        false
    #define OD_STATUS_BITS       NULL

/* Global variables and objects */
    CO_t* CO = NULL; /* CANopen object */
    volatile uint32_t CO_timer_us = 0U; /* Timer for time measurement in microseconds */
    const CO_CANbitRateData_t  CO_CANbitRateData[8] = {CO_CANbitRateDataInitializers};
    /* (not implemented) eeprom_t eeprom; */


/* callback for checking bitrate */
static bool_t LSSchkBitrateCallback(void *object, uint16_t bitRate) {
    (void)object;
    int i;

    for (i=0; i<(sizeof(CO_CANbitRateData)/sizeof(CO_CANbitRateData[0])); i++) {
        if (CO_CANbitRateData[i].bitrate == bitRate) {
            return true;
        }
    }
    return false;
}

/* main ***********************************************************************/
int main (void){
    CO_ReturnError_t err;
    CO_NMT_reset_cmd_t reset = CO_RESET_NOT;
    bool_t firstRun = true;
    uint8_t pendingNodeId = 10;    /* read from dip switches or nonvolatile memory, configurable by LSS slave */
    uint8_t activeNodeId = 10;     /* Copied from CO_pendingNodeId in the communication reset section */
    uint16_t pendingBitRate = 125; /* read from dip switches or nonvolatile memory, configurable by LSS slave */
    uint32_t heapMemoryUsed;

    /* Initialize two CAN led diodes */
    TRISAbits.TRISA0 = 0; LATAbits.LATA0 = 0;
    TRISAbits.TRISA1 = 0; LATAbits.LATA1 = 1;
    #define CAN_RUN_LED   LATAbits.LATA0
    #define CAN_ERROR_LED LATAbits.LATA1


    /* Configure Oscillator */
    /* Fosc = Fin*M/(N1*N2), Fcy=Fosc/2 */
    /* Fosc = 8M*24/(2*2) = 48MHz -> Fcy = 24MHz */
    PLLFBD=22;              /*  M=24 */
    CLKDIVbits.PLLPOST=0;   /*  N1=2 */
    CLKDIVbits.PLLPRE=0;    /*  N2=2 */
    OSCTUN=0;               /*  Tune FRC oscillator, if FRC is used */
    while(OSCCONbits.LOCK!=1) ClrWdt(); /* wait for PLL to lock */


    /* Allocate memory */
    CO = CO_new(NULL, &heapMemoryUsed);
    if (CO == NULL) {
        while (1) ClrWdt();
    }


    /* initialize EEPROM */
        /* (not implemented) */


    while(reset != CO_RESET_APP){
/* CANopen communication reset - initialize CANopen objects *******************/
        uint32_t errInfo;
        static uint32_t CO_timer_us_previous = 0;

        /* disable CAN and CAN interrupts, turn on red LED */
        CO_CAN_ISR_ENABLE = 0;
        CAN_RUN_LED = 0;
        CAN_ERROR_LED = 1;

        /* initialize CANopen */
        err = CO_CANinit(CO, (void *)ADDR_CAN1, pendingBitRate);
        if (err != CO_ERROR_NO) {
            while (1) ClrWdt();
        }

        CO_LSS_address_t lssAddress = {.identity = {
            .vendorID = OD_PERSIST_COMM.x1018_identity.vendor_ID,
            .productCode = OD_PERSIST_COMM.x1018_identity.productCode,
            .revisionNumber = OD_PERSIST_COMM.x1018_identity.revisionNumber,
            .serialNumber = OD_PERSIST_COMM.x1018_identity.serialNumber
        }};
        err = CO_LSSinit(CO, &lssAddress, &pendingNodeId, &pendingBitRate);
        if (err != CO_ERROR_NO) {
            while (1) ClrWdt();
        }

        activeNodeId = pendingNodeId;

        errInfo = 0;
        err = CO_CANopenInit(CO,                /* CANopen object */
                             NULL,              /* alternate NMT */
                             NULL,              /* alternate em */
                             OD,                /* Object dictionary */
                             OD_STATUS_BITS,    /* Optional OD_statusBits */
                             NMT_CONTROL,       /* CO_NMT_control_t */
                             FIRST_HB_TIME,     /* firstHBTime_ms */
                             SDO_SRV_TIMEOUT_TIME, /* SDOserverTimeoutTime_ms */
                             SDO_CLI_TIMEOUT_TIME, /* SDOclientTimeoutTime_ms */
                             SDO_CLI_BLOCK,     /* SDOclientBlockTransfer */
                             activeNodeId,
                             &errInfo);
        if (err != CO_ERROR_NO && err != CO_ERROR_NODE_ID_UNCONFIGURED_LSS) {
            while (1) ClrWdt();
        }

        /* Emergency messages in case of errors */
        if (!CO->nodeIdUnconfigured && errInfo != 0) {
            CO_errorReport(CO->em, CO_EM_INCONSISTENT_OBJECT_DICT, CO_EMC_DATA_SET, errInfo);
        }

        /* First time only initialization. */
        if (firstRun) {
            firstRun = false;
            CO_timer_us_previous = CO_timer_us;
        } /* if(firstRun) */

        /* initialize callbacks */
        CO_LSSslave_initCkBitRateCall(CO->LSSslave, NULL,  LSSchkBitrateCallback);

        /* init PDO */
        errInfo = 0;
        err = CO_CANopenInitPDO(CO,             /* CANopen object */
                                CO->em,         /* emergency object */
                                OD,             /* Object dictionary */
                                activeNodeId,
                                &errInfo);
        if (err != CO_ERROR_NO && err != CO_ERROR_NODE_ID_UNCONFIGURED_LSS) {
            while (1) ClrWdt();
        }

        /* start CAN */
        CO_CANsetNormalMode(CO->CANmodule);


        /* Configure Timer interrupt function for execution every 1 millisecond */
        CO_TMR_CON = 0;
        CO_TMR_TMR = 0;
        CO_TMR_PR = CO_FCY - 1;    /* Period register */
        CO_TMR_CON = 0x8000;       /* start timer (TON=1) */
        CO_TMR_ISR_FLAG = 0;       /* clear interrupt flag */
        CO_TMR_ISR_PRIORITY = 3;   /* interrupt - set lower priority than CAN */
        CO_TMR_ISR_ENABLE = 1;     /* enable interrupt */
        /* Configure CAN1 Interrupt (Combined) */
        CO_CAN_ISR_FLAG = 0;       /* CAN1 Interrupt - Clear flag */
        CO_CAN_ISR_PRIORITY = 5;   /* CAN1 Interrupt - Set higher priority than timer */
        CO_CAN_ISR_ENABLE = 1;     /* CAN1 Interrupt - Enable interrupt */

        reset = CO_RESET_NOT;

        while(reset == CO_RESET_NOT){
/* loop for normal program execution ******************************************/

            /* calculate time difference since last cycle */
            uint32_t timer_us_copy = CO_timer_us;
            uint32_t timeDifference_us = timer_us_copy - CO_timer_us_previous;
            CO_timer_us_previous = timer_us_copy;

            ClrWdt();

            /* CANopen process */
            reset = CO_process(CO, false, timeDifference_us, NULL);

            CAN_RUN_LED = CO_LED_GREEN(CO->LEDs, CO_LED_CANopen);
            CAN_ERROR_LED = CO_LED_RED(CO->LEDs, CO_LED_CANopen);

            ClrWdt();

            /* (not implemented) eeprom_process(&eeprom); */
        }
    }
/* program exit ***************************************************************/
    /* save variables to eeprom */
    RESTORE_CPU_IPL(7);           /* disable interrupts */
    CAN_RUN_LED = 0;
    /* CAN_ERROR_LED = 0; */
    /* (not implemented) eeprom_saveAll(&eeprom); */
    CAN_ERROR_LED = 1;

    /* delete CANopen object from memory */
    CO_delete(ADDR_CAN1);

    /* reset */
    return 0;
}


/* timer interrupt function executes every millisecond ************************/
CO_TIMER_ISR(){

    /* clear interrupt flag bit */
    CO_TMR_ISR_FLAG = 0;

    CO_timer_us += CO_RT_THREAD_INTERVAL_US;

    if (!CO->nodeIdUnconfigured && CO->CANmodule->CANnormal) {
        bool_t syncWas;

#if (CO_CONFIG_SYNC) & CO_CONFIG_SYNC_ENABLE
        syncWas = CO_process_SYNC(CO, CO_RT_THREAD_INTERVAL_US, NULL);
#endif
#if (CO_CONFIG_PDO) & CO_CONFIG_RPDO_ENABLE
        CO_process_RPDO(CO, syncWas, CO_RT_THREAD_INTERVAL_US, NULL);
#endif

        /* Further I/O or nonblocking application code may go here. */

#if (CO_CONFIG_PDO) & CO_CONFIG_TPDO_ENABLE
        CO_process_TPDO(CO, syncWas, CO_RT_THREAD_INTERVAL_US, NULL);
#endif

        /* verify timer overflow */
        if(CO_TMR_ISR_FLAG == 1){
            CO_errorReport(CO->em, CO_EM_ISR_TIMER_OVERFLOW, CO_EMC_SOFTWARE_INTERNAL, 0);
            CO_TMR_ISR_FLAG = 0;
        }
    }
}


/* CAN interrupt function *****************************************************/
void CO_CANinterrupt(CO_CANmodule_t *CANmodule);
CO_CAN_ISR(){
    CO_CANinterrupt(CO->CANmodule);

    /* Clear combined Interrupt flag */
    CO_CAN_ISR_FLAG = 0;
}
