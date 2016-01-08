#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/stack/dsPIC30F/CO_driver.c ../CANopenNode/stack/CO_Emergency.c ../CANopenNode/stack/CO_HBconsumer.c ../CANopenNode/stack/CO_NMT_Heartbeat.c ../CANopenNode/stack/CO_PDO.c ../CANopenNode/stack/CO_SDO.c ../CANopenNode/stack/CO_SYNC.c ../CANopenNode/stack/crc16-ccitt.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c ../main_dsPIC30F.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1212632617/CO_driver.o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1212632617/CO_driver.o.d ${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1212632617/CO_driver.o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o

# Source Files
SOURCEFILES=../CANopenNode/stack/dsPIC30F/CO_driver.c ../CANopenNode/stack/CO_Emergency.c ../CANopenNode/stack/CO_HBconsumer.c ../CANopenNode/stack/CO_NMT_Heartbeat.c ../CANopenNode/stack/CO_PDO.c ../CANopenNode/stack/CO_SDO.c ../CANopenNode/stack/CO_SYNC.c ../CANopenNode/stack/crc16-ccitt.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c ../main_dsPIC30F.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F4011
MP_LINKER_FILE_OPTION=,--script=p30F4011.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1212632617/CO_driver.o: ../CANopenNode/stack/dsPIC30F/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1212632617" 
	@${RM} ${OBJECTDIR}/_ext/1212632617/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1212632617/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/dsPIC30F/CO_driver.c  -o ${OBJECTDIR}/_ext/1212632617/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1212632617/CO_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1212632617/CO_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_Emergency.o: ../CANopenNode/stack/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_Emergency.c  -o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o: ../CANopenNode/stack/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o: ../CANopenNode/stack/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_PDO.o: ../CANopenNode/stack/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_PDO.c  -o ${OBJECTDIR}/_ext/994165574/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_SDO.o: ../CANopenNode/stack/CO_SDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_SDO.c  -o ${OBJECTDIR}/_ext/994165574/CO_SDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_SYNC.o: ../CANopenNode/stack/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_SYNC.c  -o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/crc16-ccitt.o: ../CANopenNode/stack/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_dsPIC30F.o: ../main_dsPIC30F.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_dsPIC30F.c  -o ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1212632617/CO_driver.o: ../CANopenNode/stack/dsPIC30F/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1212632617" 
	@${RM} ${OBJECTDIR}/_ext/1212632617/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1212632617/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/dsPIC30F/CO_driver.c  -o ${OBJECTDIR}/_ext/1212632617/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1212632617/CO_driver.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1212632617/CO_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_Emergency.o: ../CANopenNode/stack/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_Emergency.c  -o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o: ../CANopenNode/stack/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o: ../CANopenNode/stack/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_PDO.o: ../CANopenNode/stack/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_PDO.c  -o ${OBJECTDIR}/_ext/994165574/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_SDO.o: ../CANopenNode/stack/CO_SDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_SDO.c  -o ${OBJECTDIR}/_ext/994165574/CO_SDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/CO_SYNC.o: ../CANopenNode/stack/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/CO_SYNC.c  -o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/994165574/crc16-ccitt.o: ../CANopenNode/stack/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/stack/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main_dsPIC30F.o: ../main_dsPIC30F.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main_dsPIC30F.c  -o ${OBJECTDIR}/_ext/1472/main_dsPIC30F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d"        -g -omf=elf -no-legacy-libc  -O0 -I"../CANopenNode/example" -I"../CANopenNode/stack/dsPIC30F" -I"../CANopenNode/stack" -I"../CANopenNode" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main_dsPIC30F.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -no-legacy-libc   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--heap=1000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -no-legacy-libc  -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=1000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/dsPIC30F.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
