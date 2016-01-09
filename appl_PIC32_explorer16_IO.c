/*
 * Application program for CANopen IO device on Microchip PIC32 on Explorer16
 * demo board.
 *
 * @file        appl_PIC32_explorer16_IO.c
 * @author      Janez Paternoster
 * @copyright   2010 - 2015 Janez Paternoster
 *
 * This file is part of CANopenNode, an opensource CANopen Stack.
 * Project home page is <https://github.com/CANopenNode/CANopenNode>.
 * For more information on CANopen see <http://www.can-cia.org/>.
 *
 * CANopenNode is free and open source software: you can redistribute
 * it and/or modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * Following clarification and special exception to the GNU General Public
 * License is included to the distribution terms of CANopenNode:
 *
 * Linking this library statically or dynamically with other modules is
 * making a combined work based on this library. Thus, the terms and
 * conditions of the GNU General Public License cover the whole combination.
 *
 * As a special exception, the copyright holders of this library give
 * you permission to link this library with independent modules to
 * produce an executable, regardless of the license terms of these
 * independent modules, and to copy and distribute the resulting
 * executable under terms of your choice, provided that you also meet,
 * for each linked independent module, the terms and conditions of the
 * license of that module. An independent module is a module which is
 * not derived from or based on this library. If you modify this
 * library, you may extend this exception to your version of the
 * library, but you are not obliged to do so. If you do not wish
 * to do so, delete this exception statement from your version.
 */


/*
 * This file is tested on explorer16 board from Microchip. Microcontroller is
 * PIC32MX795F512L. D3 and D4 LEDs are used as CANopen status LEDs (D4 should
 * be red). Device sends bootup and Heartbeat message. Default NodeID is 0x30.
 * Implemented is simple CANopen I/O device profile (DS401):
 *  - TPDO with address 0x1B0 is send, if any button (S3, S6, S4) is pressed.
 *  - LED diodes (D5...D10) are controlled by two bytes long RPDO on
 *     CAN address 0x230 (upper six bits from first byte are used to control LEDs).
 */


#include "CANopen.h"
#include "application.h"


/* Global variables */


/*
 * Indexes and Error codes for application specific errors. For information on
 * error control see CO_Emergency.h file.
 *
 * 'Error status bits' from 00 to 2F are reserved for use by the CANopen stack.
 * Values 30 to 3F are used here as application informative errors.
 * Values 40 to 4F are used here as application critical errors.
 */
#if ODL_errorStatusBits_stringLength < 10
    #error Error in Object Dictionary!
#endif

typedef enum{
    CO_EMA_TEST1_INFORMATIVE        = 0x30,
    CO_EMA_TEST2_CRITICAL           = 0x40
}CO_EM_ApplicationErrorStatusBits_t;


/*
 * Function - ODF_testDomain
 *
 * Function for accessing _test var_ (index 0x2120) from SDO server.
 *
 * For more information see topic <Object dictionary function>.
 */
#define ODF_testDomain_index     0x2120
CO_SDO_abortCode_t ODF_testDomain(CO_ODF_arg_t *ODF_arg);


/******************************************************************************/
void programStart(void){

    /* Initialize two CAN led diodes */
    #define CAN_RUN_LED        LATAbits.LATA0
    #define CAN_ERROR_LED      LATAbits.LATA1
    TRISAbits.TRISA0 = 0;
    TRISAbits.TRISA1 = 0;
    CAN_RUN_LED = 0;      CAN_ERROR_LED = 1;

    /* Initialize other LED diodes for RPDO */
    TRISAbits.TRISA2 = 0; LATAbits.LATA2 = 0;
    TRISAbits.TRISA3 = 0; LATAbits.LATA3 = 0;
    TRISAbits.TRISA4 = 0; LATAbits.LATA4 = 0;
    TRISAbits.TRISA5 = 0; LATAbits.LATA5 = 0;
    TRISAbits.TRISA6 = 0; LATAbits.LATA6 = 0;
    TRISAbits.TRISA7 = 0; LATAbits.LATA7 = 0;
}


/******************************************************************************/
void communicationReset(void){
    CAN_RUN_LED = 0; CAN_ERROR_LED = 0;
    OD_writeOutput8Bit[0] = 0;
    OD_writeOutput8Bit[1] = 0;

    /* Configure Object dictionary entry at index 0x2120 */
    CO_OD_configure(CO->SDO[0], ODF_testDomain_index, ODF_testDomain, 0, 0, 0);
}


/******************************************************************************/
void programEnd(void){
    CAN_RUN_LED = 0; CAN_ERROR_LED = 0;
}


/******************************************************************************/
void programAsync(uint16_t timer1msDiff){

    CAN_RUN_LED = LED_GREEN_RUN(CO->NMT);
    CAN_ERROR_LED = LED_RED_ERROR(CO->NMT);

    /* Is any application critical error set? */
    /* If error register is set, device will leave operational state. */
    if(CO->em->errorStatusBits[8] || CO->em->errorStatusBits[9])
        *CO->emPr->errorRegister |= 0x20;
}


/******************************************************************************/
void program1ms(void){
    uint8_t leds, buttons;

    /* Read RPDO and show it on LEDS on Explorer16. */
    leds = OD_writeOutput8Bit[0];
    LATAbits.LATA2 = (leds&0x04) ? 1 : 0;
    LATAbits.LATA3 = (leds&0x08) ? 1 : 0;
    LATAbits.LATA4 = (leds&0x10) ? 1 : 0;
    LATAbits.LATA5 = (leds&0x20) ? 1 : 0;
    LATAbits.LATA6 = (leds&0x40) ? 1 : 0;
    LATAbits.LATA7 = (leds&0x80) ? 1 : 0;


    /* Verify operating state of this node */
    /* LATAbits.LATA2 = (CO->NMT->operatingState == CO_NMT_OPERATIONAL) ? 1 : 0; */

    /* Verify operating state of monitored nodes */
    /* LATAbits.LATA3 = (CO->HBcons->allMonitoredOperational) ? 1 : 0; */

    /* Example error is simulated from buttons on Explorer16 */
    if(!PORTDbits.RD6) CO_errorReport(CO->em, CO_EMA_TEST1_INFORMATIVE, CO_EMC_GENERIC, 0x12345678L);
    if(!PORTDbits.RD7) CO_errorReset(CO->em, CO_EMA_TEST1_INFORMATIVE, 0xAAAAAABBL);


    /* Prepare TPDO from buttons on Explorer16. */
    /* According to PDO mapping and communication parameters, first TPDO is sent */
    /* automatically on change of state of OD_readInput8Bit[0] variable. */
    buttons = 0;
    if(!PORTDbits.RD6)  buttons |= 0x08;
    if(!PORTDbits.RD7)  buttons |= 0x04;
    if(!PORTDbits.RD13) buttons |= 0x01;
    OD_readInput8Bit[0] = buttons;
}


#ifdef OD_testVar
/******************************************************************************/
/* Function passes some data to SDO server on testDomain variable access */
CO_SDO_abortCode_t ODF_testDomain(CO_ODF_arg_t *ODF_arg){

    /* domain data type is on subIndex 5, nothing to do on other subObjects */
    if(ODF_arg->subIndex != 5) return CO_SDO_AB_NONE;

    /* reading object dictionary */
    if(ODF_arg->reading){
        /* SDO buffer is filled with sequence 0x01, 0x02, ... */
        /* If domainFileSize is greater than SDObufferSize, this function will */
        /* be called multiple times during one SDO communication cycle */

        const uint32_t domainFileSize = 0x500;
        static uint32_t offset = 0;

        uint16_t i;
        uint16_t SDObufferSize = ODF_arg->dataLength;

        /* new SDO read cycle */
        if(ODF_arg->firstSegment){
            ODF_arg->dataLengthTotal = domainFileSize;
            offset = 0;
        }

        /* fill SDO buffer */
        for(i = 0; offset < domainFileSize; i++, offset++){
            if(i >= SDObufferSize){
                /* SDO buffer is full */
                ODF_arg->lastSegment = false;
                break;
            }
            ODF_arg->data[i] = (uint8_t)(offset+1);
        }

        /* all data was copied */
        if(offset == domainFileSize){
            ODF_arg->lastSegment = true;
            ODF_arg->dataLength = i;
        }

        /* return OK */
        return CO_SDO_AB_NONE;
    }

    /* writing object dictionary */
    else{
        uint16_t i;
        uint16_t err = 0;
        uint16_t dataSize = ODF_arg->dataLength;
        static uint32_t offset = 0;

        /* new SDO read cycle */
        if(ODF_arg->firstSegment){
            /* if(ODF_arg->dataLengthTotal) printf("\nWill receive %d bytes of data.\n", ODF_arg->dataLengthTotal); */
            offset = 0;
        }

        /* do something with data, here just verify if they are the same as above */
        for(i=0; i<dataSize; i++, offset++){
            uint8_t b = ODF_arg->data[i];
            if(b != (uint8_t)(offset+1)) err++;
            /* printf("%02X ", b); */
        }

        if(err) return CO_SDO_AB_INVALID_VALUE;

        /* end of transfer */
        /* if(ODF_arg->lastSegment) */
            /* printf("\nReceived %d bytes of data.\n", offset); */

        /* return OK */
        return CO_SDO_AB_NONE;
    }
}
#endif
