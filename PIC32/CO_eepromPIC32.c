/*
 * Eeprom interface for use with CO_storageEeprom, PIC32 specific
 *
 * @file        CO_eepromPIC32.c
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

#include "storage/CO_eeprom.h"
#include "301/crc16-ccitt.h"

/*
 * Hardware definition
 *
 * Here registers are used directly. As alternative 'void *storageModule' colud
 * be used as more object oriented way.
 *
 * By default 25LC128 eeprom is connected to SPI2 port of PIC32MX (RG6..RG9).
 */
#ifndef CO_STOR_EE_SIZE
 #define CO_STOR_EE_SIZE 0x4000 // 0x4000 for 128kbits or 0x8000 for 25LC256
#endif
#ifndef CO_STOR_EE_PAGE_SIZE
 #define CO_STOR_EE_PAGE_SIZE 64
#endif
#ifndef CO_STOR_SS
 #define CO_STOR_SS
 #define CO_STOR_SS_INIT()   {TRISGCLR = 0x0200;}
 #define CO_STOR_SS_LOW()    {PORTGCLR = 0x0200;}
 #define CO_STOR_SS_HIGH()   {PORTGSET = 0x0200;}
#endif
#ifndef CO_STOR_SPI
 #define CO_STOR_SPI
 #define CO_STOR_SPIBUF      SPI2BUF
 #define CO_STOR_SPICON      SPI2CON
 #define CO_STOR_SPISTAT     SPI2STAT
 #define CO_STOR_SPISTATbits SPI2STATbits
 #define CO_STOR_SPIBRG      SPI2BRG
#endif

#define EE_CMD_READ     (unsigned)0b00000011
#define EE_CMD_WRITE    (unsigned)0b00000010
#define EE_CMD_WRDI     (unsigned)0b00000100
#define EE_CMD_WREN     (unsigned)0b00000110
#define EE_CMD_RDSR     (unsigned)0b00000101
#define EE_CMD_WRSR     (unsigned)0b00000001
#define SPI_FIFO_SIZE   16 // PIC32 uses 16 bytes long FIFO buffer with SPI.


/*
 * Eeprom is configured so, that first half of memory locations is not write
 * protected, so it is suitable for auto storage variables. Second half of
 * memory locations is write protected. It is used for storage on command, which
 * disables the protection for the short time when writing. Below are two
 * internal variables, used for indicating next free address in eeprom, one for
 * autonomous storage and one for protected storage
 */
static size_t eepromAddrNextAuto = 0;
static size_t eepromAddrNextProt = CO_STOR_EE_SIZE / 2;
static volatile uint32_t dummy;


/**
 * Enable write operation in EEPROM. It is called before every writing to it.
 */
static inline void EE_writeEnable() {
    CO_STOR_SS_LOW();

    /* write byte */
    CO_STOR_SPIBUF = EE_CMD_WREN;

    /* read one byte after it is ready */
    while (CO_STOR_SPISTATbits.SPIRBE);
    dummy = CO_STOR_SPIBUF;

    CO_STOR_SS_HIGH();
}


/**
 * Read eeprom status register.
 *
 * @return Data read from the status register.
 */
static inline uint8_t EE_readStatus() {
    CO_STOR_SS_LOW();

    /* write two bytes */
    CO_STOR_SPIBUF = EE_CMD_RDSR;
    CO_STOR_SPIBUF = 0;

    /* read two bytes after they are ready */
    while(CO_STOR_SPISTATbits.SPIRBE);
    dummy = CO_STOR_SPIBUF;
    while(CO_STOR_SPISTATbits.SPIRBE);
    CO_STOR_SS_HIGH();

    return CO_STOR_SPIBUF;
}

/**
 * Return true if write is in process.
 */
#define EE_isWriteInProcess() ((EE_readStatus() & 0x01) != 0)
/**
 * Return true if upper half of the eeprom is protected
 */
#define EE_isWriteProtected() ((EE_readStatus() & 0x8C) == 0x88)


/**
 * Write eeprom status register.
 *
 * Make sure EE_isWriteInProcess() is false before and after function call
 *
 * @param data Data byte to be written to status register.
 */
static inline void EE_writeStatus(uint8_t data) {
    EE_writeEnable();

    CO_STOR_SS_LOW();

    /* write two bytes */
    CO_STOR_SPIBUF = EE_CMD_WRSR;
    CO_STOR_SPIBUF = data;

    /* read two bytes after they are ready */
    while(CO_STOR_SPISTATbits.SPIRBE);
    dummy = CO_STOR_SPIBUF;
    while(CO_STOR_SPISTATbits.SPIRBE);
    dummy = CO_STOR_SPIBUF;

    CO_STOR_SS_HIGH();
}

/**
 * Enable write protection for upper half of the eeprom
 */
#define EE_writeProtect() EE_writeStatus(0x88)
/*
 * Disable write protection for upper half of the eeprom
 */
#define EE_writeUnprotect() EE_writeStatus(0)


/**
 * Write to SPI and at the same time read from SPI.
 *
 * @param tx Ponter to transmitting data. If NULL, zeroes will be transmitted.
 * @param rx Ponter to data buffer, where received data wile be stored.
 * If null, Received data will be disregarded.
 * @param len Length of data buffers. Max SPI_FIFO_SIZE.
 */
static void EE_SPIwrite(uint8_t *tx, uint8_t *rx, uint8_t len) {
    /* write bytes into SPI_TXB fifo buffer */
    if (tx != NULL) {
        for (uint8_t i = 0; i < len; i++) CO_STOR_SPIBUF = tx[i];
    }
    else {
        for (uint8_t i = 0; i < len; i++) CO_STOR_SPIBUF = 0;
    }

    /* read bytes from SPI_RXB fifo buffer */
    for (uint8_t i = 0; i < len; i++) {
        /* wait untill buffer is filled, then read it */
        while(CO_STOR_SPISTATbits.SPIRBE);
        if (rx != NULL) {
            rx[i] = (uint8_t) CO_STOR_SPIBUF;
        }
        else {
            dummy = CO_STOR_SPIBUF;
        }
    }
}


/******************************************************************************/
bool_t CO_eeprom_init(void *storageModule) {
    /* Configure SPI port for use with eeprom */
    CO_STOR_SS_HIGH();
    CO_STOR_SS_INIT();

    /* Stop and reset the SPI, clear the receive buffer */
    CO_STOR_SPICON = 0;
    CO_STOR_SPISTAT = 0;
    dummy = CO_STOR_SPIBUF;

    /* Clock = FPB / ((4+1) * 2) */
    CO_STOR_SPIBRG = 4;

    /* MSSEN = 0 - Master mode slave select enable bit
     * ENHBUF(bit16) = 1 - Enhanced buffer enable bit
     * Enable SPI, 8-bit mode
     * SMP = 0, CKE = 1, CKP = 0
     * MSTEN = 1 - master mode enable bit */
    CO_STOR_SPICON = 0x00018120;

    eepromAddrNextAuto = 0;
    eepromAddrNextProt = CO_STOR_EE_SIZE / 2;

    EE_writeProtect();

    /* If eeprom chip is OK, this will pass, otherwise timeout */
    for (uint16_t i = 0; i < 0xFFFF; i++) {
        if (!EE_isWriteInProcess()) {
            if (EE_isWriteProtected()) {
                return true;
            }
        }
        dummy ++; //small delay
    }

    return false;
}


/******************************************************************************/
size_t CO_eeprom_getAddr(void *storageModule, bool_t isAuto,
                         size_t len, bool_t *overflow)
{
    size_t addr;

    if (isAuto) {
        /* auto storage is processed byte by byte, no alignment necessary */
        addr = eepromAddrNextAuto;
        eepromAddrNextAuto += len;
        if (eepromAddrNextAuto > (CO_STOR_EE_SIZE / 2)) {
            *overflow = true;
        }
    }
    else {
        /* addresses for storage on command must be page aligned */
        addr = eepromAddrNextProt;
        size_t lenAligned = len & (~(CO_STOR_EE_PAGE_SIZE - 1));
        if (lenAligned < len) {
            lenAligned += CO_STOR_EE_PAGE_SIZE;
        }
        eepromAddrNextProt += lenAligned;
        if (eepromAddrNextProt > CO_STOR_EE_SIZE) {
            *overflow = true;
        }
    }

    return addr;
}


/******************************************************************************/
void CO_eeprom_readBlock(void *storageModule, uint8_t *data,
                         size_t eepromAddr, size_t len)
{
    uint8_t buf[3] = {
        EE_CMD_READ,
        (uint8_t) (eepromAddr >> 8),
        (uint8_t) eepromAddr
    };

    CO_STOR_SS_LOW();
    EE_SPIwrite(buf, NULL, 3);

    while (len > 0) {
        uint8_t subLen = len <= SPI_FIFO_SIZE ? (uint8_t)len : SPI_FIFO_SIZE;

        EE_SPIwrite(NULL, data, subLen);
        len -= subLen;
        data += subLen;
    }

    CO_STOR_SS_HIGH();
}


/******************************************************************************/
bool_t CO_eeprom_writeBlock(void *storageModule, uint8_t *data,
                            size_t eepromAddr, size_t len)
{
    while(EE_isWriteInProcess());
    EE_writeUnprotect();
    while(EE_isWriteInProcess());

    while (len > 0) {
        uint8_t buf[3] = {
            EE_CMD_WRITE,
            (uint8_t) (eepromAddr >> 8),
            (uint8_t) eepromAddr,
        };

        EE_writeEnable();

        CO_STOR_SS_LOW();
        EE_SPIwrite(buf, NULL, 3);

        for (uint8_t i = 0; i < (CO_STOR_EE_PAGE_SIZE / SPI_FIFO_SIZE); i++) {
            if (len > SPI_FIFO_SIZE) {
                EE_SPIwrite(data, NULL, SPI_FIFO_SIZE);
                len -= SPI_FIFO_SIZE;
                data += SPI_FIFO_SIZE;
            }
            else {
                EE_SPIwrite(data, NULL, (uint8_t)len);
                len = 0;
                break;
            }
        }
        CO_STOR_SS_HIGH();

        eepromAddr += CO_STOR_EE_PAGE_SIZE;

        /*  wait for completion of the write operation */
        while(EE_isWriteInProcess());
    }

    EE_writeProtect();
    while(EE_isWriteInProcess());

    return EE_isWriteProtected();
}


/******************************************************************************/
uint16_t CO_eeprom_getCrcBlock(void *storageModule,
                               size_t eepromAddr, size_t len)
{
    uint16_t crc = 0;
    uint8_t buf[SPI_FIFO_SIZE] = {
        EE_CMD_READ,
        (uint8_t) (eepromAddr >> 8),
        (uint8_t) eepromAddr
    };

    CO_STOR_SS_LOW();
    EE_SPIwrite(buf, NULL, 3);

    while (len > 0) {
        uint8_t subLen = len <= SPI_FIFO_SIZE ? (uint8_t)len : SPI_FIFO_SIZE;

        /* update crc from data part */
        EE_SPIwrite(NULL, buf, subLen);
        crc = crc16_ccitt(buf, subLen, crc);
        len -= subLen;
    }

    CO_STOR_SS_HIGH();

    return crc;
}


/******************************************************************************/
bool_t CO_eeprom_updateByte(void *storageModule, uint8_t data,
                            size_t eepromAddr)
{
    if (EE_isWriteInProcess()) {
        return false;
    }

    /* read data byte from eeprom */
    uint8_t bufTx[4] = {
        EE_CMD_READ,
        (uint8_t) (eepromAddr >> 8),
        (uint8_t) eepromAddr,
        0
    };
    uint8_t bufRx[4];
    CO_STOR_SS_LOW();
    EE_SPIwrite(bufTx, bufRx, 4);
    CO_STOR_SS_HIGH();

    /* If data in EEPROM differs, then write it to EEPROM.
     * Don't wait write to complete */
    if(bufRx[3] != data) {
        uint8_t buf[4] = {
            EE_CMD_WRITE,
            (uint8_t) (eepromAddr >> 8),
            (uint8_t) eepromAddr,
            data
        };

        EE_writeEnable();
        CO_STOR_SS_LOW();
        EE_SPIwrite(buf, NULL, 4);
        CO_STOR_SS_HIGH();
    }

    return true;
}
