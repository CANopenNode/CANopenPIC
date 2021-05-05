/*
 * Custom definitions for CANopenNode.
 *
 * @file        CO_driver_target.h
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

#ifndef CO_DRIVER_CUSTOM_H
#define CO_DRIVER_CUSTOM_H

#ifdef __cplusplus
extern "C" {
#endif

/* This file contains application specific custom definitions for CANopenNode.
 * It is included from CO_driver_target.h, so it may override any default
 * setting. See also file CO_config.h. */


/* Configure storage - override default setting, so eeprom on explorer16 board
 * works too. For CS signal use RG9 and RD12 ports. See CO_eepromPIC32.c. */
#define CO_STOR_SS
#define CO_STOR_SS_INIT()   {TRISGCLR = 0x0200; TRISDCLR = 0x1000;}
#define CO_STOR_SS_LOW()    {PORTGCLR = 0x0200; PORTDCLR = 0x1000;}
#define CO_STOR_SS_HIGH()   {PORTGSET = 0x0200; PORTDSET = 0x1000;}

/* Override eeprom size in bytes, 0x8000 for 25LC256 */
//#define CO_STOR_EE_SIZE 0x8000

/* If eeprom is not present, disable storage */
//#define CO_CONFIG_STORAGE (0)


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CO_DRIVER_CUSTOM_H */
