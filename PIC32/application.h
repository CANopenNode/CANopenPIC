/**
 * Application interface for CANopenNode.
 *
 * @file        application.h
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

#ifndef APPLICATION_H
#define APPLICATION_H

#include "CANopen.h"


/**
 * Application interface, similar to Arduino, extended to CANopen and
 * additional, realtime thread.
 */


/**
 * Function is called once on the program startup, after Object dictionary
 * initialization and before CANopen initialization.
 *
 * @param [in,out] bitRate Stored CAN bit rate, can be overridden.
 * @param [in,out] nodeId Stored CANopen NodeId, can be overridden.
 * @param [out] errInfo Variable may indicate error information - index of
 * erroneous OD entry.
 *
 * @return @ref CO_ReturnError_t CO_ERROR_NO in case of success.
 */
CO_ReturnError_t app_programStart(uint16_t *bitRate,
                                  uint8_t *nodeId,
                                  uint32_t *errInfo);


/**
 * Function is called after CANopen communication reset.
 *
 * @param co CANopen object.
 */
void app_communicationReset(CO_t *co);


/**
 * Function is called just before program ends.
 */
void app_programEnd();


/**
 * Function is called cyclically from main().
 *
 * @param co CANopen object.
 * @param timer1usDiff Time difference since last call in microseconds
 */
void app_programAsync(CO_t *co, uint32_t timer1usDiff);


/**
 * Function is called cyclically from realtime thread at constant intervals.
 *
 * Code inside this function must be executed fast. Take care on race conditions
 * with app_programAsync.
 *
 * @param co CANopen object.
 * @param timer1usDiff Time difference since last call in microseconds
 */
void app_programRt(CO_t *co, uint32_t timer1usDiff);


/**
 * Function is called in the beginning of the realtime thread.
 */
void app_peripheralRead(CO_t *co);


/**
 * Function is called in the end of the realtime thread.
 */
void app_peripheralWrite(CO_t *co);


#endif /* APPLICATION_H */
