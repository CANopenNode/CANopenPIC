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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/stack/CO_Emergency.c ../CANopenNode/stack/CO_HBconsumer.c ../CANopenNode/stack/CO_NMT_Heartbeat.c ../CANopenNode/stack/CO_PDO.c ../CANopenNode/stack/CO_SDO.c ../CANopenNode/stack/CO_SYNC.c ../CANopenNode/stack/crc16-ccitt.c ../CANopenNode/stack/PIC32/CO_driver.c ../CANopenNode/stack/PIC32/eeprom.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c ../CANopenNode/stack/PIC32/main_PIC32.c ../appl_PIC32_explorer16_IO.c ../CANopenNode/stack/CO_trace.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/994165574/CO_Emergency.o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ${OBJECTDIR}/_ext/827655488/CO_driver.o ${OBJECTDIR}/_ext/827655488/eeprom.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/827655488/main_PIC32.o ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o ${OBJECTDIR}/_ext/994165574/CO_trace.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d ${OBJECTDIR}/_ext/827655488/CO_driver.o.d ${OBJECTDIR}/_ext/827655488/eeprom.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/_ext/827655488/main_PIC32.o.d ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d ${OBJECTDIR}/_ext/994165574/CO_trace.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/994165574/CO_Emergency.o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ${OBJECTDIR}/_ext/827655488/CO_driver.o ${OBJECTDIR}/_ext/827655488/eeprom.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/827655488/main_PIC32.o ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o ${OBJECTDIR}/_ext/994165574/CO_trace.o

# Source Files
SOURCEFILES=../CANopenNode/stack/CO_Emergency.c ../CANopenNode/stack/CO_HBconsumer.c ../CANopenNode/stack/CO_NMT_Heartbeat.c ../CANopenNode/stack/CO_PDO.c ../CANopenNode/stack/CO_SDO.c ../CANopenNode/stack/CO_SYNC.c ../CANopenNode/stack/crc16-ccitt.c ../CANopenNode/stack/PIC32/CO_driver.c ../CANopenNode/stack/PIC32/eeprom.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c ../CANopenNode/stack/PIC32/main_PIC32.c ../appl_PIC32_explorer16_IO.c ../CANopenNode/stack/CO_trace.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/994165574/CO_Emergency.o: ../CANopenNode/stack/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o ../CANopenNode/stack/CO_Emergency.c     
	
${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o: ../CANopenNode/stack/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ../CANopenNode/stack/CO_HBconsumer.c     
	
${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o: ../CANopenNode/stack/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ../CANopenNode/stack/CO_NMT_Heartbeat.c     
	
${OBJECTDIR}/_ext/994165574/CO_PDO.o: ../CANopenNode/stack/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ../CANopenNode/stack/CO_PDO.c     
	
${OBJECTDIR}/_ext/994165574/CO_SDO.o: ../CANopenNode/stack/CO_SDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ../CANopenNode/stack/CO_SDO.c     
	
${OBJECTDIR}/_ext/994165574/CO_SYNC.o: ../CANopenNode/stack/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ../CANopenNode/stack/CO_SYNC.c     
	
${OBJECTDIR}/_ext/994165574/crc16-ccitt.o: ../CANopenNode/stack/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ../CANopenNode/stack/crc16-ccitt.c     
	
${OBJECTDIR}/_ext/827655488/CO_driver.o: ../CANopenNode/stack/PIC32/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/CO_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/CO_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/CO_driver.o.d" -o ${OBJECTDIR}/_ext/827655488/CO_driver.o ../CANopenNode/stack/PIC32/CO_driver.c     
	
${OBJECTDIR}/_ext/827655488/eeprom.o: ../CANopenNode/stack/PIC32/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/eeprom.o.d" -o ${OBJECTDIR}/_ext/827655488/eeprom.o ../CANopenNode/stack/PIC32/eeprom.c     
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c     
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c     
	
${OBJECTDIR}/_ext/827655488/main_PIC32.o: ../CANopenNode/stack/PIC32/main_PIC32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/main_PIC32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/main_PIC32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/827655488/main_PIC32.o ../CANopenNode/stack/PIC32/main_PIC32.c     
	
${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o: ../appl_PIC32_explorer16_IO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o ../appl_PIC32_explorer16_IO.c     
	
${OBJECTDIR}/_ext/994165574/CO_trace.o: ../CANopenNode/stack/CO_trace.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_trace.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_trace.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_trace.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_trace.o ../CANopenNode/stack/CO_trace.c     
	
else
${OBJECTDIR}/_ext/994165574/CO_Emergency.o: ../CANopenNode/stack/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_Emergency.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_Emergency.o ../CANopenNode/stack/CO_Emergency.c     
	
${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o: ../CANopenNode/stack/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_HBconsumer.o ../CANopenNode/stack/CO_HBconsumer.c     
	
${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o: ../CANopenNode/stack/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_NMT_Heartbeat.o ../CANopenNode/stack/CO_NMT_Heartbeat.c     
	
${OBJECTDIR}/_ext/994165574/CO_PDO.o: ../CANopenNode/stack/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_PDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_PDO.o ../CANopenNode/stack/CO_PDO.c     
	
${OBJECTDIR}/_ext/994165574/CO_SDO.o: ../CANopenNode/stack/CO_SDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SDO.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_SDO.o ../CANopenNode/stack/CO_SDO.c     
	
${OBJECTDIR}/_ext/994165574/CO_SYNC.o: ../CANopenNode/stack/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_SYNC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_SYNC.o ../CANopenNode/stack/CO_SYNC.c     
	
${OBJECTDIR}/_ext/994165574/crc16-ccitt.o: ../CANopenNode/stack/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/994165574/crc16-ccitt.o ../CANopenNode/stack/crc16-ccitt.c     
	
${OBJECTDIR}/_ext/827655488/CO_driver.o: ../CANopenNode/stack/PIC32/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/CO_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/CO_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/CO_driver.o.d" -o ${OBJECTDIR}/_ext/827655488/CO_driver.o ../CANopenNode/stack/PIC32/CO_driver.c     
	
${OBJECTDIR}/_ext/827655488/eeprom.o: ../CANopenNode/stack/PIC32/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/eeprom.o.d" -o ${OBJECTDIR}/_ext/827655488/eeprom.o ../CANopenNode/stack/PIC32/eeprom.c     
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c     
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c     
	
${OBJECTDIR}/_ext/827655488/main_PIC32.o: ../CANopenNode/stack/PIC32/main_PIC32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/827655488" 
	@${RM} ${OBJECTDIR}/_ext/827655488/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/827655488/main_PIC32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/827655488/main_PIC32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/827655488/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/827655488/main_PIC32.o ../CANopenNode/stack/PIC32/main_PIC32.c     
	
${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o: ../appl_PIC32_explorer16_IO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/_ext/1472/appl_PIC32_explorer16_IO.o ../appl_PIC32_explorer16_IO.c     
	
${OBJECTDIR}/_ext/994165574/CO_trace.o: ../CANopenNode/stack/CO_trace.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/994165574" 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/994165574/CO_trace.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/994165574/CO_trace.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_SDO_BUFFER_SIZE=950 -I"../CANopenNode/example" -I"../CANopenNode/stack/PIC32" -I"../CANopenNode/stack" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/994165574/CO_trace.o.d" -o ${OBJECTDIR}/_ext/994165574/CO_trace.o ../CANopenNode/stack/CO_trace.c     
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}              -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=5000,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}            -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=5000,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
