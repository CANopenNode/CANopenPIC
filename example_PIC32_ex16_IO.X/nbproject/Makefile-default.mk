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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../CANopenNode/extra/CO_trace.c ../PIC32/CO_driver.c ../PIC32/eeprom.c ../PIC32/main_PIC32.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c appl_PIC32_explorer16_IO.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ${OBJECTDIR}/_ext/2137914310/eeprom.o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d ${OBJECTDIR}/_ext/981374158/CO_trace.o.d ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d ${OBJECTDIR}/_ext/2137914310/eeprom.o.d ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ${OBJECTDIR}/_ext/2137914310/eeprom.o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o

# Source Files
SOURCEFILES=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../CANopenNode/extra/CO_trace.c ../PIC32/CO_driver.c ../PIC32/eeprom.c ../PIC32/main_PIC32.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c appl_PIC32_explorer16_IO.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ../CANopenNode/301/CO_Emergency.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ../CANopenNode/301/CO_HBconsumer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ../CANopenNode/301/CO_NMT_Heartbeat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ../CANopenNode/301/CO_PDO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ../CANopenNode/301/CO_SDOclient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ../CANopenNode/301/CO_SDOserver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ../CANopenNode/301/CO_SYNC.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ../CANopenNode/301/CO_TIME.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ../CANopenNode/301/crc16-ccitt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ../CANopenNode/301/CO_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ../CANopenNode/303/CO_LEDs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ../CANopenNode/305/CO_LSSmaster.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ../CANopenNode/305/CO_LSSslave.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" -o ${OBJECTDIR}/_ext/981374158/CO_trace.o ../CANopenNode/extra/CO_trace.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/CO_driver.o: ../PIC32/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" -o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ../PIC32/CO_driver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/eeprom.o: ../PIC32/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" -o ${OBJECTDIR}/_ext/2137914310/eeprom.o ../PIC32/eeprom.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/main_PIC32.o: ../PIC32/main_PIC32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ../PIC32/main_PIC32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/appl_PIC32_explorer16_IO.o: appl_PIC32_explorer16_IO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o 
	@${FIXDEPS} "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o appl_PIC32_explorer16_IO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ../CANopenNode/301/CO_Emergency.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ../CANopenNode/301/CO_HBconsumer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ../CANopenNode/301/CO_NMT_Heartbeat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ../CANopenNode/301/CO_PDO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ../CANopenNode/301/CO_SDOclient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ../CANopenNode/301/CO_SDOserver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ../CANopenNode/301/CO_SYNC.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ../CANopenNode/301/CO_TIME.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ../CANopenNode/301/crc16-ccitt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ../CANopenNode/301/CO_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ../CANopenNode/303/CO_LEDs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ../CANopenNode/305/CO_LSSmaster.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ../CANopenNode/305/CO_LSSslave.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" -o ${OBJECTDIR}/_ext/981374158/CO_trace.o ../CANopenNode/extra/CO_trace.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/CO_driver.o: ../PIC32/CO_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" -o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ../PIC32/CO_driver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/eeprom.o: ../PIC32/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" -o ${OBJECTDIR}/_ext/2137914310/eeprom.o ../PIC32/eeprom.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/2137914310/main_PIC32.o: ../PIC32/main_PIC32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ../PIC32/main_PIC32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/398055091/CANopen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/appl_PIC32_explorer16_IO.o: appl_PIC32_explorer16_IO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o 
	@${FIXDEPS} "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MMD -MF "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o appl_PIC32_explorer16_IO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=5000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=5000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
