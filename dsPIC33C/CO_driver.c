/*
 * CAN module object for Microchip dsPIC33C microcontroller.
 *
 * @file        CO_driver.c
 * @author      Janez Paternoster
 * @author      Peter Rozsahegyi (EDS)
 * @author      Jens Nielsen (CAN receive)
 * @author      Julien Peyregne (dsPIC33C)
 * @copyright   2004 - 2024 Janez Paternoster
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


#include "301/CO_driver.h"

void CO_CANmodule_initFIFO(void *CANptr);
void CO_CANmodule_initFilterMask(CO_CANmodule_t  *CANmodule);
void CO_CANmodule_initInterrupt(void *CANptr);
void readRxMsgCAN_FIFO(CO_CANmodule_t *CANmodule, uint8_t FIFOnumber);


/* Globals */
    extern const CO_CANbitRateData_t  CO_CANbitRateData[8];
    
#if CAN_FIFO_ALLOCATE_RAM_SIZE > 0
    // Base address for the transmit event FIFO followed by the message objects
    uint8_t __attribute__((aligned(4))) CO_CANFIFOmsg[CAN_FIFO_ALLOCATE_RAM_SIZE];
#endif


/* Macro and Constants - CAN module registers offset. */
    #define CAN_REG(base, offset) (*((volatile uint16_t *) ((char *)(base) + (offset))))

    #define C_CONL         0x000
    #define C_CONH         0x002
    #define C_NBTCFGL      0x004
    #define C_NBTCFGH      0x006
    #define C_DBTCFGL      0x008
    #define C_DBTCFGH      0x00A
    #define C_TDCL         0x00C
    #define C_TDCH         0x00E
    #define C_TBCL         0x010
    #define C_TBCH         0x012
    #define C_TSCONL       0x014
    #define C_TSCONH       0x016
    #define C_VECL         0x018
    #define C_VECH         0x01A
    #define C_INTL         0x01C
    #define C_INTH         0x01E
    #define C_RXIFL        0x020
    #define C_RXIFH        0x022
    #define C_TXIFL        0x024
    #define C_TXIFH        0x026
    #define C_RXOVIFL      0x028
    #define C_RXOVIFH      0x02A
    #define C_TXATIFL      0x02C
    #define C_TXATIFH      0x02E
    #define C_TXREQL       0x030
    #define C_TXREQH       0x032
    #define C_TRECL        0x034
    #define C_TRECH        0x036
    #define C_BDIAG0L      0x038
    #define C_BDIAG0H      0x03A
    #define C_BDIAG1L      0x03C
    #define C_BDIAG1H      0x03E
    #define C_TEFCONL      0x040
    #define C_TEFCONH      0x042
    #define C_TEFSTA       0x044
    #define C_TEFUAL       0x048
    #define C_TEFUAH       0x04A
    #define C_FIFOBAL      0x04C
    #define C_FIFOBAH      0x04E
    #define C_TXQCONL      0x050
    #define C_TXQCONH      0x052
    #define C_TXQSTA       0x054
    #define C_TXQUAL       0x058
    #define C_TXQUAH       0x05A
    #define C_FIFOCON1L    0x05C
    #define C_FIFOCON1H    0x05E
    #define C_FIFOSTA1     0x060
    #define C_FIFOUA1L     0x064
    #define C_FIFOUA1H     0x066
    #define C_FIFOCON2L    0x068
    #define C_FIFOCON2H    0x06A
    #define C_FIFOSTA2     0x06C
    #define C_FIFOUA2L     0x06E
    #define C_FIFOUA2H     0x070
    #define C_FIFOCON3L    0x072
    #define C_FIFOCON3H    0x074
    #define C_FIFOSTA3     0x078
    #define C_FIFOUA3L     0x07C
    #define C_FIFOUA3H     0x07E
    #define C_FIFOCON4L    0x080
    #define C_FIFOCON4H    0x082
    #define C_FIFOSTA4     0x084
    #define C_FIFOUA4L     0x088
    #define C_FIFOUA4H     0x08A
    #define C_FIFOCON5L    0x08C
    #define C_FIFOCON5H    0x08E
    #define C_FIFOSTA5     0x090
    #define C_FIFOUA5L     0x094
    #define C_FIFOUA5H     0x096
    #define C_FIFOCON6L    0x098
    #define C_FIFOCON6H    0x09A
    #define C_FIFOSTA6     0x09C
    #define C_FIFOUA6L     0x0A0
    #define C_FIFOUA6H     0x0A2
    #define C_FIFOCON7L    0x0A4
    #define C_FIFOCON7H    0x0A6
    #define C_FIFOSTA7     0x0A8
    #define C_FIFOUA7L     0x0AC
    #define C_FIFOUA7H     0x0AE
    #define C_FLTCON0L     0x0B0
    #define C_FLTCON0H     0x0B2
    #define C_FLTCON1L     0x0B4
    #define C_FLTCON1H     0x0B6
    #define C_FLTCON2L     0x0B8
    #define C_FLTCON2H     0x0BA
    #define C_FLTCON3L     0x0BC
    #define C_FLTCON3H     0x0BE
    #define C_FLTOBJ0L     0x0C0
    #define C_FLTOBJ0H     0x0C2
    #define C_MASK0L       0x0C4
    #define C_MASK0H       0x0C6
    #define C_FLTOBJ1L     0x0C8
    #define C_FLTOBJ1H     0x0CA
    #define C_MASK1L       0x0CC
    #define C_MASK1H       0x0CE
    #define C_FLTOBJ2L     0x0D0
    #define C_FLTOBJ2H     0x0D2
    #define C_MASK2L       0x0D4
    #define C_MASK2H       0x0D6
    #define C_FLTOBJ3L     0x0D8
    #define C_FLTOBJ3H     0x0DA
    #define C_MASK3L       0x0DC
    #define C_MASK3H       0x0DE
    #define C_FLTOBJ4L     0x0E0
    #define C_FLTOBJ4H     0x0E2
    #define C_MASK4L       0x0E4
    #define C_MASK4H       0x0E6
    #define C_FLTOBJ5L     0x0E8
    #define C_FLTOBJ5H     0x0EA
    #define C_MASK5L       0x0EC
    #define C_MASK5H       0x0EE
    #define C_FLTOBJ6L     0x0F0
    #define C_FLTOBJ6H     0x0F2
    #define C_MASK6L       0x0F4
    #define C_MASK6H       0x0F6
    #define C_FLTOBJ7L     0x0F8
    #define C_FLTOBJ7H     0x0FA
    #define C_MASK7L       0x0FC
    #define C_MASK7H       0x0FE
    #define C_FLTOBJ8L     0x100
    #define C_FLTOBJ8H     0x102
    #define C_MASK8L       0x104
    #define C_MASK8H       0x106
    #define C_FLTOBJ9L     0x108
    #define C_FLTOBJ9H     0x10A
    #define C_MASK9L       0x10C
    #define C_MASK9H       0x10E
    #define C_FLTOBJ10L    0x110
    #define C_FLTOBJ10H    0x112
    #define C_MASK10L      0x114
    #define C_MASK10H      0x116
    #define C_FLTOBJ11L    0x118
    #define C_FLTOBJ11H    0x11A
    #define C_MASK11L      0x11C
    #define C_MASK11H      0x11E
    #define C_FLTOBJ12L    0x120
    #define C_FLTOBJ12H    0x122
    #define C_MASK12L      0x124
    #define C_MASK12H      0x126
    #define C_FLTOBJ13L    0x128
    #define C_FLTOBJ13H    0x12A
    #define C_MASK13L      0x12C
    #define C_MASK13H      0x12E
    #define C_FLTOBJ14L    0x130
    #define C_FLTOBJ14H    0x132
    #define C_MASK14L      0x134
    #define C_MASK14H      0x136
    #define C_FLTOBJ15L    0x138
    #define C_FLTOBJ15H    0x13A
    #define C_MASK15L      0x13C
    #define C_MASK15H      0x13E


/******************************************************************************/
void CO_CANsetConfigurationMode(void *CANptr){
    uint16_t C_CONHcopy = CAN_REG(CANptr, C_CONH);

    /* set REQOP = 0x4 */
    C_CONHcopy &= 0xF8FF;
    C_CONHcopy |= 0x0400;
    CAN_REG(CANptr, C_CONH) = C_CONHcopy;

    /* while OPMODE != 4 */
    while((CAN_REG(CANptr, C_CONH) & 0x00E0) != 0x0080);
}


/******************************************************************************/
void CO_CANsetNormalMode(CO_CANmodule_t *CANmodule){
    uint16_t C_CONHcopy = CAN_REG(CANmodule->CANptr, C_CONH);

    /* set REQOP = 0x6 : CAN2.0 */
    C_CONHcopy &= 0xF8FF;
    C_CONHcopy |= 0x0600;
    CAN_REG(CANmodule->CANptr, C_CONH) = C_CONHcopy;

    /* while OPMODE != 6 */
    while((CAN_REG(CANmodule->CANptr, C_CONH) & 0x00E0) != 0x00C0);
    
    CANmodule->CANnormal = true;
}


/******************************************************************************/
CO_ReturnError_t CO_CANmodule_init(
        CO_CANmodule_t         *CANmodule,
        void                   *CANptr,
        CO_CANrx_t              rxArray[],
        uint16_t                rxSize,
        CO_CANtx_t              txArray[],
        uint16_t                txSize,
        uint16_t                CANbitRate)
{
    uint16_t i;
    const CO_CANbitRateData_t *CANbitRateData = NULL;

    /* verify arguments */
    if(CANmodule==NULL || rxArray==NULL || txArray==NULL){
        return CO_ERROR_ILLEGAL_ARGUMENT;
    }

    /* Get global addresses for CAN module 1 or 2. */
    if(CANptr == ADDR_CAN1) {
        C1FIFOBAL = (uint16_t) &CO_CANFIFOmsg;
    }
    else if(CANptr == ADDR_CAN2) {
        C2FIFOBAL = (uint16_t) &CO_CANFIFOmsg;
    }
    else {
        return CO_ERROR_ILLEGAL_ARGUMENT;
    }

    /* Configure object variables */
    CANmodule->CANptr = CANptr;
    CANmodule->rxArray = rxArray;
    CANmodule->rxSize = rxSize;
    CANmodule->txArray = txArray;
    CANmodule->txSize = txSize;
    CANmodule->CANerrorStatus = 0;
    CANmodule->CANnormal = false;
    CANmodule->useCANrxFilters = (rxSize <= 16) ? true : false;
    CANmodule->bufferInhibitFlag = false;
    CANmodule->firstCANtxMessage = true;
    CANmodule->CANtxCount = 0;
    CANmodule->errOld = 0;

    for(i=0U; i<rxSize; i++){
        rxArray[i].ident = 0;
        rxArray[i].mask = 0xFFFFU;
        rxArray[i].object = NULL;
        rxArray[i].CANrx_callback = NULL;
    }
    for(i=0U; i<txSize; i++){
        txArray[i].bufferFull = false;
    }
    
    CAN_REG(CANptr, C_CONH) |= 0x0800; // Abort all pending Tx (ABAT)

    /* Configure control registers */
    CAN_REG(CANptr, C_CONH) = 0x0400;
    CAN_REG(CANptr, C_CONL) = 0x9760;

    /* Configure CAN timing */
    for (i=0; i<(sizeof(CO_CANbitRateData)/sizeof(CO_CANbitRateData[0])); i++) {
        if (CO_CANbitRateData[i].bitrate == CANbitRate) {
            CANbitRateData = &CO_CANbitRateData[i];
            break;
        }
    }
    if (CANbitRate == 0 || CANbitRateData == NULL) {
        return CO_ERROR_ILLEGAL_BAUDRATE;
    }
    
    CO_CANmodule_initFIFO(CANptr);
    CO_CANmodule_initFilterMask(CANmodule);
    
    //Nominal bit rate
    CAN_REG(CANptr, C_NBTCFGH) = ((CANbitRateData->NBRP - 1) << 8) | 
            (CANbitRateData->NtSeg1 - 1);
    CAN_REG(CANptr, C_NBTCFGL) = ((CANbitRateData->NtSeg2 - 1) << 8) | 
            (CANbitRateData->NSJW - 1);

    //Data bit rate
    CAN_REG(CANptr, C_DBTCFGH) = ((CANbitRateData->DBRP - 1) << 8) | 
            (CANbitRateData->DtSeg1 - 1);
    CAN_REG(CANptr, C_DBTCFGL) = ((CANbitRateData->DtSeg2 - 1) << 8) | 
            (CANbitRateData->DSJW - 1);
        
        //Filtering + Compensation
//        C1TDCHbits.EDGFLTEN = 0;    //Edge filtering is disabled
//        C1TDCHbits.SID11EN = 0;     //Does not use RRS; SID[10:0]
//        C1TDCHbits.TDCMOD = 0b11;   //Auto: Measures delay and adds TSEG1[4:0] (C1DBTCFGH[4:0]); adds TDCO[6:0]

    CAN_REG(CANptr, C_TDCL) = ((uint16_t)38 << 8) | // TDCO : Transmitter Delay Compensation Offset bits
            (0); // TDCV : Transmitter Delay Compensation Value bits

    CAN_REG(CANptr, C_TSCONH) &= 0xFFFE; // Stops and resets TBC

    /* setup RX and TX control registers */
    CAN_REG(CANptr, C_FIFOSTA1) = 0;
    CAN_REG(CANptr, C_FIFOSTA2) = 0;
    CAN_REG(CANptr, C_FIFOSTA3) = 0;
    CAN_REG(CANptr, C_FIFOSTA4) = 0;
    CAN_REG(CANptr, C_FIFOSTA5) = 0;
    CAN_REG(CANptr, C_FIFOSTA6) = 0;
    CAN_REG(CANptr, C_FIFOSTA7) = 0;

    /* use one FIFO for transmission */
    CAN_REG(CANptr, C_TXQCONL) |= 0x0400; // Reset FIFO

    CAN_REG(CANptr, C_CONH) |= 0x0010; // Enables TXQ and reserves space in RAM

    // Configure Tx Queue
    // - Payload Size = 8 data bytes
    // - FIFO is 32 messages deep
    // - Unlimited number of retransmission attempts
    // - Lowest message priority
    CAN_REG(CANptr, C_TXQCONH) = 0x1F60;

    CAN_REG(CANptr, C_TXQCONL) |= 0x0010; // Transmit Attempts Exhausted Interrupt Enable
    CAN_REG(CANptr, C_TXQCONL) &= 0xFFFB; // Transmit Queue Empty Interrupt disabled
    CAN_REG(CANptr, C_TXQCONL) &= 0xFFFE; // Transmit Queue Not Full Interrupt disabled

    /* CAN module hardware filters */
    CAN_REG(CANptr, C_FIFOCON1L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON1H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON2L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON2H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON3L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON3H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON4L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON4H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON5L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON5H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON6L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON6H) = 0x1F60;
    CAN_REG(CANptr, C_FIFOCON7L) = 0x040D;
    CAN_REG(CANptr, C_FIFOCON7H) = 0x1F60;

    CAN_REG(CANptr, C_FLTCON0L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON1L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON2L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON3L) = 0x8181;

    
    /* CAN interrupt registers */
    /* clear interrupt flags */
    /* enable receive and transmit interrupt */
    CO_CANmodule_initInterrupt(CANptr);

    return CO_ERROR_NO;
}

inline void CO_CANmodule_initFIFO(void *CANptr)
{
    // FIFO 1
    CAN_REG(CANptr, C_FIFOCON1L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON1H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON1H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON1H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON1H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 2
    CAN_REG(CANptr, C_FIFOCON2L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON2H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON2H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON2H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON2H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 3
    CAN_REG(CANptr, C_FIFOCON3L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON3H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON3H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON3H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON3H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 4
    CAN_REG(CANptr, C_FIFOCON4L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON4H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON4H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON4H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON4H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 5
    CAN_REG(CANptr, C_FIFOCON5L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON5H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON5H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON5H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON5H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 6
    CAN_REG(CANptr, C_FIFOCON6L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON6H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON6H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON6H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON6H) &= 0xFFE0; // Message transmit lowest priority
    
    // FIFO 7
    CAN_REG(CANptr, C_FIFOCON7L) = 0x0400; // Reset FIFO
    CAN_REG(CANptr, C_FIFOCON7H) &= 0x1FFF; // Payload Size 8 data bytes
    CAN_REG(CANptr, C_FIFOCON7H) |= 0x1F00; // FIFO is 16 messages deep
    CAN_REG(CANptr, C_FIFOCON7H) &= 0xFF9F; // Disables retransmission attempts
    CAN_REG(CANptr, C_FIFOCON7H) &= 0xFFE0; // Message transmit lowest priority
}

inline void CO_CANmodule_initFilterMask(CO_CANmodule_t  *CANmodule)
{
    void *CANptr = CANmodule->CANptr;
    uint16_t maskValue;
    if(CANmodule->useCANrxFilters){
        maskValue = 0x07FF;
    }
    else{
        maskValue = 0;
    }
    
     // Disable all filters before changing filter or mask config
    CAN_REG(CANptr, C_FLTCON0H) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON0L) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON1H) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON1L) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON2H) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON2L) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON3H) &= 0x7777;
    CAN_REG(CANptr, C_FLTCON3L) &= 0x7777;
    
    // Filter & Mask 0
    CAN_REG(CANptr, C_FLTOBJ0H) = 0;
    CAN_REG(CANptr, C_FLTOBJ0L) = 0x07FF;
    CAN_REG(CANptr, C_MASK0H) = 0x4000;
    CAN_REG(CANptr, C_MASK0L) = maskValue;
    CAN_REG(CANptr, C_FLTCON0H) = 0x8181; // Activate filters
    CAN_REG(CANptr, C_FLTCON0L) = 0x8181;
    
    // Filter & Mask 1
    CAN_REG(CANptr, C_FLTOBJ1H) = 0;
    CAN_REG(CANptr, C_FLTOBJ1L) = 0x07FF;
    CAN_REG(CANptr, C_MASK1H) = 0x4000;
    CAN_REG(CANptr, C_MASK1L) = maskValue;
    
    // Filter & Mask 2
    CAN_REG(CANptr, C_FLTOBJ2H) = 0;
    CAN_REG(CANptr, C_FLTOBJ2L) = 0x07FF;
    CAN_REG(CANptr, C_MASK2H) = 0x4000;
    CAN_REG(CANptr, C_MASK2L) = maskValue;
    
    // Filter & Mask 3
    CAN_REG(CANptr, C_FLTOBJ3H) = 0;
    CAN_REG(CANptr, C_FLTOBJ3L) = 0x07FF;
    CAN_REG(CANptr, C_MASK3H) = 0x4000;
    CAN_REG(CANptr, C_MASK3L) = maskValue;
    
    // Filter & Mask 4
    CAN_REG(CANptr, C_FLTOBJ4H) = 0;
    CAN_REG(CANptr, C_FLTOBJ4L) = 0x07FF;
    CAN_REG(CANptr, C_MASK4H) = 0x4000;
    CAN_REG(CANptr, C_MASK4L) = maskValue;
    
    // Filter & Mask 5
    CAN_REG(CANptr, C_FLTOBJ5H) = 0;
    CAN_REG(CANptr, C_FLTOBJ5L) = 0x07FF;
    CAN_REG(CANptr, C_MASK5H) = 0x4000;
    CAN_REG(CANptr, C_MASK5L) = maskValue;
    
    // Filter & Mask 6
    CAN_REG(CANptr, C_FLTOBJ6H) = 0;
    CAN_REG(CANptr, C_FLTOBJ6L) = 0x07FF;
    CAN_REG(CANptr, C_MASK6H) = 0x4000;
    CAN_REG(CANptr, C_MASK6L) = maskValue;
    
    // Filter & Mask 7
    CAN_REG(CANptr, C_FLTOBJ7H) = 0;
    CAN_REG(CANptr, C_FLTOBJ7L) = 0x07FF;
    CAN_REG(CANptr, C_MASK7H) = 0x4000;
    CAN_REG(CANptr, C_MASK7L) = maskValue;
    
    // Filter & Mask 8
    CAN_REG(CANptr, C_FLTOBJ8H) = 0;
    CAN_REG(CANptr, C_FLTOBJ8L) = 0x07FF;
    CAN_REG(CANptr, C_MASK8H) = 0x4000;
    CAN_REG(CANptr, C_MASK8L) = maskValue;
    
    // Filter & Mask 9
    CAN_REG(CANptr, C_FLTOBJ9H) = 0;
    CAN_REG(CANptr, C_FLTOBJ9L) = 0x07FF;
    CAN_REG(CANptr, C_MASK9H) = 0x4000;
    CAN_REG(CANptr, C_MASK9L) = maskValue;
    
    // Filter & Mask 10
    CAN_REG(CANptr, C_FLTOBJ10H) = 0;
    CAN_REG(CANptr, C_FLTOBJ10L) = 0x07FF;
    CAN_REG(CANptr, C_MASK10H) = 0x4000;
    CAN_REG(CANptr, C_MASK10L) = maskValue;
    
    // Filter & Mask 11
    CAN_REG(CANptr, C_FLTOBJ11H) = 0;
    CAN_REG(CANptr, C_FLTOBJ11L) = 0x07FF;
    CAN_REG(CANptr, C_MASK11H) = 0x4000;
    CAN_REG(CANptr, C_MASK11L) = maskValue;
    
    // Filter & Mask 12
    CAN_REG(CANptr, C_FLTOBJ12H) = 0;
    CAN_REG(CANptr, C_FLTOBJ12L) = 0x07FF;
    CAN_REG(CANptr, C_MASK12H) = 0x4000;
    CAN_REG(CANptr, C_MASK12L) = maskValue;
    
    // Filter & Mask 13
    CAN_REG(CANptr, C_FLTOBJ13H) = 0;
    CAN_REG(CANptr, C_FLTOBJ13L) = 0x07FF;
    CAN_REG(CANptr, C_MASK13H) = 0x4000;
    CAN_REG(CANptr, C_MASK13L) = maskValue;
    
    // Filter & Mask 14
    CAN_REG(CANptr, C_FLTOBJ14H) = 0;
    CAN_REG(CANptr, C_FLTOBJ14L) = 0x07FF;
    CAN_REG(CANptr, C_MASK14H) = 0x4000;
    CAN_REG(CANptr, C_MASK14L) = maskValue;
    
    // Filter & Mask 15
    CAN_REG(CANptr, C_FLTOBJ15H) = 0;
    CAN_REG(CANptr, C_FLTOBJ15L) = 0x07FF;
    CAN_REG(CANptr, C_MASK15H) = 0x4000;
    CAN_REG(CANptr, C_MASK15L) = maskValue;
    
    // Enable all filters and redirect to FIFO1
    CAN_REG(CANptr, C_FLTCON0H) = 0x8181;
    CAN_REG(CANptr, C_FLTCON0L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON1H) = 0x8181;
    CAN_REG(CANptr, C_FLTCON1L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON2H) = 0x8181;
    CAN_REG(CANptr, C_FLTCON2L) = 0x8181;
    CAN_REG(CANptr, C_FLTCON3H) = 0x8181;
    CAN_REG(CANptr, C_FLTCON3L) = 0x8181;
}

inline void CO_CANmodule_initInterrupt(void *CANptr)
{
    // Enable interrupts
    CAN_REG(CANptr, C_INTH) &= 0x7FFF; // Invalid Message Interrupt is disabled
    CAN_REG(CANptr, C_INTH) &= 0xBFFF; // Bus Wake-up Activity Interrupt is disabled
    CAN_REG(CANptr, C_INTH) |= 0x2000; // CAN Bus Error Interrupt is enabled
    CAN_REG(CANptr, C_INTH) |= 0x1000; // System Error Interrupt is enabled
    CAN_REG(CANptr, C_INTH) |= 0x0800; // Receive Buffer Overflow Interrupt is enabled
    CAN_REG(CANptr, C_INTH) &= 0xFBFF; // Transmit Attempt Interrupt is disabled
    CAN_REG(CANptr, C_INTH) |= 0x0010; // Transmit Event FIFO Interrupt is enabled
    CAN_REG(CANptr, C_INTH) &= 0xFFF7; // Mode Change Interrupt is disabled
    CAN_REG(CANptr, C_INTH) &= 0xFFFB; // CAN Timer Interrupt is disabled
    CAN_REG(CANptr, C_INTH) |= 0x0002; // Receive Object Interrupt is enabled
    CAN_REG(CANptr, C_INTH) |= 0x0001; // Transmit Object Interrupt is enabled
    
    // Clear all interrupt flags
    CAN_REG(CANptr, C_INTL) = 0;
    
    // Interrupts better activated in user program, at the end of CANopen initializations
//    if(CANptr == ADDR_CAN1)
//    {
//        IEC3bits.C1TXIE = 1;         // Enable TX interrupt
//        IEC1bits.C1RXIE = 1;         // Enable RX interrupt
//        IEC1bits.C1IE = 1;           // Enable info interrupt
//
//        // Reset interrupt flags
//        IFS3bits.C1TXIF = 0;
//        IFS1bits.C1RXIF = 0;
//        IFS1bits.C1IF = 0;
//    }
//    else
//    {
//        IEC3bits.C2TXIE = 1;         // Enable TX interrupt
//        IEC2bits.C2RXIE = 1;         // Enable RX interrupt
//        IEC2bits.C2IE = 1;           // Enable info interrupt
//
//        // Reset interrupt flags
//        IFS3bits.C2TXIF = 0;
//        IFS2bits.C2RXIF = 0;
//        IFS2bits.C2IF = 0;
//    }
}

/******************************************************************************/
void CO_CANmodule_disable(CO_CANmodule_t *CANmodule) {
    if (CANmodule != NULL) {
        CO_CANsetConfigurationMode(CANmodule->CANptr);
    }
}


/******************************************************************************/
CO_ReturnError_t CO_CANrxBufferInit(
        CO_CANmodule_t         *CANmodule,
        uint16_t                index,
        uint16_t                ident,
        uint16_t                mask,
        bool_t                  rtr,
        void                   *object,
        void                  (*CANrx_callback)(void *object, void *message))
{
    CO_ReturnError_t ret = CO_ERROR_NO;

    if((CANmodule!=NULL) && (object!=NULL) && (CANrx_callback!=NULL) && (index < CANmodule->rxSize))
    {
        /* buffer, which will be configured */
        CO_CANrx_t *buffer = &CANmodule->rxArray[index];
        uint16_t RXF, RXM;
        void *CANptr = CANmodule->CANptr;

        /* Configure object variables */
        buffer->object = object;
        buffer->CANrx_callback = CANrx_callback;

        /* CAN identifier and CAN mask, bit aligned with CAN module registers (in DMA RAM) */
        RXF = (ident & 0x07FF);
        RXM = (mask & 0x07FF);

        /* configure filter and mask */
        if(RXF != buffer->ident || RXM != buffer->mask)
        {
            buffer->ident = RXF;
            buffer->mask = RXM;

            /* Set CAN hardware module filter and mask. */
            if(CANmodule->useCANrxFilters)
            {
                uint16_t selectMask = 0;

                if(RXM != 0xFFE8)
                {
                    for(uint16_t i=0; (i<16U) && (selectMask == 0); i++)
                    {
                        uint16_t C_FLTCON_Offset =  (2U * (i/2U));
                        uint16_t MaskFiltRegOffset = i * (C_MASK1L - C_MASK0L);
                        
                        uint16_t *maskReg = (void*) &CAN_REG(CANptr, C_MASK0L + MaskFiltRegOffset);
                        uint16_t *filterReg = (void*) &CAN_REG(CANptr, C_FLTOBJ0L + MaskFiltRegOffset);
                                
                        if(((RXM == *maskReg) && ((RXF & RXM) == (*filterReg & RXM)))||
                        ((*maskReg == 0x07FF) && (*filterReg == 0x07FF)))
                        {
                            if(i%2U)
                            {
                                // Disable filter and clear configuration
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) &= 0xFF00U; 
                                // Configure filter match only standard ID
                                CAN_REG(CANptr, C_FLTOBJ0H + MaskFiltRegOffset) = 0;
                                *maskReg = RXM;
                                *filterReg = RXF; 
                                // Configure filter pointer to FIFO 1
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) |= 0x0001U; 
                                // Set MIDE, match messages that corresponds to filter
                                // identifier configuration
                                CAN_REG(CANptr, C_MASK0H + MaskFiltRegOffset) |= 0x4000U; 
                                // Enable filter
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) |= 0x0080U;
                            }
                            else
                            {
                                // Disable filter and clear configuration
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) &= 0x00FFU; 
                                // Configure filter match only standard ID
                                CAN_REG(CANptr, C_FLTOBJ0H + MaskFiltRegOffset) = 0;
                                *maskReg = RXM;
                                *filterReg = RXF; 
                                // Configure filter pointer to FIFO 1
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) |= 0x0100U; 
                                // Set MIDE, match messages that corresponds to filter
                                // identifier configuration
                                CAN_REG(CANptr, C_MASK0H + MaskFiltRegOffset) |= 0x4000U; 
                                // Enable filter
                                CAN_REG(CANptr, C_FLTCON0L + C_FLTCON_Offset) |= 0x8000U;
                            }
                            selectMask = i + 1U; 
                        }
                    }
                    
                    if(selectMask == 0)
                    {
                        /* not enough masks */
                        ret = CO_ERROR_OUT_OF_MEMORY;
                    }

                    if(selectMask != 0)
                    {
                        CANmodule->mapFlthitIndex[selectMask-1] = index;
                    }
                }
            }
        }
    }
    else
    {
        ret = CO_ERROR_ILLEGAL_ARGUMENT;
    }

    return ret;
}


/******************************************************************************/
CO_CANtx_t *CO_CANtxBufferInit(
        CO_CANmodule_t         *CANmodule,
        uint16_t                index,
        uint16_t                ident,
        bool_t                  rtr,
        uint8_t                 noOfBytes,
        bool_t                  syncFlag)
{
    CO_CANtx_t *buffer = NULL;

    if((CANmodule != NULL) && (index < CANmodule->txSize)){
        /* get specific buffer */
        buffer = &CANmodule->txArray[index];

        /* CAN identifier, bit aligned with CAN module registers */
        uint16_t TXF;
        TXF = (ident & 0x07FF) << 2;
        if(rtr){
            TXF |= 0x02;
        }

        /* write to buffer */
        buffer->ident = TXF;
        buffer->DLC = noOfBytes;
        buffer->bufferFull = false;
        buffer->syncFlag = syncFlag;
    }

    return buffer;
}


/* Copy message to CAN module - internal usage only.
 *
 * @param CANptr CAN module base address
 * @param dest Pointer to CAN module transmit buffer
 * @param src Pointer to source message
 */
static void CO_CANsendToModule(void *CANptr, CO_CANtx_t *src){
    uint8_t DLC;
    __eds__ uint8_t *CANdataBuffer;
    uint8_t *pData;
    volatile uint16_t C_TXQCONLold;
    CO_CANrxMsg_t Dest;

    /* CAN-ID + RTR */
    Dest.bF.id.SID = (src->ident & 0x1FFCU) >> 2U;

    /* Data lenght */
    DLC = src->DLC;
    if(DLC > 8) 
    {
        DLC = 8;
    }
    Dest.bF.ctrl.DLC = DLC;

    /* copy data */
    CANdataBuffer = &(Dest.bF.dataByte[0]);
    pData = src->data;
    for(; DLC>0; DLC--) 
    {
        *(CANdataBuffer++) = *(pData++);
    }

    /* control register, transmit request */
    uint16_t *AddrObjCAN = (uint16_t*)(CAN_REG(CANptr, C_TXQUAL));
    memcpy((void *)AddrObjCAN, (void *)&Dest, sizeof(CO_CANrxMsg_t));
    C_TXQCONLold = CAN_REG(CANptr, C_TXQCONL);
    C_TXQCONLold |= 0x300U; // Set UINC et TXREQ at the same time
    CAN_REG(CANptr, C_TXQCONL) = C_TXQCONLold;
}


/******************************************************************************/
CO_ReturnError_t CO_CANsend(CO_CANmodule_t *CANmodule, CO_CANtx_t *buffer){
    CO_ReturnError_t err = CO_ERROR_NO;
    void *CANptr = CANmodule->CANptr;
    
    /* Verify overflow */
    if(buffer->bufferFull){
        if(!CANmodule->firstCANtxMessage){
            /* don't set error, if bootup message is still on buffers */
            CANmodule->CANerrorStatus |= CO_CAN_ERRTX_OVERFLOW;
        }
        err = CO_ERROR_TX_OVERFLOW;
    }

    CO_LOCK_CAN_SEND();
    /* if CAN TX buffer is free, copy message to it */
    if((CAN_REG(CANptr, C_TXQCONL) & 0x0200U) == 0 && CANmodule->CANtxCount == 0){
        CANmodule->bufferInhibitFlag = buffer->syncFlag;
        CO_CANsendToModule(CANptr, buffer);
    }
    /* if no buffer is free, message will be sent by interrupt */
    else{
        buffer->bufferFull = true;
        CANmodule->CANtxCount++;
    }
    CO_UNLOCK_CAN_SEND();

    return err;
}


/******************************************************************************/
void CO_CANclearPendingSyncPDOs(CO_CANmodule_t *CANmodule){
    uint32_t tpdoDeleted = 0U;

    CO_LOCK_CAN_SEND();
    /* Abort message from CAN module, if there is synchronous TPDO.
     * Take special care with this functionality. */
    if(CANmodule->bufferInhibitFlag){
        /* clear TXREQ and UINC */
        CAN_REG(CANmodule->CANptr, C_TXQCONL) &= 0xFCFF;
        CANmodule->bufferInhibitFlag = false;
        tpdoDeleted = 1U;
    }
    /* delete also pending synchronous TPDOs in TX buffers */
    if(CANmodule->CANtxCount != 0U){
        uint16_t i;
        CO_CANtx_t *buffer = &CANmodule->txArray[0];
        for(i = CANmodule->txSize; i > 0U; i--){
            if(buffer->bufferFull){
                if(buffer->syncFlag){
                    buffer->bufferFull = false;
                    CANmodule->CANtxCount--;
                    tpdoDeleted = 2U;
                }
            }
            buffer++;
        }
    }
    CO_UNLOCK_CAN_SEND();


    if(tpdoDeleted != 0U){
        CANmodule->CANerrorStatus |= CO_CAN_ERRTX_PDO_LATE;
    }
}


/******************************************************************************/
void CO_CANmodule_process(CO_CANmodule_t *CANmodule) {
    uint16_t err;

    err = CAN_REG(CANmodule->CANptr, C_TRECH);
    if(CAN_REG(CANmodule->CANptr, C_INTL) & 0x0800){
        err |= 0x80;
    }

    if (CANmodule->errOld != err) {
        uint16_t status = CANmodule->CANerrorStatus;

        CANmodule->errOld = err;

        /* CAN RX bus overflow */
        if(err & 0x80){
            status |= CO_CAN_ERRRX_OVERFLOW;
            CAN_REG(CANmodule->CANptr, C_INTL) &= 0xF7FF;/* clear bits */
        }

        /* CAN TX bus off */
        if(err & 0x20){
            status |= CO_CAN_ERRTX_BUS_OFF;
        }
        else{
            status &= 0xFFFF ^ CO_CAN_ERRTX_BUS_OFF;
        }

        /* CAN TX bus passive */
        if(err & 0x10){
            if(!CANmodule->firstCANtxMessage) status |= CO_CAN_ERRTX_PASSIVE;
        }
        else{
            status &= 0xFFFF ^ (CO_CAN_ERRTX_PASSIVE | CO_CAN_ERRTX_OVERFLOW);
        }

        /* CAN RX bus passive */
        if(err & 0x08){
            status |= CO_CAN_ERRRX_PASSIVE;
        }
        else{
            status &= 0xFFFF ^ CO_CAN_ERRRX_PASSIVE;
        }

        /* CAN TX or RX bus warning */
        if(err & 0x19){
            status |= CO_CAN_ERRTX_WARNING | CO_CAN_ERRRX_WARNING;
        }
        else{
            status &= 0xFFFF ^ (CO_CAN_ERRTX_WARNING | CO_CAN_ERRRX_WARNING);
        }

        CANmodule->CANerrorStatus = status;
    }
}



inline void readRxMsgCAN_FIFO(CO_CANmodule_t *CANmodule, uint8_t FIFOnumber)
{
    volatile uint16_t *C_FIFOUAxL_ptr;
    volatile uint16_t *C_FIFOCONxL_ptr;
    switch(FIFOnumber)
    {
        case 1:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA1L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON1L);
            break;
        case 2:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA2L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON2L);
            break;
        case 3:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA3L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON3L);
            break;
        case 4:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA4L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON4L);
            break;
        case 5:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA5L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON5L);
            break;
        case 6:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA6L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON6L);
            break;
        case 7:
            C_FIFOUAxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOUA7L);
            C_FIFOCONxL_ptr = (void *) &CAN_REG(CANmodule->CANptr, C_FIFOCON7L);
            break;
        default:
            ;// TODO CAN err
    }
                
    //interrupt is pending
    volatile uint16_t C_FIFOCONxL = CAN_REG(CANmodule->CANptr, C_FIFOCON1L)
    if((*C_FIFOCONxL_ptr) & 0x0080) == 0)
    {
        uint16_t FIFOregOffset = (C_FIFOSTA2 - C_FIFOSTA1) * (FIFOnumber - 1U);
        volatile uint16_t C_FIFOSTA_val = CAN_REG(CANmodule->CANptr, (C_FIFOSTA1 + FIFOregOffset));
        if((C_FIFOSTA_val & 0x0005U) != 0)
        {
            // 1 = FIFO is no empty
            // While fifo isn't empty
            while((C_FIFOSTA_val & 0x0001U) != 0)
            { 
                //Read head address
                CO_CANrxMsg_t resMsg;
                volatile bool_t msgMatched = false;
                uint16_t * head;
                CO_CANrx_t *buffer = NULL;
                int index;
                head = (uint16_t*) *C_FIFOUAxL_ptr;
                memcpy((void *)&resMsg, (void *)head, sizeof(CO_CANrxMsg_t));
                *C_FIFOCONxL_ptr |= 0x0100U; // Set UINC
                // Check which filter was hit
                // Verify the buffer exist
                if(CANmodule->useCANrxFilters) 
                {
                    /* CAN module filters are used. Message with known 11-bit identifier has */
                    /* been received */
                    
                    index = CANmodule->mapFlthitIndex[resMsg.bF.ctrl.FilterHit];
                    if(index < CANmodule->rxSize) 
                    {
                        buffer = &CANmodule->rxArray[index];
                        /* verify also RTR */
                        if(((resMsg.bF.id.SID ^ buffer->ident) & buffer->mask) == 0U) 
                        {
                            msgMatched = true;
                        }
                    }
                }
                else 
                {
                    /* CAN module filters are not used, message with any standard 11-bit identifier */
                    /* has been received. Search rxArray form CANmodule for the same CAN-ID. */
                    buffer = &CANmodule->rxArray[0];
                    for(index = CANmodule->rxSize; index > 0U; index--) 
                    {
                        if(((resMsg.bF.id.SID ^ buffer->ident) & buffer->mask) == 0U) 
                        {
                            msgMatched = true;
                            break;
                        }
                        buffer++;
                    }
                }
                /* Call specific function, which will process the message */
                if(msgMatched && (buffer != NULL) && (buffer->CANrx_callback != NULL)) 
                {
                    buffer->CANrx_callback(buffer->object, (void *)&resMsg);
                }
                // Update FIFO status
                C_FIFOSTA_val = CAN_REG(CANmodule->CANptr, (C_FIFOSTA1 + FIFOregOffset));
            }
            /* Clear RXFUL flag */
            CAN_REG(CANmodule->CANptr, (C_FIFOSTA1 + FIFOregOffset)) &= 0xFFFBU;
        }
        CAN_REG(CANmodule->CANptr, (C_FIFOSTA1 + FIFOregOffset)) &= 0xFFF8U;
    }
}

/******************************************************************************/
void CO_CANinterrupt(CO_CANmodule_t *CANmodule) {

    /* receive interrupt (New CAN message is available in RX FIFO buffer) */
    if(CAN_REG(CANmodule->CANptr, C_INTL) & 0x02) {

        CO_DISABLE_INTERRUPTS();

        /* We will service the buffers indicated by RXFUL copy, clear interrupt
         * flag now and let interrupt hit again if more messages are received */
        CAN_REG(CANmodule->CANptr, C_INTL) &= 0xFFFD;
        CO_ENABLE_INTERRUPTS();
        
        // Read a message
        readRxMsgCAN_FIFO(CANmodule, 1);
    }


    /* transmit interrupt (TX buffer is free) */
    if(CAN_REG(CANmodule->CANptr, C_INTL) & 0x01) {

        /* Clear interrupt flag */
        CAN_REG(CANmodule->CANptr, C_INTL) &= 0xFFFE;
        /* First CAN message (bootup) was sent successfully */
        CANmodule->firstCANtxMessage = false;
        /* clear flag from previous message */
        CANmodule->bufferInhibitFlag = false;
        /* Are there any new messages waiting to be send */
        if(CANmodule->CANtxCount > 0U){
            uint16_t i;             /* index of transmitting message */

            /* first buffer */
            CO_CANtx_t *buffer = &CANmodule->txArray[0];
            /* search through whole array of pointers to transmit message buffers. */
            for(i = CANmodule->txSize; i > 0U; i--){
                /* if message buffer is full, send it. */
                if(buffer->bufferFull){
                    buffer->bufferFull = false;
                    CANmodule->CANtxCount--;

                    /* Copy message to CAN buffer */
                    CANmodule->bufferInhibitFlag = buffer->syncFlag;
                    CO_CANsendToModule(CANmodule->CANptr, buffer);
                    break;                      /* exit for loop */
                }
                buffer++;
            }/* end of for loop */

            /* Clear counter if no more messages */
            if(i == 0U){
                CANmodule->CANtxCount = 0U;
            }
        }
    }
}

void CO_CANinterruptRX(CO_CANmodule_t *CANmodule) 
{
    /* receive interrupt (New CAN message is available in RX FIFO buffer) */
    if(CAN_REG(CANmodule->CANptr, C_INTL) & 0x02) {
//        uint16_t C_RXIFLcopy;

        CO_DISABLE_INTERRUPTS();
//        C_RXIFLcopy = (CAN_REG(CANmodule->CANptr, C_RXIFL) >> 1U);

        /* We will service the buffers indicated by RXFUL copy, clear interrupt
         * flag now and let interrupt hit again if more messages are received */
        CAN_REG(CANmodule->CANptr, C_INTL) &= 0xFFFD;
        CO_ENABLE_INTERRUPTS();
        
        // Read a message
        readRxMsgCAN_FIFO(CANmodule, 1);
    }
}


void CO_CANinterruptTX(CO_CANmodule_t *CANmodule) 
{
    /* transmit interrupt (TX buffer is free) */
    if(CAN_REG(CANmodule->CANptr, C_INTL) & 0x01) {

        /* Clear interrupt flag */
        CAN_REG(CANmodule->CANptr, C_INTL) &= 0xFFFE;
        /* First CAN message (bootup) was sent successfully */
        CANmodule->firstCANtxMessage = false;
        /* clear flag from previous message */
        CANmodule->bufferInhibitFlag = false;
        /* Are there any new messages waiting to be send */
        if(CANmodule->CANtxCount > 0U){
            uint16_t i;             /* index of transmitting message */

            /* first buffer */
            CO_CANtx_t *buffer = &CANmodule->txArray[0];
            /* search through whole array of pointers to transmit message buffers. */
            for(i = CANmodule->txSize; i > 0U; i--){
                /* if message buffer is full, send it. */
                if(buffer->bufferFull){
                    buffer->bufferFull = false;
                    CANmodule->CANtxCount--;

                    /* Copy message to CAN buffer */
                    CANmodule->bufferInhibitFlag = buffer->syncFlag;
                    CO_CANsendToModule(CANmodule->CANptr, buffer);
                    break;                      /* exit for loop */
                }
                buffer++;
            }/* end of for loop */

            /* Clear counter if no more messages */
            if(i == 0U){
                CANmodule->CANtxCount = 0U;
            }
        }
    }
}

