/*
 * Microchip PIC32MX specific definitions for CANopenNode.
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

#include <p32xxxx.h>
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

#ifndef CO_CONFIG_SDO_BUFFER_SIZE
#define CO_CONFIG_SDO_BUFFER_SIZE 950
#endif

/* Basic definitions */
#define CO_LITTLE_ENDIAN
/* NULL is defined in stddef.h */
/* true and false are defined in stdbool.h */
/* int8_t to uint64_t are defined in stdint.h */
typedef unsigned char           bool_t;
typedef float                   float32_t;
typedef long double             float64_t;
typedef char                    char_t;
typedef unsigned char           oChar_t;
typedef unsigned char           domain_t;


/* CAN receive message structure as aligned in CAN module. */
typedef struct {
    unsigned    ident    :11;   /* Standard Identifier */
    unsigned    FILHIT   :5;    /* Filter hit, see PIC32MX documentation */
    unsigned    CMSGTS   :16;   /* CAN message timestamp, see PIC32MX documentation */
    unsigned    DLC      :4;    /* Data length code (bits 0...3) */
    unsigned             :5;
    unsigned    RTR      :1;    /* Remote Transmission Request bit */
    unsigned             :22;
    uint8_t     data[8];        /* 8 data bytes */
} CO_CANrxMsg_t;

/* Access to received CAN message */
#define CO_CANrxMsg_readIdent(msg) ((uint16_t)(((CO_CANrxMsg_t *)(msg))->ident))
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
    uint32_t  CMSGSID;     /* Equal to register in transmit message buffer. Includes standard Identifier */
    uint32_t  CMSGEID;     /* Equal to register in transmit message buffer. Includes data length code and RTR */
    uint8_t data[8];
    volatile bool_t bufferFull;
    volatile bool_t syncFlag;
} CO_CANtx_t;

/* CAN module object */
typedef struct {
    void *CANptr;
    CO_CANrxMsg_t CANmsgBuff[33]; /* PIC32 specific: CAN message buffer for CAN module. 32 buffers for receive, 1 buffer for transmit */
    uint8_t CANmsgBuffSize; /* PIC32 specific: Size of the above buffer == 33. Take care initial value! */
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
    uint32_t errOld;
} CO_CANmodule_t;


/* (un)lock critical section in CO_CANsend() */
extern unsigned int CO_interruptStatus;
#define CO_LOCK_CAN_SEND()      CO_interruptStatus = __builtin_disable_interrupts()
#define CO_UNLOCK_CAN_SEND()    if(CO_interruptStatus & 0x00000001) {__builtin_enable_interrupts();}

/* (un)lock critical section in CO_errorReport() or CO_errorReset() */
#define CO_LOCK_EMCY()          CO_interruptStatus = __builtin_disable_interrupts()
#define CO_UNLOCK_EMCY()        if(CO_interruptStatus & 0x00000001) {__builtin_enable_interrupts();}

/* (un)lock critical section when accessing Object Dictionary */
#define CO_LOCK_OD()            CO_interruptStatus = __builtin_disable_interrupts()
#define CO_UNLOCK_OD()          if(CO_interruptStatus & 0x00000001) {__builtin_enable_interrupts();}

/* Synchronization between CAN receive and message processing threads. */
#define CO_MemoryBarrier()
#define CO_FLAG_READ(rxNew) ((rxNew) != NULL)
#define CO_FLAG_SET(rxNew) {CO_MemoryBarrier(); rxNew = (void*)1L;}
#define CO_FLAG_CLEAR(rxNew) {CO_MemoryBarrier(); rxNew = NULL;}


/* Translate a kernel virtual address in KSEG0 or KSEG1 to a real
 * physical address and back. */
typedef unsigned long CO_paddr_t; /* a physical address */
typedef unsigned long CO_vaddr_t; /* a virtual address */
#define CO_KVA_TO_PA(v)         ((CO_paddr_t)(v) & 0x1fffffff)
#define CO_PA_TO_KVA0(pa)       ((void *) ((pa) | 0x80000000))
#define CO_PA_TO_KVA1(pa)       ((void *) ((pa) | 0xa0000000))


/* CAN bit rates
 *
 * CAN bit rates are initializers for array of eight CO_CANbitRateData_t
 * objects.
 *
 * Macros are not used by driver itself, they may be used by application with
 * combination with object CO_CANbitRateData_t.
 * Application must declare following global variable depending on CO_FSYS used:
 * const CO_CANbitRateData_t  CO_CANbitRateData[8] = {CO_CANbitRateDataInitializers};
 *
 * There are initializers for eight objects, which corresponds to following
 * CAN bit rates (in kbps): 10, 20, 50, 125, 250, 500, 800, 1000.
 *
 * CO_FSYS is internal instruction cycle clock frequency in kHz units. See
 * PIC32MX documentation for more information on FSYS.
 *
 * Available values for FSYS:
 *    kbps = | 10 | 20 | 50 | 125 | 250 | 500 | 800 | 1000
 *    -------+----+----+----+-----+-----+-----+-----+-----
 *     4 Mhz |  O |  O |  O |  O  |  p  |  -  |  -  |  -
 *     8 Mhz |  O |  O |  O |  O  |  O  |  p  |  -  |  -
 *    12 Mhz |  O |  O |  O |  O  |  p  |  p  |  -  |  -
 *    16 Mhz |  O |  O |  O |  O  |  O  |  O  |  p  |  p
 *    20 Mhz |  O |  O |  O |  O  |  O  |  O  |  -  |  p
 *    24 Mhz |  O |  O |  O |  O  |  O  |  p  |  O  |  p
 *    32 Mhz |  p |  O |  O |  O  |  O  |  O  |  p  |  O
 *    36 Mhz |  - |  O |  O |  O  |  O  |  O  |  -  |  O
 *    40 Mhz |  - |  O |  O |  O  |  O  |  O  |  p  |  O
 *    48 Mhz |  - |  O |  O |  O  |  O  |  O  |  O  |  p
 *    56 Mhz |  - |  p |  O |  O  |  O  |  p  | (p) |  p
 *    64 Mhz |  - |  p |  O |  O  |  O  |  O  |  O  |  O
 *    72 Mhz |  - |  - |  O |  O  |  O  |  O  |  O  |  O
 *    80 Mhz |  - |  - |  O |  O  |  O  |  O  |  p  |  O
 *    ----------------------------------------------------
 *    (O=optimal; p=possible; -=not possible)
 */
#ifdef CO_FSYS
    /* Macros, which divides K into (SJW + PROP + PhSeg1 + PhSeg2) */
    #define TQ_x_7    1, 2, 3, 1
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
    #define TQ_x_22   1, 8, 8, 5
    #define TQ_x_23   1, 8, 8, 6
    #define TQ_x_24   1, 8, 8, 7
    #define TQ_x_25   1, 8, 8, 8

    #if CO_FSYS == 4000
        #define CO_CANbitRateDataInitializers  \
        {10,  TQ_x_20, 10}, \
        {5,   TQ_x_20, 20}, \
        {2,   TQ_x_20, 50}, \
        {1,   TQ_x_16, 125}, \
        {1,   TQ_x_8 , 250}, \
        {1,   TQ_x_8 , 0}, \
        {1,   TQ_x_8 , 0}, \
        {1,   TQ_x_8 , 0}
    #elif CO_FSYS == 8000
        #define CO_CANbitRateDataInitializers  \
        {25,  TQ_x_16, 10}, \
        {10,  TQ_x_20, 20}, \
        {5,   TQ_x_16, 50}, \
        {2,   TQ_x_16, 125}, \
        {1,   TQ_x_16, 250}, \
        {1,   TQ_x_8 , 500}, \
        {1,   TQ_x_8 , 0}, \
        {1,   TQ_x_8 , 0}
    #elif CO_FSYS == 12000
        #define CO_CANbitRateDataInitializers  \
        {40,  TQ_x_15, 10}, \
        {20,  TQ_x_15, 20}, \
        {8,   TQ_x_15, 50}, \
        {3,   TQ_x_16, 125}, \
        {2,   TQ_x_12, 250}, \
        {1,   TQ_x_12, 500}, \
        {1,   TQ_x_12, 0}, \
        {1,   TQ_x_12, 0}
    #elif CO_FSYS == 16000
        #define CO_CANbitRateDataInitializers  \
        {50,  TQ_x_16, 10}, \
        {25,  TQ_x_16, 20}, \
        {10,  TQ_x_16, 50}, \
        {4,   TQ_x_16, 125}, \
        {2,   TQ_x_16, 250}, \
        {1,   TQ_x_16, 500}, \
        {1,   TQ_x_10, 800}, \
        {1,   TQ_x_8 , 1000}
    #elif CO_FSYS == 20000
        #define CO_CANbitRateDataInitializers  \
        {50,  TQ_x_20, 10}, \
        {25,  TQ_x_20, 20}, \
        {10,  TQ_x_20, 50}, \
        {5,   TQ_x_16, 125}, \
        {2,   TQ_x_20, 250}, \
        {1,   TQ_x_20, 500}, \
        {1,   TQ_x_20, 0}, \
        {1,   TQ_x_10, 1000}
    #elif CO_FSYS == 24000
        #define CO_CANbitRateDataInitializers  \
        {63,  TQ_x_19, 10}, \
        {40,  TQ_x_15, 20}, \
        {15,  TQ_x_16, 50}, \
        {6,   TQ_x_16, 125}, \
        {3,   TQ_x_16, 250}, \
        {2,   TQ_x_12, 500}, \
        {1,   TQ_x_15, 800}, \
        {1,   TQ_x_12, 1000}
    #elif CO_FSYS == 32000
        #define CO_CANbitRateDataInitializers  \
        {64,  TQ_x_25, 10}, \
        {50,  TQ_x_16, 20}, \
        {20,  TQ_x_16, 50}, \
        {8,   TQ_x_16, 125}, \
        {4,   TQ_x_16, 250}, \
        {2,   TQ_x_16, 500}, \
        {2,   TQ_x_10, 800}, \
        {1,   TQ_x_16, 1000}
    #elif CO_FSYS == 36000
        #define CO_CANbitRateDataInitializers  \
        {50,  TQ_x_18, 10}, \
        {50,  TQ_x_18, 20}, \
        {20,  TQ_x_18, 50}, \
        {8,   TQ_x_18, 125}, \
        {4,   TQ_x_18, 250}, \
        {2,   TQ_x_18, 500}, \
        {2,   TQ_x_18, 0}, \
        {1,   TQ_x_18, 1000}
    #elif CO_FSYS == 40000
        #define CO_CANbitRateDataInitializers  \
        {50,  TQ_x_20, 0}, \
        {50,  TQ_x_20, 20}, \
        {25,  TQ_x_16, 50}, \
        {10,  TQ_x_16, 125}, \
        {5,   TQ_x_16, 250}, \
        {2,   TQ_x_20, 500}, \
        {1,   TQ_x_25, 800}, \
        {1,   TQ_x_20, 1000}
    #elif CO_FSYS == 48000
        #define CO_CANbitRateDataInitializers  \
        {63,  TQ_x_19, 0}, \
        {63,  TQ_x_19, 20}, \
        {30,  TQ_x_16, 50}, \
        {12,  TQ_x_16, 125}, \
        {6,   TQ_x_16, 250}, \
        {3,   TQ_x_16, 500}, \
        {2,   TQ_x_15, 800}, \
        {2,   TQ_x_12, 1000}
    #elif CO_FSYS == 56000
        #define CO_CANbitRateDataInitializers  \
        {61,  TQ_x_23, 0}, \
        {61,  TQ_x_23, 20}, \
        {35,  TQ_x_16, 50}, \
        {14,  TQ_x_16, 125}, \
        {7,   TQ_x_16, 250}, \
        {4,   TQ_x_14, 500}, \
        {5,   TQ_x_7 , 800}, \
        {2,   TQ_x_14, 1000}
    #elif CO_FSYS == 64000
        #define CO_CANbitRateDataInitializers  \
        {64,  TQ_x_25, 0}, \
        {64,  TQ_x_25, 20}, \
        {40,  TQ_x_16, 50}, \
        {16,  TQ_x_16, 125}, \
        {8,   TQ_x_16, 250}, \
        {4,   TQ_x_16, 500}, \
        {2,   TQ_x_20, 800}, \
        {2,   TQ_x_16, 1000}
    #elif CO_FSYS == 72000
        #define CO_CANbitRateDataInitializers  \
        {40,  TQ_x_18, 0}, \
        {40,  TQ_x_18, 0}, \
        {40,  TQ_x_18, 50}, \
        {16,  TQ_x_18, 125}, \
        {8,   TQ_x_18, 250}, \
        {4,   TQ_x_18, 500}, \
        {3,   TQ_x_15, 800}, \
        {2,   TQ_x_18, 1000}
    #elif CO_FSYS == 80000
        #define CO_CANbitRateDataInitializers  \
        {40,  TQ_x_20, 0}, \
        {40,  TQ_x_20, 0}, \
        {40,  TQ_x_20, 50}, \
        {16,  TQ_x_20, 125}, \
        {8,   TQ_x_20, 250}, \
        {4,   TQ_x_20, 500}, \
        {2,   TQ_x_25, 800}, \
        {2,   TQ_x_20, 1000}
    #else
        #error define_CO_FSYS CO_FSYS not supported
    #endif
#endif

/* Structure contains timing coefficients for CAN module.
 *
 * CAN baud rate is calculated from following equations:
 * Fsys                                - System clock (MAX 80MHz for PIC32MX)
 * TQ = 2 * BRP / Fsys                 - Time Quanta
 * BaudRate = 1 / (TQ * K)             - Can bus Baud Rate
 * K = SJW + PROP + PhSeg1 + PhSeg2    - Number of Time Quantas
 */
typedef struct {
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
