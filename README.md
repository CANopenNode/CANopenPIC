CANopenPIC
==========

CANopenPIC is a CANopen stack running on PIC microcontrollers.

It is based on [CANopenNode](https://github.com/CANopenNode/CANopenNode), which is free and open source CANopen Stack and is included as a git submodule.

CANopen is the internationally standardized (EN 50325-4) ([CiA301](http://can-cia.org/standardization/technical-documents)) CAN-based higher-layer protocol for embedded control system. For more information on CANopen see http://www.can-cia.org/.


Getting or updating the project
-------------------------------
Clone the project from git repository and get submodules:

    git clone https://github.com/CANopenNode/CANopenPIC.git
    cd CANopenPIC
    git submodule init
    git submodule update

Update the project:

    cd CANopenPIC
    git pull # or: git fetch; inspect the changes (gitk); git merge
    git submodule update


Using on PIC32, dsPIC33, PIC24 and dsPIC30
------------------------------------------
Visit [Microchip](http://www.microchip.com/) and Install MplabX IDE, XC32 C compiler for PIC32 or XC16 C compiler for others. Works on Linux, Mac or Windows.

PIC programmer is required, for example [PICkit 4](https://microchipdeveloper.com/pickit4:start).

Open one of the example projects, build and program your microcontroller.

Program is tested on Explorer16 board from Microchip with devices PIC32MX795F512L and dsPIC33FJ256GP710, and on Max32 board. CAN transciever chip must be soldered to the Explorer16 board.

Program also compiles for dsPIC30F6015, should work, but is not tested.

After connecting the CANopen PIC device into the CAN(open) network, bootup message is visible. By default device uses Object Dictionary from `CANopenNode/example`, which contains only communication parameters. With the external CANopen tool all parameters can be accessed and CANopen PIC device can be configured (For example write heartbeat producer time in object 0x1017,0).

For more information and examples see https://github.com/CANopenNode/CANopenSocket.


### PIC32 on Arduino style Max32 board
- [Max32 board](https://reference.digilentinc.com/reference/microprocessor/max32/start) with [PIC32MX795F512L](https://www.microchip.com/wwwproducts/en/PIC32MX795F512L) Microcontroller.
- Board must be programmed directly from MPLAB X, with PIC programmer, [PICkit 4](https://microchipdeveloper.com/pickit4:start) for example. It is necessary to solder the connector for programmer to the Max32 board.
- Add CAN transciever (MCP2551 or similar) and EEEPROM (25LC128 or similar) chips to the board. See example schema below. CAN connector is DB9, according to CiA303,1, values in brackets are pins for flat cable, if used with DB9 connector.

      +-------+             +-------------+                +----------------+
      |       |           5-| VREF    RXD |-4-----------45-| C1RX/ETXD1/RF0 |
      | CAN_L |-2(3)------6-| CAN_L   VCC |-3-------+--5V0-| VCC5V0         |
      | CAN_H |-7(4)------7-| CAN_H   GND |-2--+    |      |                |
      |       |        +--8-| RS      TXD |-1--|----|---46-| C1TX/ETXD0/RF1 |
      |       |        |    +-------------+    |    |      |                |
      |       |      47kΩ    MCP2551           |  100nF    |                |
      |       |        |                       |    |      |                |
      | GND   |-3(5)---+------------GND--------+----+--GND-| GND            |
      +-------+                                            |                |
       DB9                                                 |                |
                                                           |                |
                  +-----------------------------+------3V3-| VCC3V3         |
                  |  +--------------------------|-------29-| SDI2/RG7       |
                  |  |  +-----------------------|-------53-| SS2/RG9        |
                  |  |  |                       |          |                |
                  |  |  |   +-------------+     |          |                |
                  |  |  +-1-| !CS     VCC |-8---+          |                |
                  |  +----2-| SO    !HOLD |-7---+          |                |
                  +-------3-| !WP     SCK |-6---|-------52-| SCK2/RG6       |
                        +-4-| GND      SI |-5---|-------43-| SDO2/RG8       |
                        |   +-------------+     |          |                |
                        |    25LC128          100nF        |                |
                        |                       |          |                |
                        +-----------------------+------GND-| GND            |
                                                           +----------------+
                                                            Max32

- If EEprom chip is not used or connected differently, disable or configure it in CO_driver_custom.h file.
- File appl_max32_demo.c contains entry functions for custom application in Arduino style with additional CANopen communicationReset function and real-time thread.
- Default CAN bitrate is 250kbps and CANopen NodeId is 0x30. See appl_max32_demo.c file. Can also be configured by CANopen LSS commands.
- After Max32 is first connected to the CANopen network it shows bootup message and emergency message, because it has empty eeprom. It is necessary to trigger saveAll command and reset: `cocomm "0x30 w 0x1010 1 vs save" "0x30 reset node"`. To see heartbeat messages use: `cocomm "0x30 w 0x1017 0 u16 1000"`, etc. See also https://github.com/CANopenNode/CANopenSocket.


Starting new project with MplabX
--------------------------------
#### Create new project
- Microchip Embedded, Standalone Project
- Choose device, compiler
- Specify project name and location, set UTF-8
- Add header and source files, may be organized in logical folders, see example


#### MplabX project configuration:
- encoding: UTF-8
- (gcc -> optimization-level = 1)
- Global Options -> Use legacy libc: NO
- Global Options -> Additional options : Add `-std=gnu99`
- gcc -> Include directories (example_PIC32): `.;../PIC32;../CANopenNode`
- Add `DO.h` and `OD.c` files to the project or include `../CANopenNode/example` above.
- ld -> Heap size (bytes): 10000 (see heapMemoryUsed in main() for actual usage).
  If macro `CO_USE_GLOBALS` is definded, then heap is not needed.


Change Log
----------
- **[Unreleased(v4.0)](https://github.com/CANopenNode/CANopenPIC/tree/HEAD)**: Update CANopenNode to branch v4.0. [Full Changelog](https://github.com/CANopenNode/CANopenPIC/compare/v2.0...master)
  - Update CANopenNode to branch v4.0 (new object dictionary interface).
  - Minor updates in the drivers.
  - PIC32: renewed storage, main_PIC32.c and application interface.
  - Added Max32 board example.
  - Put some project files into gitignore.
  - Cleanup readme.md, wider example will be in CANopenSocket.
- **[v2.0](https://github.com/CANopenNode/CANopenPIC/tree/v2.0) - 2021-04-08**: Update CANopenNode to branch v2.0. [Full Changelog](https://github.com/CANopenNode/CANopenPIC/compare/v1.0...v2.0)
  - Update CANopenNode to branch v2.0.
  - License changed to Apache 2.0.
  - Drivers moved from CANopenNode into this project. Changed directory structure. Changed CANopen.h interface.
  - Trace added to PIC32. Time base changed to microseconds in all functions.
  - LSS slave running in all microcontrollers.
- **[v1.0](https://github.com/CANopenNode/CANopenPIC/tree/v1.0) - 2016-03-21**: Stable. [Full Changelog](https://github.com/CANopenNode/CANopenPIC/compare/v0.5...v1.0)
- **[v0.5](https://github.com/CANopenNode/CANopenPIC/tree/v0.5) - 2015-10-20**: Git repository started on GitHub.
- **[v0.4](https://sourceforge.net/p/canopennode/code_complete/ci/master/tree/) - 2012-02-26**: Git repository started on Sourceforge.
- **[v0.3](https://sourceforge.net/projects/canopennode/files/canopennode/CANopenNode-3.00/) - 2011-08-26**: First edition for 16 and 32 bit PIC on SourceForge.


License
-------
This file is part of CANopenNode, an opensource CANopen Stack.
Project home page is <https://github.com/CANopenNode/CANopenNode>.
For more information on CANopen see <http://www.can-cia.org/>.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
