/*
 * CANopen main program file for dsPIC30F microcontroller.
 *
 * Example code for using CANopenNode library on dsPIC30F4011 microcontroller.
 *
 * @file        main_dsPIC30F.c
 * @author      Janez Paternoster
 * @copyright   2010 - 2015 Janez Paternoster
 *
 * This file is part of CANopenNode, an opensource CANopen Stack.
 * Project home page is <http://canopennode.sourceforge.net>.
 * For more information on CANopen see <http://www.can-cia.org/>.
 *
 * CANopenNode is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */


/**
 * This file is tested on dsPIC30F4011 microcontroller with two led diodes and
 * 8 MHz quartz. Device sends bootup and Heartbeat message. NodeID is 0x30.
 */

#define CO_FCY     16000      /* (8MHz Quartz used) */


#include "CANopen.h"
//#include "eeprom.h"


/* Configuration bits */
    _FOSC(CSW_FSCM_ON & XT_PLL8);


/* macros */
    #define CO_TIMER_ISR() void __attribute__((interrupt, auto_psv)) _T2Interrupt (void)
    #define CO_TMR_TMR          TMR2             /* TMR register */
    #define CO_TMR_PR           PR2              /* Period register */
    #define CO_TMR_CON          T2CON            /* Control register */
    #define CO_TMR_ISR_FLAG     IFS0bits.T2IF    /* Interrupt Flag bit */
    #define CO_TMR_ISR_PRIORITY IPC1bits.T2IP    /* Interrupt Priority */
    #define CO_TMR_ISR_ENABLE   IEC0bits.T2IE    /* Interrupt Enable bit */

    #define CO_CAN_ISR() void __attribute__((interrupt, auto_psv)) _C1Interrupt (void)
    #define CO_CAN_ISR_FLAG     IFS1bits.C1IF    /* Interrupt Flag bit */
    #define CO_CAN_ISR_PRIORITY IPC6bits.C1IP    /* Interrupt Priority */
    #define CO_CAN_ISR_ENABLE   IEC1bits.C1IE    /* Interrupt Enable bit */


/* Global variables and objects */
    volatile uint16_t CO_timer1ms = 0U; /* variable increments each millisecond */
    const CO_CANbitRateData_t  CO_CANbitRateData[8] = {CO_CANbitRateDataInitializers};
    //eeprom_t eeprom;


/* main ***********************************************************************/
int main (void){
    CO_NMT_reset_cmd_t reset = CO_RESET_NOT;

    /* Initialize two CAN led diodes */
    TRISFbits.TRISF4 = 0; LATFbits.LATF4 = 0;
    TRISFbits.TRISF5 = 0; LATFbits.LATF5 = 1;
    #define CAN_RUN_LED        LATFbits.LATF4
    #define CAN_ERROR_LED      LATFbits.LATF5


    /* Verify, if OD structures have proper alignment of initial values */
    if(CO_OD_RAM.FirstWord != CO_OD_RAM.LastWord) while(1) ClrWdt();
    if(CO_OD_EEPROM.FirstWord != CO_OD_EEPROM.LastWord) while(1) ClrWdt();
    if(CO_OD_ROM.FirstWord != CO_OD_ROM.LastWord) while(1) ClrWdt();


    /* initialize EEPROM */
//    eeprom_init(&eeprom,
//                     0xFC00,
//                    (uint16_t*) &CO_OD_EEPROM,
//                     sizeof(CO_OD_EEPROM));

    /* increase variable each startup. Variable is stored in eeprom. */
    OD_powerOnCounter++;

    while(reset != CO_RESET_APP){
/* CANopen communication reset - initialize CANopen objects *******************/
        static uint16_t timer1msPrevious;
        CO_ReturnError_t err;

        /* disable timer and CAN interrupts, turn on red LED */
        CO_TMR_ISR_ENABLE = 0;
        CO_CAN_ISR_ENABLE = 0;
        CAN_RUN_LED = 0;
        CAN_ERROR_LED = 1;

        /* initialize CANopen */
        err = CO_init();
        if(err != CO_ERROR_NO){
            while(1) ClrWdt();
            /* CO_errorReport(CO->em, CO_EM_MEMORY_ALLOCATION_ERROR, CO_EMC_SOFTWARE_INTERNAL, err); */
        }

        /* start CAN */
        CO_CANsetNormalMode(ADDR_CAN1);


        /* Configure Timer interrupt function for execution every 1 millisecond */
        CO_TMR_CON = 0;
        CO_TMR_TMR = 0;
        CO_TMR_PR = CO_FCY - 1;    /* Period register */
        CO_TMR_CON = 0x8000;       /* start timer (TON=1) */
        CO_timer1ms = 0;
        CO_TMR_ISR_FLAG = 0;       /* clear interrupt flag */
        CO_TMR_ISR_PRIORITY = 3;   /* interrupt - set lower priority than CAN */
        CO_TMR_ISR_ENABLE = 1;     /* enable interrupt */
        /* Configure CAN1 Interrupt (Combined) */
        CO_CAN_ISR_FLAG = 0;       /* CAN1 Interrupt - Clear flag */
        CO_CAN_ISR_PRIORITY = 5;   /* CAN1 Interrupt - Set higher priority than timer */
        CO_CAN_ISR_ENABLE = 1;     /* CAN1 Interrupt - Enable interrupt */

        reset = CO_RESET_NOT;
        timer1msPrevious = CO_timer1ms;

        while(reset == CO_RESET_NOT){
/* loop for normal program execution ******************************************/
            uint16_t timer1msCopy, timer1msDiff;
            static uint16_t TMR_TMR_PREV = 0;

            timer1msCopy = CO_timer1ms;
            timer1msDiff = timer1msCopy - timer1msPrevious;
            timer1msPrevious = timer1msCopy;

            ClrWdt();

            /* calculate cycle time for performance measurement */
            uint16_t t0 = CO_TMR_TMR;
            uint16_t t = t0;
            if(t >= TMR_TMR_PREV){
                t = t - TMR_TMR_PREV;
                t = (timer1msDiff * 100) + (t / (CO_FCY / 100));
            }
            else if(timer1msDiff){
                t = TMR_TMR_PREV - t;
                t = (timer1msDiff * 100) - (t / (CO_FCY / 100));
            }
            else t = 0;
            OD_performance[ODA_performance_mainCycleTime] = t;
            if(t > OD_performance[ODA_performance_mainCycleMaxTime])
                OD_performance[ODA_performance_mainCycleMaxTime] = t;
            TMR_TMR_PREV = t0;

            /* CANopen process */
            reset = CO_process(CO, timer1msDiff);

            CAN_RUN_LED = LED_GREEN_RUN(CO->NMT);
            CAN_ERROR_LED = LED_RED_ERROR(CO->NMT);

            ClrWdt();

            //eeprom_process(&eeprom);
        }
    }
/* program exit ***************************************************************/
    /* save variables to eeprom */
    RESTORE_CPU_IPL(7);           /* disable interrupts */
    CAN_RUN_LED = 0;
    CAN_ERROR_LED = 0;
    //eeprom_saveAll(&eeprom);
    CAN_ERROR_LED = 1;

    /* delete CANopen object from memory */
    CO_delete();

    /* reset */
    return 0;
}


/* timer interrupt function executes every millisecond ************************/
CO_TIMER_ISR(){
    /* clear interrupt flag bit */
    CO_TMR_ISR_FLAG = 0;

    CO_timer1ms++;

    CO_process_RPDO(CO);

    CO_process_TPDO(CO);

    /* verify timer overflow */
    if(CO_TMR_ISR_FLAG == 1){
        CO_errorReport(CO->em, CO_EM_ISR_TIMER_OVERFLOW, CO_EMC_SOFTWARE_INTERNAL, 0);
        CO_TMR_ISR_FLAG = 0;
    }

    /* calculate cycle time for performance measurement */
    uint16_t t = CO_TMR_TMR / (CO_FCY / 100);
    OD_performance[ODA_performance_timerCycleTime] = t;
    if(t > OD_performance[ODA_performance_timerCycleMaxTime])
        OD_performance[ODA_performance_timerCycleMaxTime] = t;
}


/* CAN interrupt function *****************************************************/
CO_CAN_ISR(){
    CO_CANinterrupt(CO->CANmodule[0]);
    /* Clear combined Interrupt flag */
    CO_CAN_ISR_FLAG = 0;
}
