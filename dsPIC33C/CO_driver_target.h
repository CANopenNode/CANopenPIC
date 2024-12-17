/*
 * Microchip dsPIC33C specific definitions for CANopenNode.
 *
 * @file        CO_driver_target.h
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
/* Use default options here, it is possible to reduce memory usage. */


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


/* CAN message buffer sizes for CAN module 1 and 2. Valid values
 * are 0, 4, 6, 8, 12, 16. Default is one TX and seven RX messages (FIFO). */
#ifndef CAN_FIFO_ALLOCATE_RAM_SIZE
    #define CAN_FIFO_ALLOCATE_RAM_SIZE 5000 // TODO
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
#define ADDR_CAN1               ((void *)&C1CONL)
#define ADDR_CAN2               ((void *)&C2CONL)


/*data structure to implement a CANFD message buffer. */
/* CANFD Message Time Stamp */
typedef unsigned long CANFD_MSG_TIMESTAMP;

/* CANFD RX Message Object Control*/
typedef struct _CANFD_RX_MSGOBJ_CTRL {
    uint16_t DLC:4;
    uint16_t IDE:1;
    uint16_t RTR:1;
    uint16_t BRS:1;
    uint16_t FDF:1;
    uint16_t ESI:1;
    uint16_t unimplemented1:2;
    uint16_t FilterHit:5;
    uint16_t unimplemented2:16;
} CANFD_RX_MSGOBJ_CTRL;

/* CANFD RX Message ID*/
typedef struct _CANFD_MSGOBJ_ID {
    uint16_t SID:11;
    uint32_t EID:18;
    uint16_t SID11:1;
    uint16_t unimplemented1:2;
} CANFD_MSGOBJ_ID;


/* CAN receive message structure as aligned in CAN module. */
/* In dsPIC33F and PIC24H this structure is used for both: transmitting and
 * receiving to and from CAN module. (Object is ownded by CAN module).
 */
typedef struct {
    struct {
        CANFD_MSGOBJ_ID id;
        CANFD_RX_MSGOBJ_CTRL ctrl;
//        CANFD_MSG_TIMESTAMP timeStamp; // Only exist if RXTSEN is set (CxFIFOCONxL)
        uint8_t dataByte[8];
    } bF;
    uint16_t word[8];//10
    uint8_t byte [16];//20
} CO_CANrxMsg_t;


/* Access to received CAN message */
#define CO_CANrxMsg_readIdent(msg) ((((uint16_t)(((CO_CANrxMsg_t *)(msg))->bF.id.SID))>>2)&0x7FF)
#define CO_CANrxMsg_readDLC(msg)   ((uint8_t)(((CO_CANrxMsg_t *)(msg))->bF.ctrl.DLC))
#define CO_CANrxMsg_readData(msg)  ((uint8_t *)(((CO_CANrxMsg_t *)(msg))->bF.dataByte))

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
    uint16_t errOld;
    unsigned int mapFlthitIndex[16];
} CO_CANmodule_t;


/* (un)lock critical section in CO_CANsend() */
#define CO_LOCK_CAN_SEND(CAN_MODULE)      asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_CAN_SEND(CAN_MODULE)    asm volatile ("disi #0x0000")

/* (un)lock critical section in CO_errorReport() or CO_errorReset() */
#define CO_LOCK_EMCY(CAN_MODULE)          asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_EMCY(CAN_MODULE)        asm volatile ("disi #0x0000")

/* (un)lock critical section when accessing Object Dictionary */
#define CO_LOCK_OD(CAN_MODULE)            asm volatile ("disi #0x3FFF")
#define CO_UNLOCK_OD(CAN_MODULE)          asm volatile ("disi #0x0000")

/* dsPIC33F specific */
#define CO_DISABLE_INTERRUPTS()  asm volatile ("disi #0x3FFF")
#define CO_ENABLE_INTERRUPTS()   asm volatile ("disi #0x0000")

/* Synchronization between CAN receive and message processing threads. */
#define CO_MemoryBarrier()
#define CO_FLAG_READ(rxNew) ((rxNew) != NULL)
#define CO_FLAG_SET(rxNew) {CO_MemoryBarrier(); rxNew = (void*)1L;}
#define CO_FLAG_CLEAR(rxNew) {CO_MemoryBarrier(); rxNew = NULL;}

void CO_CANinterrupt(CO_CANmodule_t *CANmodule);
void CO_CANinterruptRX(CO_CANmodule_t *CANmodule);
void CO_CANinterruptTX(CO_CANmodule_t *CANmodule);

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

    #define DTQ_x_40   5, 31, 8

    #define NTQ_x_80   16, 63, 16 // MCC (generated values +1)
    #define NTQ_x_100   40, 159, 40 // MCC (generated values +1)
    #define NTQ_x_160   32, 127, 32 // MCC (generated values +1)
    #define NTQ_x_200   20, 79, 20 // MCC (generated values +1)
    #define NTQ_x_320   64, 255, 64 // MCC (generated values +1)

    // Recommended FCAN : 20MHz, 40MHz, 80MHz
    #if CO_FCY == 80000
        #define CO_CANbitRateDataInitializers  \
        {1, 100, NTQ_x_80, 200, DTQ_x_40, 10},      /* TODO CAN=10kbps*/   \
        {1, 50,  NTQ_x_80, 100, DTQ_x_40, 20},      /* TODO CAN=20kbps*/   \
        {1, 20,  NTQ_x_80, 40, DTQ_x_40, 50},       /* TODO CAN=50kbps*/   \
        {1, 10,  NTQ_x_80, 20, DTQ_x_40, 100},      /* TODO CAN=100kbps*/  \
        {1, 2,   NTQ_x_320, 16, DTQ_x_40, 125},      /*CAN=125kbps*/  \
        {1, 1,   NTQ_x_320, 8, DTQ_x_40, 250},       /*CAN=250kbps*/  \
        {1, 1,   NTQ_x_160, 4, DTQ_x_40, 500},       /*CAN=500kbps*/  \
        {1, 1,   NTQ_x_80, 2, DTQ_x_40, 1000}       /*CAN=1000kbps*/   
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
    uint8_t   scale;    /* (1 or 2) Scales FCY clock - dsPIC33F and PIC24H specific */ // TODO CAN
    // Nominal bit rate (arbitration)
    uint8_t   NBRP;     /* (1...256) Baud Rate Prescaler */
    uint8_t   NSJW;     /* (1...128) SJW time */
    uint8_t   NtSeg1;  /* (1...256) Prop + Phase Segment 1 time */
    uint8_t   NtSeg2;  /* (1...128) Phase Segment 2 time */
    // Data bit rate (data and CRC)
    uint8_t   DBRP;     /* (1...256) Baud Rate Prescaler */
    uint8_t   DSJW;     /* (1...16) SJW time */
    uint8_t   DtSeg1;  /* (1...32) Prop + Phase Segment 1 time */
    uint8_t   DtSeg2;  /* (1...16) Phase Segment 2 time */
    uint16_t  bitrate;  /* bitrate in kbps */
} CO_CANbitRateData_t;

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CO_DRIVER_TARGET */
