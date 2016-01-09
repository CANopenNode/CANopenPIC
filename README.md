CANopenPIC
==========

CANopenPIC is a CANopen stack running on PIC microcontrollers.

It is based on [CANopenNode](https://github.com/CANopenNode/CANopenNode),
which is free and open source CANopen Stack and is included as a git submodule.

CANopen is the internationally standardized (EN 50325-4)
([CiA301](http://can-cia.org/standardization/technical-documents))
CAN-based higher-layer protocol for embedded control system. For more
information on CANopen see http://www.can-cia.org/


Getting the project
------------------
Clone the project from git repository and get submodules:

    $ git clone https://github.com/CANopenNode/CANopenPIC.git
    $ cd CANopenPIC
    $ git submodule init
    $ git submodule update


Using on PIC32, dsPIC33, PIC24 and dsPIC30
------------------------------------------
Visit [Microchip](http://www.microchip.com/) and Install MplabX IDE,
XC32 C compiler for PIC32 or XC16 C compiler for others.
Works on Linux, Mac or Windows.

Open Project, build and program your microcontroller.

Program is tested on Explorer16 board from Microchip, devices
PIC32MX795F512L and dsPIC33FJ256GP710.
CAN transciever chip is soldered to the Explorer16 board.

You can use connect the PIC device into your CANopen network and
watch the CAN messages. TPDO is sent on buttons pressed. Correct RPDO
will switch leds on explorer16 board.

You can also use Linux computer, (USB to) CAN interface and
[CANopenSocket](https://github.com/CANopenNode/CANopenSocket) as another
CANopen node. It also includes CAN monitor and command line interface for
master access of the CANopen network. There is also some Getting started.


License
-------
CANopenPIC is distributed under the terms of the GNU General Public
License version 2 with the classpath exception.

CANopenPIC is free and open source software: you can redistribute
it and/or modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, either version 2 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

Following clarification and special exception to the GNU General Public
License is included to the distribution terms of CANopenPIC:

Linking this library statically or dynamically with other modules is
making a combined work based on this library. Thus, the terms and
conditions of the GNU General Public License cover the whole combination.

As a special exception, the copyright holders of this library give
you permission to link this library with independent modules to
produce an executable, regardless of the license terms of these
independent modules, and to copy and distribute the resulting
executable under terms of your choice, provided that you also meet,
for each linked independent module, the terms and conditions of the
license of that module. An independent module is a module which is
not derived from or based on this library. If you modify this
library, you may extend this exception to your version of the
library, but you are not obliged to do so. If you do not wish
to do so, delete this exception statement from your version.
