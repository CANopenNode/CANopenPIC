/*
 * Application program for CANopen IO device on Max32 board with PIC32
 *
 * @file        appl_max32_demo.c
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

#include "application.h"
#include "OD.h"


/* CANopen LED diodes, as present on Explorer 16 and Max32 boards. */
#define CAN_INIT_LEDS() TRISAbits.TRISA2 = TRISCbits.TRISC1 = TRISAbits.TRISA3=0
#define CAN_RUN_LED LATAbits.LATA2 = LATCbits.LATC1
#define CAN_ERROR_LED LATAbits.LATA3


/******************************************************************************/
CO_ReturnError_t app_programStart(uint16_t *bitRate,
                                  uint8_t *nodeId,
                                  uint32_t *errInfo)
{
    /* CANopen led diodes */
    CAN_INIT_LEDS();
    CAN_RUN_LED = 0;
    CAN_ERROR_LED = 1;

    /* Place for peripheral or any other startup configuration. See main_PIC32.c
     * for defaults. */

    /* Set initial CAN bitRate and CANopen nodeId. May be configured by LSS. */
    if (*bitRate == 0) *bitRate = 250;
    if (*nodeId == 0) *nodeId = 0x30;

    return CO_ERROR_NO;
}


/******************************************************************************/
void app_communicationReset(CO_t *co) {
    if (!co->nodeIdUnconfigured) {

    }
}


/******************************************************************************/
void app_programEnd() {
    CAN_RUN_LED = 0; CAN_ERROR_LED = 0;
}


/******************************************************************************/
void app_programAsync(CO_t *co, uint32_t timer1usDiff) {
    /* Here can be slower code, all must be non-blocking. Mind race conditions
     * between this functions and following three functions, which all run from
     * realtime timer interrupt */
}


/******************************************************************************/
void app_programRt(CO_t *co, uint32_t timer1usDiff) {

}


/******************************************************************************/
void app_peripheralRead(CO_t *co) {

    /* All analog inputs must be read or interrupt source for RT thread won't be
     * cleared. See analog input configuration in main_PIC32.c */
    volatile uint32_t dummyRead;
    dummyRead = ADC1BUF0;
    dummyRead = ADC1BUF1;
    dummyRead = ADC1BUF2;
    dummyRead = ADC1BUF3;
    dummyRead = ADC1BUF4;
    dummyRead = ADC1BUF5;
    dummyRead = ADC1BUF6;
    dummyRead = ADC1BUF7;
    dummyRead = ADC1BUF8;
    dummyRead = ADC1BUF9;
    dummyRead = ADC1BUFA;
    dummyRead = ADC1BUFB;
    dummyRead = ADC1BUFC;
    dummyRead = ADC1BUFD;
    dummyRead = ADC1BUFE;
    dummyRead = ADC1BUFF;
    //OD_RAM.x6401_readAnalogInput_16_bit[0xF] = ADC1BUFF;

    /* Read digital inputs */
    //uint8_t digIn = 0;
    //if(PORTDbits.RD6 != 0) digIn |= 0x08;
    //if(PORTDbits.RD7 != 0) digIn |= 0x04;
    //if(PORTDbits.RD13 != 0) digIn |= 0x01;
    //OD_RAM.x6000_readDigitalInput_8_bit[0] = digIn;
}


/******************************************************************************/
void app_peripheralWrite(CO_t *co) {
    CAN_RUN_LED = CO_LED_GREEN(co->LEDs, CO_LED_CANopen);
    CAN_ERROR_LED = CO_LED_RED(co->LEDs, CO_LED_CANopen);

    /* Write to digital outputs */
    //uint8_t digOut = OD_RAM.x6200_writeDigitalOutput_8_bit[0];
    //LATAbits.LATA0 = (digOut & 0x01) ? 1 : 0;
    //LATAbits.LATA1 = (digOut & 0x02) ? 1 : 0;
    //LATAbits.LATA4 = (digOut & 0x10) ? 1 : 0;
    //LATAbits.LATA5 = (digOut & 0x20) ? 1 : 0;
    //LATAbits.LATA6 = (digOut & 0x40) ? 1 : 0;
    //LATAbits.LATA7 = (digOut & 0x80) ? 1 : 0;
}
