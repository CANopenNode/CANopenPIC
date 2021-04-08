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
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../CANopenNode/extra/CO_trace.c ../PIC32/CO_driver.c ../PIC32/eeprom.c ../PIC32/main_PIC32.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c appl_PIC32_explorer16_IO.c ../CANopenNode/301/CO_SDOclient.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ${OBJECTDIR}/_ext/2137914310/eeprom.o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d ${OBJECTDIR}/_ext/981374158/CO_trace.o.d ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d ${OBJECTDIR}/_ext/2137914310/eeprom.o.d ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ${OBJECTDIR}/_ext/2137914310/eeprom.o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o

# Source Files
SOURCEFILES=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../CANopenNode/extra/CO_trace.c ../PIC32/CO_driver.c ../PIC32/eeprom.c ../PIC32/main_PIC32.c ../CANopenNode/CANopen.c ../CANopenNode/example/CO_OD.c appl_PIC32_explorer16_IO.c ../CANopenNode/301/CO_SDOclient.c



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
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/41f3dc160a8a1d0518836573976cc01d83de5a9a.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ../CANopenNode/301/CO_Emergency.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/268d8da7c26158772bf814419eef6b9dab3b3ac.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ../CANopenNode/301/CO_HBconsumer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/7013398a856006a43056a54a59a28c767ee1a9ea.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ../CANopenNode/301/CO_NMT_Heartbeat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/4b1055b58d1cd934392345f1108e64d5c9c7e3f7.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ../CANopenNode/301/CO_PDO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/da1746b14baebdda446839bb79570df88810ce80.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ../CANopenNode/301/CO_SDOserver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/d200ac63de9e89c3e04e3fd801157eabe404902b.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ../CANopenNode/301/CO_SYNC.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/b9f776929a9803c7c4cada96cb414067b5bbf609.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ../CANopenNode/301/CO_TIME.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/b2be986e78a09bf6742a3b32fd5cdb4be319e79c.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ../CANopenNode/301/crc16-ccitt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/90bb9c5d4e30a12fa8ec858659de71b008837a3c.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ../CANopenNode/301/CO_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/7c35cbc1d4636817a47bf26001e0e75d9c8bce41.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ../CANopenNode/303/CO_LEDs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/15dce3a8bb3e09ebf6e39adf04a8483ba866116f.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ../CANopenNode/305/CO_LSSmaster.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/cb8c2c71de3badac4cafd7f79c06094160e20906.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ../CANopenNode/305/CO_LSSslave.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/a9e544cb153111e3c45157d34cb43b29306a7964.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" -o ${OBJECTDIR}/_ext/981374158/CO_trace.o ../CANopenNode/extra/CO_trace.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/CO_driver.o: ../PIC32/CO_driver.c  .generated_files/ea9d2591d0793dfbe91baf9f91988d2104c8f0c1.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" -o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ../PIC32/CO_driver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/eeprom.o: ../PIC32/eeprom.c  .generated_files/43347cd8c26c90ee269e36a764c3889466b4fc57.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" -o ${OBJECTDIR}/_ext/2137914310/eeprom.o ../PIC32/eeprom.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/main_PIC32.o: ../PIC32/main_PIC32.c  .generated_files/b5aaa587c7b547b3195a203c3376ebd4d012a04c.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ../PIC32/main_PIC32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/4f4132d1c59c603e497dcf67fefd9964fbadc229.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/38a58e9c7c74b4f6757076524d75ab9430e705a3.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/appl_PIC32_explorer16_IO.o: appl_PIC32_explorer16_IO.c  .generated_files/29a5ba2120f3cbd0530043e4450265641b26bf1f.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o appl_PIC32_explorer16_IO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/4bba8a2785a2bbaab460a82b56bbb750f9e722cf.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ../CANopenNode/301/CO_SDOclient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/d59e24fe65ac3ecde749892faa0feb390c5dcffd.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ../CANopenNode/301/CO_Emergency.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/c82a359df95f4cd3d17d05fef50a1a499c138ed5.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ../CANopenNode/301/CO_HBconsumer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/baa78296752dc9ff1793443c721b21d91be59b0a.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ../CANopenNode/301/CO_NMT_Heartbeat.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/e3caa183ff8b143dd21e4cbf3df7a064ec8a9020.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ../CANopenNode/301/CO_PDO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/ea4f80f6f50a411f31d5990dbc2428b8de6391e2.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ../CANopenNode/301/CO_SDOserver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/6d04ec854bd710df42d20f614e37ec4b028ee580.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ../CANopenNode/301/CO_SYNC.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/e1f479d0050c4e3af208aee5b43ae94a5c85c458.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ../CANopenNode/301/CO_TIME.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/4d4e13ce98aac24dc2d234fbd9d92e59ac68e3d2.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d" -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ../CANopenNode/301/crc16-ccitt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/c0763ad7c9f443f5abc261813c3eba8ac959fd9f.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ../CANopenNode/301/CO_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/e460ff2a78b76210811e9ac8c575d3e9b887dd62.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d" -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ../CANopenNode/303/CO_LEDs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/d98cc5a5b1965ce2822d2000af96ea181131de04.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ../CANopenNode/305/CO_LSSmaster.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/1fa11bc0fa32cd7f416dc837e3e37e263bd8f0d.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d" -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ../CANopenNode/305/CO_LSSslave.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/420261363580fd1190a9100a6417f1956b96daf6.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d" -o ${OBJECTDIR}/_ext/981374158/CO_trace.o ../CANopenNode/extra/CO_trace.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/CO_driver.o: ../PIC32/CO_driver.c  .generated_files/f0f8029c1bb64c54044f754bec27ddee36e426b2.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/CO_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/CO_driver.o.d" -o ${OBJECTDIR}/_ext/2137914310/CO_driver.o ../PIC32/CO_driver.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/eeprom.o: ../PIC32/eeprom.c  .generated_files/71584ed347785cc35b3fef4f3b85cae4360bc1b9.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/eeprom.o.d" -o ${OBJECTDIR}/_ext/2137914310/eeprom.o ../PIC32/eeprom.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2137914310/main_PIC32.o: ../PIC32/main_PIC32.c  .generated_files/a720e0548f1fa124949a17d746f50f4bd07bb3a.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2137914310" 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d 
	@${RM} ${OBJECTDIR}/_ext/2137914310/main_PIC32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/2137914310/main_PIC32.o.d" -o ${OBJECTDIR}/_ext/2137914310/main_PIC32.o ../PIC32/main_PIC32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/cc1567ac931cf83ba210869fa2307513e56f8185.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d" -o ${OBJECTDIR}/_ext/398055091/CANopen.o ../CANopenNode/CANopen.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/920cad4e126c6a6d832efd6c0da47fa6b1e54c54.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d" -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ../CANopenNode/example/CO_OD.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/appl_PIC32_explorer16_IO.o: appl_PIC32_explorer16_IO.c  .generated_files/782bfb25accf4a6f1add3e7d16d2659f43713323.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d 
	@${RM} ${OBJECTDIR}/appl_PIC32_explorer16_IO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/appl_PIC32_explorer16_IO.o.d" -o ${OBJECTDIR}/appl_PIC32_explorer16_IO.o appl_PIC32_explorer16_IO.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/c73ca185a20b42ba19cfc2321fb78ec6616e9bc.flag .generated_files/71b2fa7f85a22426d8b136d9a94b6b5776fdc3b0.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DCO_VERSION_MAJOR=2 -I"." -I"../PIC32" -I"../CANopenNode/example" -I"../CANopenNode" -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d" -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ../CANopenNode/301/CO_SDOclient.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -std=gnu99 $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=5000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_PIC32_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -std=gnu99 $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=5000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
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
