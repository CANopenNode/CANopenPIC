/*
 * CANopen main program file for PIC32 microcontroller.
 *
 * @file        main_PIC32.c
 * @author      Janez Paternoster
 * @copyright   2021 Janez Paternoster
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

#include <xc.h>
#include <sys/attribs.h>

#include "CANopen.h"
#include "storage/CO_storageEeprom.h"
#include "OD.h"
#include "CO_application.h"


/* Default configuration bit settings */
#ifndef CO_CONFIGURATION_BITS_CONFIGURED
#define CO_CONFIGURATION_BITS_CONFIGURED
#pragma config FVBUSONIO = OFF      /* USB VBUS_ON Selection */
#pragma config FUSBIDIO = OFF       /* USB USBID Selection */
#pragma config UPLLEN = OFF         /* USB PLL Enable */
#pragma config UPLLIDIV = DIV_12    /* USB PLL Input Divider */
#pragma config FCANIO = ON          /* CAN IO Pin Selection */
#pragma config FETHIO = ON          /* Ethernet IO Pin Selection */
#pragma config FMIIEN = ON          /* Ethernet MII Enable (ON = MII enabled) */
#pragma config FSRSSEL = PRIORITY_7 /* SRS (Shadow registers set) Select */
#pragma config POSCMOD = XT         /* Primary Oscillator */
#pragma config FSOSCEN = OFF        /* Secondary oscillator Enable */
#pragma config FNOSC = PRIPLL       /* Oscillator Selection */
#pragma config FPLLIDIV = DIV_2     /* PLL Input Divider */
#pragma config FPLLMUL = MUL_16     /* PLL Multiplier */
#pragma config FPLLODIV = DIV_1     /* PLL Output Divider Value */
#pragma config FPBDIV = DIV_2       /* Bootup PBCLK divider */
#pragma config FCKSM = CSDCMD       /* Clock Switching and Monitor Selection */
#pragma config OSCIOFNC = OFF       /* CLKO Enable */
#pragma config IESO = OFF           /* Internal External Switch Over */
#pragma config FWDTEN = OFF         /* Watchdog Timer Enable */
#pragma config WDTPS = PS1024       /* Watchdog Timer Postscale Select */
#pragma config CP = OFF             /* Code Protect Enable */
#pragma config BWP = ON             /* Boot Flash Write Protect */
#pragma config PWP = PWP256K        /* Program Flash Write Protect */
#pragma config DEBUG = ON           /* Background Debugger Enable */
#ifdef CO_ICS_PGx1
#pragma config ICESEL = ICS_PGx1    /* ICE/ICD Comm Channel Select */
#else
#pragma config ICESEL = ICS_PGx2    /* ICE/ICD Comm Channel Select (2 for
                                     * Explorer16 and Max32 board) */
#endif
#endif


/*
 * Configure peripherals
 * - Configure Analog Inputs AI0..AI15:
 *   - AD1CON1:
 *     - FORM = 000b: Data output is unsigned integer, 10bit, right justified
 *     - SSRC = 111b: Internal counter ends sampling and starts conversion
 *     - CLRASAM = 1: Stop conversions after ADC interrupt is generated
 *   - AD1CON2:
 *     - VCFG = 001b: ADC voltage reference is Vref+ and AVss
 *     - CSCNA = 1: Enable scan mode
 *     - SMPI = 1111b: Interrupts after each 16th sample/convert sequence
 *   - AD1CON3:
 *     - ADRC = 0: Clock derived from Peripheral Bus Clock (PBCLK)
 *     - SAMC = 31: Auto sample time = 31*TAD
 *     - ADCS = 0..2: (If PBCLK=32MHz -> TAD=125ns)
 *   - AD1PCFG, AD1CSSL: Use all ports AI0..AI15
 *   - Enable ADC interrupt with priority 3, turn ADC On. ADC conversion is
 *     triggered by high priority timer interval interrupt. After conversion is
 *     completed, Real Time Thread is executed, see its definitions below.
 *     Analog values AN0..AN15 are available in ADC1BUF0..ADC1BUF15
 */
#ifndef CO_PERIPHERAL_CONFIG
/* ADC conversion clock select */
#if CO_PBCLK <= 24000
    #define HW_ADCS 0
#elif CO_PBCLK <= 48000
    #define HW_ADCS 1
#elif CO_PBCLK <= 96000
    #define HW_ADCS 2
#endif
#define CO_PERIPHERAL_CONFIG() { \
    AD1CON1 = 0x00F0; \
    AD1CON2 = 0x243C; \
    AD1CON3 = 0x1F00 | HW_ADCS; \
    AD1CHS = 0; \
    AD1PCFG = 0; \
    AD1CSSL = 0xFFFF; \
    AD1CON1SET = 0x8000; \
}
#endif /* CO_PERIPHERAL_CONFIG */


/*
 * Real Time Thread definitions
 *
 * Configure timer interrupt, 1ms interval, highest priority. Timer will trigger
 * ADC conversion. After conversion of all analog inputs completed, ADC
 * interrupt will be used as Real Time Thread.
 */
#ifndef CO_RT_THREAD_CONFIG
#if CO_PBCLK < 2 || CO_PBCLK > 65000
    #error wrong timer configuration for real time thread
#endif
#define CO_RT_THREAD_CONFIG() { \
    T2CON = 0; \
    TMR2 = 0; \
    PR2 = CO_PBCLK - 1; \
    T2CON = 0x8000; \
    IFS0bits.T2IF = 0; \
    IPC2bits.T2IP = 7; \
    IFS1bits.AD1IF = 0; \
    IEC1bits.AD1IE = 1; \
    IPC6bits.AD1IP = 3; \
}
#endif
/* Interval of the realtime thread */
#ifndef CO_RT_THREAD_INTERVAL_US
#define CO_RT_THREAD_INTERVAL_US 1000
#endif
/* Additional external triggers, which can be used inside the first interrupt */
#ifndef CO_RT_THREAD_CUSTOM_TRIGGERS
#define CO_RT_THREAD_CUSTOM_TRIGGERS()
#endif
/* Default interrupt handler, twin, timer starts ADC conversion, then adc isr */
#ifndef CO_RT_THREAD_ISR
#define CO_RT_THREAD_ISR_DEFAULT
#define CO_RT_THREAD_ISR() void __ISR(_TIMER_2_VECTOR, IPL7SRS) _adIsr(void) { \
    AD1CON1bits.ASAM = 1; \
    CO_RT_THREAD_CUSTOM_TRIGGERS(); \
    IFS0bits.T2IF = 0; \
} \
void __ISR(_ADC_VECTOR, IPL3SOFT) _rtThread(void)
#endif
/* Enable interrupt, 0 or 1 */
#ifndef CO_RT_THREAD_ENABLE
#define CO_RT_THREAD_ENABLE(ENABLE) IEC0bits.T2IE = ENABLE
#endif
/* Interrupt flag bit, used inside _rtThread */
#ifndef CO_RT_THREAD_ISR_FLAG
#define CO_RT_THREAD_ISR_FLAG IFS1bits.AD1IF
#endif


/* CAN receive interrupt definitions */
/* Configure CAN rx interrupt, priority is 5, higher than timer */
#ifndef CO_CANRX_CONFIG
#define CO_CANRX_CONFIG() { \
    IFS1bits.CAN1IF = 0; \
    IPC11bits.CAN1IP = 5; \
}
#endif
/* Default interrupt handler, use same priority as in CO_CANRX_CONFIG() */
#ifndef CO_CANRX_ISR
#define CO_CANRX_ISR_DEFAULT
#define CO_CANRX_ISR() void __ISR(_CAN_1_VECTOR, IPL5SOFT) _canRxIsr(void)
#endif
/* Enable interrupt, 0 or 1 */
#ifndef CO_CANRX_ENABLE
#define CO_CANRX_ENABLE(ENABLE) IEC1bits.CAN1IE = ENABLE
#endif
/* Interrupt flag bit, used inside CO_CANRX_ISR */
#ifndef CO_CANRX_ISR_FLAG
#define CO_CANRX_ISR_FLAG IFS1bits.CAN1IF
#endif


/* Watchdog timer */
#ifndef CO_clearWDT
#define CO_clearWDT() (WDTCONSET = _WDTCON_WDTCLR_MASK)
#endif


/* default values for CO_CANopenInit() */
#ifndef NMT_CONTROL
#define NMT_CONTROL \
            CO_NMT_STARTUP_TO_OPERATIONAL \
          | CO_NMT_ERR_ON_ERR_REG \
          | CO_ERR_REG_GENERIC_ERR \
          | CO_ERR_REG_COMMUNICATION
#endif
#ifndef FIRST_HB_TIME
#define FIRST_HB_TIME 500
#endif
#ifndef SDO_SRV_TIMEOUT_TIME
#define SDO_SRV_TIMEOUT_TIME 1000
#endif
#ifndef SDO_CLI_TIMEOUT_TIME
#define SDO_CLI_TIMEOUT_TIME 500
#endif
#ifndef SDO_CLI_BLOCK
#define SDO_CLI_BLOCK false
#endif
#ifndef OD_STATUS_BITS
#define OD_STATUS_BITS NULL
#endif

/* Definitions for application specific data storage objects */
#ifndef CO_STORAGE_APPLICATION
#define CO_STORAGE_APPLICATION
#endif
/* Interval for automatic data storage in microseconds */
#ifndef CO_STORAGE_AUTO_INTERVAL
#define CO_STORAGE_AUTO_INTERVAL 60000000
#endif


/* CANopen object */
CO_t *CO = NULL;

/* Active node-id, copied from pendingNodeId in the communication reset */
static uint8_t CO_activeNodeId = CO_LSS_NODE_ID_ASSIGNMENT;

/* Timer for time measurement */
volatile uint32_t CO_timer_us = 0;

/* Data block for mainline data, which can be stored to non-volatile memory */
typedef struct {
    /* Pending CAN bit rate, can be set by switch or LSS slave. */
    uint16_t pendingBitRate;
    /* Pending CANopen NodeId, can be set by switch or LSS slave. */
    uint8_t pendingNodeId;
} mainlineStorage_t;

static mainlineStorage_t mlStorage = {0};

/* callback for storing node id and bitrate */
static bool_t LSScfgStoreCallback(void *object, uint8_t id, uint16_t bitRate) {
    mainlineStorage_t *mainlineStorage = object;
    mainlineStorage->pendingBitRate = bitRate;
    mainlineStorage->pendingNodeId = id;
    return true;
}

/* main ***********************************************************************/
int main (void) {
    CO_ReturnError_t err;
    CO_NMT_reset_cmd_t reset = CO_RESET_NOT;
    bool_t firstRun = true;

#if (CO_CONFIG_STORAGE) & CO_CONFIG_STORAGE_ENABLE
    CO_storage_t storage;
    CO_storage_entry_t storageEntries[] = {
        {
            .addr = &OD_PERSIST_COMM,
            .len = sizeof(OD_PERSIST_COMM),
            .subIndexOD = 2,
            .attr = CO_storage_cmd | CO_storage_restore
        },
        {
            .addr = &mlStorage,
            .len = sizeof(mlStorage),
            .subIndexOD = 4,
            .attr = CO_storage_cmd | CO_storage_auto | CO_storage_restore
        },
        CO_STORAGE_APPLICATION
    };
    uint8_t storageEntriesCount = sizeof(storageEntries)
                                / sizeof(storageEntries[0]);
    uint32_t storageInitError = 0;
#endif

    /* Configure system for maximum performance. plib is necessary for that.*/
    /* SYSTEMConfig(CO_FSYS*1000, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE); */

    /* Enable system multi vectored interrupts */
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();

    /* Disable JTAG and trace port */
    DDPCONbits.JTAGEN = 0;
    DDPCONbits.TROEN = 0;


    /* Allocate memory for CANopen objects */
    uint32_t heapMemoryUsed = 0;
    CO = CO_new(NULL, &heapMemoryUsed);
    if (CO == NULL) {
        while (1);
    }


#if (CO_CONFIG_STORAGE) & CO_CONFIG_STORAGE_ENABLE
    err = CO_storageEeprom_init(&storage,
                                CO->CANmodule,
                                NULL,
                                OD_ENTRY_H1010_storeParameters,
                                OD_ENTRY_H1011_restoreDefaultParameters,
                                storageEntries,
                                storageEntriesCount,
                                &storageInitError);

    if (err != CO_ERROR_NO && err != CO_ERROR_DATA_CORRUPT) {
        while (1);
    }
#endif

    /* Configure peripherals */
    CO_PERIPHERAL_CONFIG();

    /* Execute external application code */
    uint32_t errInfo_app_programStart = 0;
    err = app_programStart(&mlStorage.pendingBitRate,
                           &mlStorage.pendingNodeId,
                           &errInfo_app_programStart);
    if (err != CO_ERROR_NO) {
        while (1);
    }

    /* verify stored values */
    if (!CO_LSSchkBitrateCallback(NULL, mlStorage.pendingBitRate)) {
        mlStorage.pendingBitRate = 125;
    }
    if (mlStorage.pendingNodeId < 1 || mlStorage.pendingNodeId > 127) {
        mlStorage.pendingNodeId = CO_LSS_NODE_ID_ASSIGNMENT;
    }


    while (reset != CO_RESET_APP) {
/* CANopen communication reset - initialize CANopen objects *******************/
        uint32_t errInfo;
        uint32_t CO_timer_us_previous;

        /* disable CAN receive interrupts */
        CO_CANRX_ENABLE(0);

        /* initialize CANopen */
        err = CO_CANinit(CO, (void *)_CAN1_BASE_ADDRESS,
                         mlStorage.pendingBitRate);
        if (err != CO_ERROR_NO) {
            while (1) CO_clearWDT();
        }

        CO_LSS_address_t lssAddress = {.identity = {
            .vendorID = OD_PERSIST_COMM.x1018_identity.vendor_ID,
            .productCode = OD_PERSIST_COMM.x1018_identity.productCode,
            .revisionNumber = OD_PERSIST_COMM.x1018_identity.revisionNumber,
            .serialNumber = OD_PERSIST_COMM.x1018_identity.serialNumber
        }};
        err = CO_LSSinit(CO, &lssAddress,
                         &mlStorage.pendingNodeId, &mlStorage.pendingBitRate);
        if (err != CO_ERROR_NO) {
            while (1) CO_clearWDT();
        }

        CO_activeNodeId = mlStorage.pendingNodeId;
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
                             CO_activeNodeId,
                             &errInfo);
        if (err != CO_ERROR_NO && err != CO_ERROR_NODE_ID_UNCONFIGURED_LSS) {
            while (1) CO_clearWDT();
        }

        /* Emergency messages in case of errors */
        if (!CO->nodeIdUnconfigured) {
            if (errInfo == 0) errInfo = errInfo_app_programStart;
            if (errInfo != 0) {
                CO_errorReport(CO->em, CO_EM_INCONSISTENT_OBJECT_DICT,
                               CO_EMC_DATA_SET, errInfo);
            }
#if (CO_CONFIG_STORAGE) & CO_CONFIG_STORAGE_ENABLE
            if (storageInitError != 0) {
                CO_errorReport(CO->em, CO_EM_NON_VOLATILE_MEMORY,
                               CO_EMC_HARDWARE, storageInitError);
            }
#endif
        }

        /* initialize callbacks */
        CO_LSSslave_initCheckBitRateCallback(CO->LSSslave, NULL,
                                             CO_LSSchkBitrateCallback);
        CO_LSSslave_initCfgStoreCallback(CO->LSSslave, &mlStorage,
                                         LSScfgStoreCallback);


        /* First time only initialization. */
        if (firstRun) {
            firstRun = false;

            /* Configure real time thread and CAN receive interrupt */
            CO_RT_THREAD_CONFIG();
            CO_CANRX_CONFIG();

            CO_timer_us_previous = CO_timer_us;
        } /* if(firstRun) */

        /* Execute external application code */
        app_communicationReset(CO);

        errInfo = 0;
        err = CO_CANopenInitPDO(CO,             /* CANopen object */
                                CO->em,         /* emergency object */
                                OD,             /* Object dictionary */
                                CO_activeNodeId,
                                &errInfo);
        if (err != CO_ERROR_NO && err != CO_ERROR_NODE_ID_UNCONFIGURED_LSS) {
            while (1) CO_clearWDT();
        }


        /* start CAN and enable interrupts */
        CO_CANsetNormalMode(CO->CANmodule);
        CO_RT_THREAD_ENABLE(1);
        CO_CANRX_ENABLE(1);
        reset = CO_RESET_NOT;


        while (reset == CO_RESET_NOT) {
/* loop for normal program execution ******************************************/

            /* calculate time difference since last cycle */
            uint32_t timer_us_copy = CO_timer_us;
            uint32_t timeDifference_us = timer_us_copy - CO_timer_us_previous;
            CO_timer_us_previous = timer_us_copy;

            CO_clearWDT();

            /* process CANopen objects */
            reset = CO_process(CO, false, timeDifference_us, NULL);

            CO_clearWDT();

            /* Execute external application code */
            app_programAsync(CO, timeDifference_us);

            CO_clearWDT();

#if (CO_CONFIG_STORAGE) & CO_CONFIG_STORAGE_ENABLE
            CO_storageEeprom_auto_process(&storage, false);
#endif
        }
    } /* while(reset != CO_RESET_APP */


/* program exit ***************************************************************/
    CO_RT_THREAD_ENABLE(0);
    CO_CANRX_ENABLE(0);

    /* Execute external application code */
    app_programEnd();

#if (CO_CONFIG_STORAGE) & CO_CONFIG_STORAGE_ENABLE
    CO_storageEeprom_auto_process(&storage, true);
#endif

    /* delete objects from memory */
    CO_CANsetConfigurationMode(CO->CANmodule->CANptr);
    CO_delete(CO);

    /* reset microcontroller */
    SYSKEY = 0x00000000;
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    RSWRSTSET = 1;
    (void) RSWRST;
    while (1);
}


/* timer interrupt function executes every millisecond ************************/
#ifdef CO_RT_THREAD_ISR_DEFAULT
CO_RT_THREAD_ISR() {
    CO_timer_us += CO_RT_THREAD_INTERVAL_US;

    /* Execute external application code */
    app_peripheralRead(CO, CO_RT_THREAD_INTERVAL_US);

    CO_RT_THREAD_ISR_FLAG = 0;

    /* No need to CO_LOCK_OD(co->CANmodule); this is interrupt */
    if (!CO->nodeIdUnconfigured && CO->CANmodule->CANnormal) {
        bool_t syncWas = false;

#if (CO_CONFIG_SYNC) & CO_CONFIG_SYNC_ENABLE
        syncWas = CO_process_SYNC(CO, CO_RT_THREAD_INTERVAL_US, NULL);
#endif
#if (CO_CONFIG_PDO) & CO_CONFIG_RPDO_ENABLE
        CO_process_RPDO(CO, syncWas, CO_RT_THREAD_INTERVAL_US, NULL);
#endif

        /* Execute external application code */
        app_programRt(CO, CO_RT_THREAD_INTERVAL_US);

#if (CO_CONFIG_PDO) & CO_CONFIG_TPDO_ENABLE
        CO_process_TPDO(CO, syncWas, CO_RT_THREAD_INTERVAL_US, NULL);
#endif

        /* verify timer overflow */
        if (CO_RT_THREAD_ISR_FLAG == 1) {
            CO_errorReport(CO->em, CO_EM_ISR_TIMER_OVERFLOW,
                           CO_EMC_SOFTWARE_INTERNAL, 0);
            CO_RT_THREAD_ISR_FLAG = 0;
        }

        (void) syncWas;
    }

    /* Execute external application code */
    app_peripheralWrite(CO, CO_RT_THREAD_INTERVAL_US);
}
#endif /* CO_RT_THREAD_ISR_DEFAULT */


/* CAN interrupt function *****************************************************/
#ifdef CO_CANRX_ISR_DEFAULT
CO_CANRX_ISR() {
    CO_CANinterrupt(CO->CANmodule);
    /* Clear combined Interrupt flag */
    CO_CANRX_ISR_FLAG = 0;
}
#endif
