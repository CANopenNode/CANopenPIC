# CANopenPIC

CANopenPIC is a CANopen stack running on PIC microcontrollers.
It is based on [CANopenNode](https://github.com/CANopenNode/CANopenNode),
which is an opensource [CANopen](http://can-cia.org/) Stack
([CiA301](http://can-cia.org/standardization/technical-documents)) and
is included as a git submodule.

## Using on PIC32
Visit [Microchip](http://www.microchip.com/) and Install MplabX,
XC32 C compiler and peripheral libraries. Open Project, build and program
PIC32 microcontroller. Program is tested on Explorer16 board from Microchip,
device PIC32MX795F512L. (CAN transciever chip is soldered to the board.)
