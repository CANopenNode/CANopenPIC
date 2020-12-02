/*
 * Microchip dsPIC33 or PIC24 specific definitions for CANopenNode.
 *
 * @file        CO_driver_target.h
 * @author      Janez Paternoster
 * @author      Peter Rozsahegyi (EDS)
 * @author      Jens Nielsen (CAN receive)
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
#ifndef CO_CONFIG_NMT
#define CO_CONFIG_NMT CO_CONFIG_NMT_MASTER
#endif

/* Basic definitions */
#define CO_LITTLE_ENDIAN
#if __BYTE_ORDER == __LITTLE_ENDIAN
    #define CO_LITTLE_ENDIAN
    #define CO_SWAP_16(x) x
    #define CO_SWAP_32(x) x
    #define CO_SWAP_64(x) x
#else
    #define CO_BIG_ENDIAN
    #include <byteswap.h>
    #define CO_SWAP_16(x) bswap_16(x)
    #define CO_SWAP_32(x) bswap_32(x)
    #define CO_SWAP_64(x) bswap_64(x)
#endif
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


/* CAN message buffer sizes for CAN module 1 and 2. Valid values
 * are 0, 4, 6, 8, 12, 16. Default is one TX and seven RX messages (FIFO). */
#ifndef CO_CAN1msgBuffSize
    #define CO_CAN1msgBuffSize   8
#endif
#ifndef CO_CAN2msgBuffSize
    #define CO_CAN2msgBuffSize   0  //CAN module 2 not used by default
#endif

/* Default DMA addresses for CAN modules. */
#ifndef CO_CAN1_DMA0
    #define CO_CAN1_DMA0 ADDR_DMA0
#endif
#ifndef CO_CAN1_DMA1
    #define CO_CAN1_DMA1 ADDR_DMA1
#endif
#ifndef CO_CAN2_DMA0
    #define CO_CAN2_DMA0 ADDR_DMA2
#endif
#ifndef CO_CAN2_DMA1
    #define CO_CAN2_DMA1 ADDR_DMA3
#endif

/* Define DMA attribute on supported platforms */
#if defined(__dsPIC33F__) || defined(__PIC24H__) || defined(__DMA_BASE)
    #define __dma  __attribute__((space(dma)))
#else
    #define __dma
    #if defined(__C30_VERSION__) && !defined(__XC16_VERSION__)
        #define __builtin_dmaoffset(V)  (uint16_t)V
    #endif
#endif

/* Define EDS attribute on supported platforms */
#if defined(__HAS_EDS__)
    #define __eds __attribute__((eds))
    #if defined(__C30_VERSION__) && !defined(__XC16_VERSION__)
        #define __builtin_dmapage(V)  (uint16_t)0
    #endif
#else
    #define __eds
    #define __eds__
#endif

/* CAN module base addresses */
#define ADDR_CAN1               ((void *)&C1CTRL1)
#define ADDR_CAN2               ((void *)&C2CTRL1)

/* DMA addresses */
#define ADDR_DMA0               ((uint16_t)&DMA0CON)
#define ADDR_DMA1               ((uint16_t)&DMA1CON)
#define ADDR_DMA2               ((uint16_t)&DMA2CON)
#define ADDR_DMA3               ((uint16_t)&DMA3CON)
#define ADDR_DMA4               ((uint16_t)&DMA4CON)
#define ADDR_DMA5               ((uint16_t)&DMA5CON)
#define ADDR_DMA6               ((uint16_t)&DMA6CON)
#define ADDR_DMA7               ((uint16_t)&DMA7CON)


/* CAN receive message structure as aligned in CAN module. */
/* In dsPIC33F and PIC24H this structure is used for both: transmitting and
 * receiving to and from CAN module. (Object is ownded by CAN module).
 */
typedef struct {
    uint16_t    ident;          /* Standard Identifier as aligned in CAN module. 16 bits:
                                   'UUUSSSSS SSSSSSRE' (U: unused; S: SID; R=SRR; E=IDE). */
    uint16_t    extIdent;       /* Extended identifier, not used here */
    uint16_t    DLC      :4;    /* Data length code (bits 0...3) */
    uint16_t    DLCrest  :12;   /* Not used here (bits 4..15) */
    uint8_t     data[8];        /* 8 data bytes */
    uint8_t     dummy;          /* Not used */
    uint8_t     FILHIT;         /* Filter hit */
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
    __eds__ CO_CANrxMsg_t *CANmsgBuff;  /* dsPIC33F specific: CAN message buffer for CAN module */
    uint8_t CANmsgBuffSize; /* dsPIC33F specific: Size of the above buffer */
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
    uint16_t errOld;
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

/* dsPIC33F specific */
#define CO_DISABLE_INTERRUPTS()  asm volatile ("disi #0x3FFF")
#define CO_ENABLE_INTERRUPTS()   asm volatile ("disi #0x0000")

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
 * CO_FCY is internal instruction cycle clock frequency in kHz units. See
 * dsPIC33F documentation for more information on FCY.
 *
 * Possible values for FCY are (in three groups):
 *     - Optimal CAN bit timing on all Baud Rates: 8000, 12000, 16000, 24000.
 *     - Not so optimal CAN bit timing on all Baud Rates: 4000, 32000.
 *     - not all CANopen Baud Rates possible: 2000, 3000, 5000, 6000, 10000,
 *       20000, 40000, 48000, 56000, 64000, 70000.
 *
 * IMPORTANT: For FCY<=12000 there is unresolved bug; CANCKS configuration
 *               bit on ECAN does not work, so some baudrates are not possible.
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

    #if CO_FCY == 2000
        #define CO_CANbitRateDataInitializers  \
        {1, 5,   TQ_x_20, 10}, \
        {2, 5,   TQ_x_20, 20}, \
        {1, 1,   TQ_x_20, 50}, \
        {2, 1,   TQ_x_16, 125}, \
        {2, 1,   TQ_x_8 , 250}, \
        {2, 1,   TQ_x_4 , 500}, \
        {2, 1,   TQ_x_4 , 0}, \
        {2, 1,   TQ_x_4 , 0}
    #elif CO_FCY == 3000
        #define CO_CANbitRateDataInitializers  \
        {2, 15,  TQ_x_20, 10}, \
        {1, 5,   TQ_x_15, 20}, \
        {1, 2,   TQ_x_15, 50}, \
        {1, 1,   TQ_x_12, 125}, \
        {2, 1,   TQ_x_12, 250}, \
        {2, 1,   TQ_x_6 , 500}, \
        {2, 1,   TQ_x_6 , 0}, \
        {2, 1,   TQ_x_6 , 0}
    #elif CO_FCY == 4000
        #define CO_CANbitRateDataInitializers  \
        {2, 25,  TQ_x_16, 10}, \
        {1, 5,   TQ_x_20, 20}, \
        {2, 5,   TQ_x_16, 50}, \
        {1, 1,   TQ_x_16, 125}, \
        {2, 1,   TQ_x_16, 250}, \
        {2, 1,   TQ_x_8 , 500}, \
        {2, 1,   TQ_x_5 , 800}, \
        {2, 1,   TQ_x_4 , 1000}
    #elif CO_FCY == 5000
        #define CO_CANbitRateDataInitializers  \
        {2, 25,  TQ_x_20, 10}, \
        {1, 5,   TQ_x_25, 20}, \
        {2, 5,   TQ_x_20, 50}, \
        {1, 1,   TQ_x_20, 125}, \
        {2, 1,   TQ_x_20, 250}, \
        {2, 1,   TQ_x_10, 500}, \
        {2, 1,   TQ_x_10, 0}, \
        {2, 1,   TQ_x_5 , 1000}
    #elif CO_FCY == 6000
        #define CO_CANbitRateDataInitializers  \
        {1, 20,  TQ_x_15, 10}, \
        {1, 10,  TQ_x_15, 20}, \
        {1, 4,   TQ_x_15, 50}, \
        {2, 3,   TQ_x_16, 125}, \
        {1, 1,   TQ_x_12, 250}, \
        {2, 1,   TQ_x_12, 500}, \
        {2, 1,   TQ_x_12, 0}, \
        {2, 1,   TQ_x_6 , 1000}
    #elif CO_FCY == 8000
        #define CO_CANbitRateDataInitializers  \
        {1, 25,  TQ_x_16, 10}, \
        {2, 25,  TQ_x_16, 20}, \
        {1, 5,   TQ_x_16, 50}, \
        {1, 2,   TQ_x_16, 125}, \
        {1, 1,   TQ_x_16, 250}, \
        {2, 1,   TQ_x_16, 500}, \
        {2, 1,   TQ_x_10, 800}, \
        {2, 1,   TQ_x_8 , 1000}
    #elif CO_FCY == 10000
        #define CO_CANbitRateDataInitializers  \
        {1, 25,  TQ_x_20, 10}, \
        {2, 25,  TQ_x_20, 20}, \
        {1, 5,   TQ_x_20, 50}, \
        {2, 5,   TQ_x_16, 125}, \
        {1, 1,   TQ_x_20, 250}, \
        {2, 1,   TQ_x_20, 500}, \
        {2, 1,   TQ_x_20, 0}, \
        {2, 1,   TQ_x_10, 1000}
    #elif CO_FCY == 12000
        #define CO_CANbitRateDataInitializers  \
        {2, 63,  TQ_x_19, 10}, \
        {1, 20,  TQ_x_15, 20}, \
        {2, 15,  TQ_x_16, 50}, \
        {1, 3,   TQ_x_16, 125}, \
        {2, 3,   TQ_x_16, 250}, \
        {1, 1,   TQ_x_12, 500}, \
        {2, 1,   TQ_x_15, 800}, \
        {2, 1,   TQ_x_12, 1000}
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
    #elif CO_FCY == 32000
        #define CO_CANbitRateDataInitializers  \
        {1, 64,  TQ_x_25, 10}, \
        {1, 50,  TQ_x_16, 20}, \
        {1, 20,  TQ_x_16, 50}, \
        {1, 8,   TQ_x_16, 125}, \
        {1, 4,   TQ_x_16, 250}, \
        {1, 2,   TQ_x_16, 500}, \
        {1, 2,   TQ_x_10, 800}, \
        {1, 1,   TQ_x_16, 1000}
    #elif CO_FCY == 40000
        #define CO_CANbitRateDataInitializers  \
        {1, 50,  TQ_x_20, 0}, \
        {1, 50,  TQ_x_20, 20}, \
        {1, 25,  TQ_x_16, 50}, \
        {1, 10,  TQ_x_16, 125}, \
        {1, 5,   TQ_x_16, 250}, \
        {1, 2,   TQ_x_20, 500}, \
        {1, 1,   TQ_x_25, 800}, \
        {1, 1,   TQ_x_20, 1000}
    #elif CO_FCY == 48000
        #define CO_CANbitRateDataInitializers  \
        {1, 63,  TQ_x_19, 0}, \
        {1, 63,  TQ_x_19, 20}, \
        {1, 30,  TQ_x_16, 50}, \
        {1, 12,  TQ_x_16, 125}, \
        {1, 6,   TQ_x_16, 250}, \
        {1, 3,   TQ_x_16, 500}, \
        {1, 2,   TQ_x_15, 800}, \
        {1, 2,   TQ_x_12, 1000}
    #elif CO_FCY == 56000
        #define CO_CANbitRateDataInitializers  \
        {1, 61,  TQ_x_23, 0}, \
        {1, 61,  TQ_x_23, 20}, \
        {1, 35,  TQ_x_16, 50}, \
        {1, 14,  TQ_x_16, 125}, \
        {1, 7,   TQ_x_16, 250}, \
        {1, 4,   TQ_x_14, 500}, \
        {1, 5,   TQ_x_7 , 800}, \
        {1, 2,   TQ_x_14, 1000}
    #elif CO_FCY == 64000
        #define CO_CANbitRateDataInitializers  \
        {1, 64,  TQ_x_25, 0}, \
        {1, 64,  TQ_x_25, 20}, \
        {1, 40,  TQ_x_16, 50}, \
        {1, 16,  TQ_x_16, 125}, \
        {1, 8,   TQ_x_16, 250}, \
        {1, 4,   TQ_x_16, 500}, \
        {1, 2,   TQ_x_20, 800}, \
        {1, 2,   TQ_x_16, 1000}
    #elif CO_FCY == 70000
        #define CO_CANbitRateDataInitializers  \
        {1, 64,  TQ_x_25, 0}, \
        {1, 64,  TQ_x_25, 20}, \
        {1, 35,  TQ_x_20, 50}, \
        {1, 14,  TQ_x_20, 125}, \
        {1, 7,   TQ_x_20, 250}, \
        {1, 5,   TQ_x_14, 500}, \
        {1, 3,   TQ_x_15, 0}, \
        {1, 2,   TQ_x_17, 0}
    #else
        #error define_CO_FCY CO_FCY not supported
    #endif
#endif

/* Structure contains timing coefficients for CAN module.
 *
 * CAN baud rate is calculated from following equations:
 * FCAN = FCY * Scale                  - Input frequency to CAN module (MAX 40MHz for dsPIC33F/PIC24H and 70MHz for dsPIC33E/PIC24E)
 * TQ = 2 * BRP / FCAN                 - Time Quanta
 * BaudRate = 1 / (TQ * K)             - Can bus Baud Rate
 * K = SJW + PROP + PhSeg1 + PhSeg2    - Number of Time Quantas
 */
typedef struct {
    uint8_t   scale;    /* (1 or 2) Scales FCY clock - dsPIC33F and PIC24H specific */
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
