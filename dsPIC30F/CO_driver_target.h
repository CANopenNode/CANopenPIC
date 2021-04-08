/*
 * Microchip dsPIC30F specific definitions for CANopenNode.
 *
 * @file        CO_driver_target.h
 * @author      Janez Paternoster
 * @copyright   2004 - 2020 Janez Paternoster
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


#ifndef CO_DRIVER_TARGET
#define CO_DRIVER_TARGET

/* This file contains device and application specific definitions.
 * It is included from CO_driver.h, which contains documentation
 * for definitions below. */

#include <xc.h>
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#ifdef CO_DRIVER_CUSTOM
#include "CO_driver_custom.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Stack configuration override from CO_driver.h.
 * For more information see file CO_config.h. */
#ifndef CO_CONFIG_SDO_CLI
#define CO_CONFIG_SDO_CLI (CO_CONFIG_SDO_CLI_ENABLE)
#endif

#ifndef CO_CONFIG_TIME
#define CO_CONFIG_TIME (CO_CONFIG_TIME_ENABLE)
#endif

#ifndef CO_CONFIG_CRC16
#define CO_CONFIG_CRC16 (CO_CONFIG_CRC16_ENABLE)
#endif

#ifndef CO_CONFIG_FIFO
#define CO_CONFIG_FIFO (CO_CONFIG_FIFO_ENABLE)
#endif

/* use global variables in CANopen.c instead of heap */
#define CO_USE_GLOBALS

/* Basic definitions */
#define CO_LITTLE_ENDIAN
#define CO_SWAP_16(x) x
#define CO_SWAP_32(x) x
#define CO_SWAP_64(x) x
#define CO_OWN_INTTYPES
#define PRIu32 "lu"
#define PRId32 "ld"
/* NULL is defined in stddef.h */
/* true and false are defined in stdbool.h */
/* int8_t to uint64_t are defined in stdint.h */
typedef unsigned char           bool_t;
typedef float                   float32_t;
typedef long double             float64_t;
typedef char                    char_t;
typedef unsigned char           oChar_t;
typedef unsigned char           domain_t;


/* CAN module base addresses */
#define ADDR_CAN1               ((void *)0x300)
#define ADDR_CAN2               ((void *)0x3C0)


/* CAN receive message structure as aligned in CAN module. */
typedef struct {
    uint16_t    ident;          /* Standard Identifier as aligned in CAN module. 16 bits:
                                  'UUUSSSSS SSSSSSRE' (U: unused; S: SID; R=SRR; E=IDE). */
    uint16_t    extIdent;       /* Extended identifier, not used here */
    uint16_t    DLC      :4;    /* Data length code (bits 0...3) */
    uint16_t    DLCrest  :12;   /* Not used here (bits 4..15) */
    uint8_t     data[8];        /* 8 data bytes */
    uint16_t    CON;            /* Control word */
} CO_CANrxMsg_t;

/* Access to received CAN message */
#define CO_CANrxMsg_readIdent(msg) ((((uint16_t)(((CO_CANrxMsg_t *)(msg))->ident))>>2)&0x7FF)
#define CO_CANrxMsg_readDLC(msg)   ((uint8_t)(((CO_CANrxMsg_t *)(msg))->DLC))
#define CO_CANrxMsg_readData(msg)  ((uint8_t *)(((CO_CANrxMsg_t *)(msg))->data))

/* Received message object */
typedef struct {
    uint16_t ident;
    uint16_t mask;
    void *object;
    void (*CANrx_callback)(void *object, void *message);
} CO_CANrx_t;

/* Transmit message object */
typedef struct {
    uint16_t ident; /* Standard Identifier as aligned in CAN module. 16 bits:
                     'SSSSSUUU SSSSSSRE' (U: unused; S: SID; R=SRR; E=IDE). */
    uint8_t DLC;
    uint8_t data[8];
    volatile bool_t bufferFull;
    volatile bool_t syncFlag;
} CO_CANtx_t;

/* CAN module object */
typedef struct {
    void *CANptr;
    CO_CANrx_t *rxArray;
    uint16_t rxSize;
    CO_CANtx_t *txArray;
    uint16_t txSize;
    uint16_t CANerrorStatus;
    volatile bool_t CANnormal;
    volatile bool_t useCANrxFilters;
    volatile bool_t bufferInhibitFlag;
    volatile bool_t firstCANtxMessage;
    volatile uint16_t CANtxCount;
    uint8_t errOld;
} CO_CANmodule_t;


/* (un)lock critical section in CO_CANsend() */
#define CO_LOCK_CAN_SEND()      asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_CAN_SEND()    asm volatile ("disi #0x0000")

/* (un)lock critical section in CO_errorReport() or CO_errorReset() */
#define CO_LOCK_EMCY()          asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_EMCY()        asm volatile ("disi #0x0000")

/* (un)lock critical section when accessing Object Dictionary */
#define CO_LOCK_OD()            asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_OD()          asm volatile ("disi #0x0000")

/* Synchronization between CAN receive and message processing threads. */
#define CO_MemoryBarrier()
#define CO_FLAG_READ(rxNew) ((rxNew) != NULL)
#define CO_FLAG_SET(rxNew) {CO_MemoryBarrier(); rxNew = (void*)1L;}
#define CO_FLAG_CLEAR(rxNew) {CO_MemoryBarrier(); rxNew = NULL;}


/* CAN bit rates
 *
 * CAN bit rates are initializers for array of eight CO_CANbitRateData_t
 * objects.
 *
 * Macros are not used by driver itself, they may be used by application with
 * combination with object CO_CANbitRateData_t.
 * Application must declare following global variable depending on CO_FCY used:
 * const CO_CANbitRateData_t  CO_CANbitRateData[8] = {CO_CANbitRateDataInitializers};
 *
 * There are initializers for eight objects, which corresponds to following
 * CAN bit rates (in kbps): 10, 20, 50, 125, 250, 500, 800, 1000.
 *
 * CO_FCY is internal instruction cycle clock frequency in kHz units. It is
 * calculated from oscillator frequency (FOSC [in kHz]) and PLL mode:
 *     - If PLL is not used -> FCY = FOSC / 4,
 *     - If PLL x 4 is used -> FCY = FOSC,
 *     - If PLL x 16 is used -> FCY = FOSC * 4
 *
 * Possible values for FCY are (in three groups):
 *     - Optimal CAN bit timing on all Baud Rates: 4000, 6000, 16000, 24000.
 *     - Not so optimal CAN bit timing on all Baud Rates: 2000, 8000.
 *     - not all CANopen Baud Rates possible: 1000, 1500, 2500, 3000, 5000,
 *       10000, 12000, 20000, 28000, 30000, 1843 (internal FRC, no PLL),
 *       7372 (internal FRC + 4*PLL).
 */
#ifdef CO_FCY
    /* Macros, which divides K into (SJW + PROP + PhSeg1 + PhSeg2) */
    #define TQ_x_4    1, 1, 1, 1
    #define TQ_x_5    1, 1, 2, 1
    #define TQ_x_6    1, 1, 3, 1
    #define TQ_x_8    1, 2, 3, 2
    #define TQ_x_9    1, 2, 4, 2
    #define TQ_x_10   1, 3, 4, 2
    #define TQ_x_12   1, 3, 6, 2
    #define TQ_x_14   1, 4, 7, 2
    #define TQ_x_15   1, 4, 8, 2  /* good timing */
    #define TQ_x_16   1, 5, 8, 2  /* good timing */
    #define TQ_x_17   1, 6, 8, 2  /* good timing */
    #define TQ_x_18   1, 7, 8, 2  /* good timing */
    #define TQ_x_19   1, 8, 8, 2  /* good timing */
    #define TQ_x_20   1, 8, 8, 3  /* good timing */
    #define TQ_x_21   1, 8, 8, 4
    #define TQ_x_25   1, 8, 8, 8

    #if CO_FCY == 1000
        #define CO_CANbitRateDataInitializers  \
        {4, 10,  TQ_x_20, 10}, \
        {4, 5,   TQ_x_20, 20}, \
        {4, 2,   TQ_x_20, 50}, \
        {4, 1,   TQ_x_16, 125}, \
        {4, 1,   TQ_x_8 , 250}, \
        {4, 1,   TQ_x_4 , 500}, \
        {4, 1,   TQ_x_4 , 0}, \
        {4, 1,   TQ_x_4 , 0}
    #elif CO_FCY == 1500
        #define CO_CANbitRateDataInitializers  \
        {4, 15,  TQ_x_20, 10}, \
        {4, 10,  TQ_x_15, 20}, \
        {4, 4,   TQ_x_15, 50}, \
        {4, 2,   TQ_x_12, 125}, \
        {4, 1,   TQ_x_12, 250}, \
        {4, 1,   TQ_x_6 , 500}, \
        {4, 1,   TQ_x_6 , 0}, \
        {4, 1,   TQ_x_6 , 0}
    #elif CO_FCY == 1843                /* internal FRC, no PLL */
        #define CO_CANbitRateDataInitializers  \
        {4, 23,  TQ_x_16, 10}, \
        {4, 23,  TQ_x_8 , 20}, \
        {4, 23,  TQ_x_8 , 0}, \
        {4, 23,  TQ_x_8 , 0}, \
        {4, 23,  TQ_x_8 , 0}, \
        {4, 23,  TQ_x_8 , 0}, \
        {4, 23,  TQ_x_8 , 0}, \
        {4, 23,  TQ_x_8 , 0}
    #elif CO_FCY == 2000
        #define CO_CANbitRateDataInitializers  \
        {4, 25,  TQ_x_16, 10}, \
        {4, 10,  TQ_x_20, 20}, \
        {4, 5,   TQ_x_16, 50}, \
        {4, 2,   TQ_x_16, 125}, \
        {4, 1,   TQ_x_16, 250}, \
        {4, 1,   TQ_x_8 , 500}, \
        {4, 1,   TQ_x_5 , 800}, \
        {4, 1,   TQ_x_4 , 1000}
    #elif CO_FCY == 2500
        #define CO_CANbitRateDataInitializers  \
        {4, 25,  TQ_x_20, 10}, \
        {4, 10,  TQ_x_25, 20}, \
        {4, 5,   TQ_x_20, 50}, \
        {4, 2,   TQ_x_20, 125}, \
        {4, 1,   TQ_x_20, 250}, \
        {4, 1,   TQ_x_10, 500}, \
        {4, 1,   TQ_x_10, 0}, \
        {4, 1,   TQ_x_5 , 1000}
    #elif CO_FCY == 3000
        #define CO_CANbitRateDataInitializers  \
        {4, 40,  TQ_x_15, 10}, \
        {4, 20,  TQ_x_15, 20}, \
        {4, 8,   TQ_x_15, 50}, \
        {4, 3,   TQ_x_16, 125}, \
        {4, 2,   TQ_x_12, 250}, \
        {4, 1,   TQ_x_12, 500}, \
        {4, 1,   TQ_x_12, 0}, \
        {4, 1,   TQ_x_6 , 1000}
    #elif CO_FCY == 4000
        #define CO_CANbitRateDataInitializers  \
        {4, 50,  TQ_x_16, 10}, \
        {4, 25,  TQ_x_16, 20}, \
        {4, 10,  TQ_x_16, 50}, \
        {4, 4,   TQ_x_16, 125}, \
        {4, 2,   TQ_x_16, 250}, \
        {4, 1,   TQ_x_16, 500}, \
        {4, 1,   TQ_x_10, 800}, \
        {4, 1,   TQ_x_8 , 1000}
    #elif CO_FCY == 5000
        #define CO_CANbitRateDataInitializers  \
        {4, 50,  TQ_x_20, 10}, \
        {4, 25,  TQ_x_20, 20}, \
        {4, 10,  TQ_x_20, 50}, \
        {4, 5,   TQ_x_16, 125}, \
        {4, 2,   TQ_x_20, 250}, \
        {4, 1,   TQ_x_20, 500}, \
        {4, 1,   TQ_x_20, 0}, \
        {4, 1,   TQ_x_10, 1000}
    #elif CO_FCY == 6000
        #define CO_CANbitRateDataInitializers  \
        {4, 63,  TQ_x_19, 10}, \
        {4, 40,  TQ_x_15, 20}, \
        {4, 15,  TQ_x_16, 50}, \
        {4, 6,   TQ_x_16, 125}, \
        {4, 3,   TQ_x_16, 250}, \
        {4, 2,   TQ_x_12, 500}, \
        {4, 1,   TQ_x_15, 800}, \
        {4, 1,   TQ_x_12, 1000}
    #elif CO_FCY == 7372                /* internal FRC + 4*PLL */
        #define CO_CANbitRateDataInitializers  \
        {1, 23,  TQ_x_16, 10}, \
        {4, 46,  TQ_x_16, 20}, \
        {4, 14,  TQ_x_21, 50}, \
        {4, 13,  TQ_x_9 , 125}, \
        {4, 13,  TQ_x_9 , 0}, \
        {4, 13,  TQ_x_9 , 0}, \
        {4, 13,  TQ_x_9 , 0}, \
        {4, 13,  TQ_x_9 , 0}
    #elif CO_FCY == 8000
        #define CO_CANbitRateDataInitializers  \
        {1, 25,  TQ_x_16, 10}, \
        {1, 10,  TQ_x_20, 20}, \
        {1, 5,   TQ_x_16, 50}, \
        {1, 2,   TQ_x_16, 125}, \
        {1, 1,   TQ_x_16, 250}, \
        {1, 1,   TQ_x_8 , 500}, \
        {1, 1,   TQ_x_5 , 800}, \
        {1, 1,   TQ_x_4 , 1000}
    #elif CO_FCY == 10000
        #define CO_CANbitRateDataInitializers  \
        {1, 25,  TQ_x_20, 10}, \
        {1, 10,  TQ_x_25, 20}, \
        {1, 5,   TQ_x_20, 50}, \
        {1, 2,   TQ_x_20, 125}, \
        {1, 1,   TQ_x_20, 250}, \
        {1, 1,   TQ_x_10, 500}, \
        {1, 1,   TQ_x_10, 0}, \
        {1, 1,   TQ_x_5 , 1000}
    #elif CO_FCY == 12000
        #define CO_CANbitRateDataInitializers  \
        {1, 40,  TQ_x_15, 10}, \
        {1, 20,  TQ_x_15, 20}, \
        {1, 8,   TQ_x_15, 50}, \
        {1, 3,   TQ_x_16, 125}, \
        {1, 2,   TQ_x_12, 250}, \
        {1, 1,   TQ_x_12, 500}, \
        {1, 1,   TQ_x_12, 0}, \
        {1, 1,   TQ_x_6 , 1000}
    #elif CO_FCY == 16000
        #define CO_CANbitRateDataInitializers  \
        {1, 50,  TQ_x_16, 10}, \
        {1, 25,  TQ_x_16, 20}, \
        {1, 10,  TQ_x_16, 50}, \
        {1, 4,   TQ_x_16, 125}, \
        {1, 2,   TQ_x_16, 250}, \
        {1, 1,   TQ_x_16, 500}, \
        {1, 1,   TQ_x_10, 800}, \
        {1, 1,   TQ_x_8 , 1000}
    #elif CO_FCY == 20000
        #define CO_CANbitRateDataInitializers  \
        {1, 50,  TQ_x_20, 10}, \
        {1, 25,  TQ_x_20, 20}, \
        {1, 10,  TQ_x_20, 50}, \
        {1, 5,   TQ_x_16, 125}, \
        {1, 2,   TQ_x_20, 250}, \
        {1, 1,   TQ_x_20, 500}, \
        {1, 1,   TQ_x_20, 0}, \
        {1, 1,   TQ_x_10, 1000}
    #elif CO_FCY == 24000
        #define CO_CANbitRateDataInitializers  \
        {1, 63,  TQ_x_19, 10}, \
        {1, 40,  TQ_x_15, 20}, \
        {1, 15,  TQ_x_16, 50}, \
        {1, 6,   TQ_x_16, 125}, \
        {1, 3,   TQ_x_16, 250}, \
        {1, 2,   TQ_x_12, 500}, \
        {1, 1,   TQ_x_15, 800}, \
        {1, 1,   TQ_x_12, 1000}
    #elif CO_FCY == 28000
        #define CO_CANbitRateDataInitializers  \
        {1, 56,  TQ_x_25, 10}, \
        {1, 35,  TQ_x_20, 20}, \
        {1, 14,  TQ_x_20, 50}, \
        {1, 7,   TQ_x_16, 125}, \
        {1, 4,   TQ_x_14, 250}, \
        {1, 2,   TQ_x_14, 500}, \
        {1, 2,   TQ_x_14, 0}, \
        {1, 1,   TQ_x_14, 1000}
    #elif CO_FCY == 30000
        #define CO_CANbitRateDataInitializers  \
        {1, 60,  TQ_x_25, 10}, \
        {1, 50,  TQ_x_15, 20}, \
        {1, 20,  TQ_x_15, 50}, \
        {1, 8,   TQ_x_15, 125}, \
        {1, 4,   TQ_x_15, 250}, \
        {1, 2,   TQ_x_15, 500}, \
        {1, 2,   TQ_x_15, 0}, \
        {1, 1,   TQ_x_15, 1000}
    #else
        #error define_CO_FCY CO_FCY not supported
    #endif
#endif

/* Structure contains timing coefficients for CAN module.
 *
 * CAN baud rate is calculated from following equations:
 * FCAN = FCY * Scale                  - Input frequency to CAN module (MAX 30MHz for dsPIC30F)
 * TQ = 2 * BRP / FCAN                 - Time Quanta
 * BaudRate = 1 / (TQ * K)             - Can bus Baud Rate
 * K = SJW + PROP + PhSeg1 + PhSeg2    - Number of Time Quantas
 */
typedef struct {
    uint8_t   scale;    /* (1 or 4) Scales FCY clock - dsPIC30F specific */
    uint8_t   BRP;      /* (1...64) Baud Rate Prescaler */
    uint8_t   SJW;      /* (1...4) SJW time */
    uint8_t   PROP;     /* (1...8) PROP time */
    uint8_t   phSeg1;   /* (1...8) Phase Segment 1 time */
    uint8_t   phSeg2;   /* (1...8) Phase Segment 2 time */
    uint16_t  bitrate;  /* bitrate in kbps */
} CO_CANbitRateData_t;

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CO_DRIVER_TARGET */
