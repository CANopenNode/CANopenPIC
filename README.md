CANopenPIC
==========

CANopenPIC is a CANopen stack running on PIC microcontrollers.

It is based on [CANopenNode](https://github.com/CANopenNode/CANopenNode),
which is free and open source CANopen Stack and is included as a git submodule.

CANopen is the internationally standardized (EN 50325-4)
([CiA301](http://can-cia.org/standardization/technical-documents))
CAN-based higher-layer protocol for embedded control system. For more
information on CANopen see http://www.can-cia.org/


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
Visit [Microchip](http://www.microchip.com/) and Install MplabX IDE,
XC32 C compiler for PIC32 or XC16 C compiler for others.
Works on Linux, Mac or Windows.

Open project, build and program your microcontroller.

Program is tested on Explorer16 board from Microchip, devices
PIC32MX795F512L and dsPIC33FJ256GP710.
CAN transciever chip is soldered to the Explorer16 board.

Program also compiles for dsPIC30F6015, should work, but is not tested.

You can connect the PIC device into your CANopen network and
watch the CAN messages. TPDO is sent on buttons pressed. Correct RPDO
will switch leds on explorer16 board.

#### MplabX project configuration:
- encoding: UTF-8
- (gcc -> optimization-level = 1)
- Global Options -> Use legacy libc: NO
- gcc -> Include directories (PIC32): .
                                      ../PIC32
                                      ../CANopenNode/example;
                                      ../CANopenNode
- ld -> Heap size (bytes): 5000 (see heapMemoryUsed in main() for actual usage).
  If macro `CO_USE_GLOBALS` is definded, then heap is not needed.

Example usage
-------------

#### Using with CANopen command interface
Linux command interface, as described in CANopenNode
[Getting Started](https://github.com/CANopenNode/CANopenNode/blob/master/doc/gettingStarted.md),
connected to CAN network (via (USB to) CAN interface), can be used for testing.
It acts as another CANopen device. It also includes CAN monitor and command line
interface for master access to the CANopen network.
Here is a quick example for Explorer16 board leds and buttons:


    sudo ip link set up can0 type can bitrate 250000
    candump can0

Pressing some buttons on Explorer16 board will produce PDO.

Another terminal, start CANopen "master" device:

    cd CANopenNode
    ./canopend vcan0 -i1 -c "stdio"

Type into program command interface. Set heartbeat of the PIC to 5 seconds:

    0x30 w 0x1017 0 i16 5000

Third terminal, generate CAN message, which should make LEDs on Explorer16 board blinking:

    cangen can0 -I 230 -L2 -g100 -Di

candump output:

    can0  730   [1]  00
    can0  1B0   [2]  00 00
    can0  701   [1]  05       # canopend heartbeat
    can0  730   [1]  05       # PIC heartbeat
    can0  1B0   [2]  01 00    # button pressed
    can0  1B0   [2]  00 00
    can0  701   [1]  05
    can0  730   [1]  05
    can0  630   [8]  2B 17 10 00 88 13 00 00
    can0  5B0   [8]  60 17 10 00 00 00 00 00
    can0  701   [1]  05
    can0  701   [1]  05
    can0  701   [1]  05
    can0  701   [1]  05
    can0  701   [1]  05
    can0  730   [1]  05
    can0  701   [1]  05
    can0  230   [2]  00 00    # cangen
    can0  230   [2]  01 00
    can0  230   [2]  02 00
    can0  230   [2]  03 00
    can0  230   [2]  04 00
    can0  230   [2]  05 00
    can0  701   [1]  05

#### Configuration CANopen node-id and CAN bit-rate with LSS
All microcontrollers are LSS slaves by default, see
[LSS usage](https://github.com/CANopenNode/CANopenNode/blob/master/doc/LSSusage.md).

Please note, eeprom storage of variables is not implemented in examples, so
node node-id and bit-rate are not preserved.

#### Monitor variables using built in trace functionality
CANopenNode includes optional trace functionality. It monitors
choosen variables from Object Dictionary. On change of state of variable it
makes a record with timestamp into circular buffer. String with points can later
be read via SDO.

Trace is disabled by default. It can be enabled using Object Dictionary editor.
Include also *CO_trace.h/.c* into project, compile and run.

Here is en example of monitoring variable, connected with buttons
(OD_readInput8Bit, index 0x6000, subindex 0x01). It was tested on PIC32:

```
# Enable trace first:
./canopencomm 0x30 w 0x2400 0 u8 1

# Press and hold the button on Explorer16 and execute SDO read command:
./canopencomm 0x30 r 0x6000 1 u8
[1] 0x08
# It displays same value, as was transmitted via PDO and visible on candump.

# Now get the complete history for that buttons with timestamp for each change
# and store it as a text to the file:
./canopencomm 0x30 r 0x2401 5 vs > plot1.csv
cat plot1.csv
```
If large data blocks are transmitted via CAN bus, then more efficient SDO block
transfer can be enabled with command `./canopencomm set sdo_block 1`

For more info on using trace functionality see CANopenNode/example/IO.html
file. There is also a description of all Object Dictionary variables.

Trace functionality can also be configured on CANopenSocket directly. In that
case CANopenSocket must first receive PDO data from remote node(s) and store it
to the local Object Dictionary variable. CANopenSocket's trace then monitors
that variable. Text buffer is then read with the similar command as above. But
local SDO data access from CANopenSocket itself doesn't occupy CAN bus, so large
data is transfered realy fast. Besides that, Linux machine has much more RAM to
store the monitored data. Except timestamp is less accurate.


Change Log
----------
- **[Unreleased](https://github.com/CANopenNode/CANopenPIC/tree/HEAD)**: [Full Changelog](https://github.com/CANopenNode/CANopenPIC/compare/v1.0...master)
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
