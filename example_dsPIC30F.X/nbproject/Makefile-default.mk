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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../dsPIC30F/CO_driver.c ../CANopenNode/extra/CO_trace.c ../CANopenNode/example/CO_OD.c ../CANopenNode/CANopen.c main_dsPIC30F.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/1025206115/CO_driver.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/main_dsPIC30F.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d ${OBJECTDIR}/_ext/1025206115/CO_driver.o.d ${OBJECTDIR}/_ext/981374158/CO_trace.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/main_dsPIC30F.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/1025206115/CO_driver.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/main_dsPIC30F.o

# Source Files
SOURCEFILES=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../dsPIC30F/CO_driver.c ../CANopenNode/extra/CO_trace.c ../CANopenNode/example/CO_OD.c ../CANopenNode/CANopen.c main_dsPIC30F.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6015
MP_LINKER_FILE_OPTION=,--script=p30F6015.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/fbfd4d96e1672c31175536c76428c74190d97a33.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_Emergency.c  -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/efd485ae0fb2234a3c162ea68d5011291e38bfcb.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/b9ec69624fcacee93b2b839e5d9f62e09e90955b.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/22e2e4ec5703d3091f74aef5cd3d2267c47106f.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_PDO.c  -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/fe188a8da4b0fb5184617210f4de4b9a101c59d6.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOclient.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/e01977b7b137a4f0ad9a0130e33ccb85742f69bd.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOserver.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/c12bcbee6421b1483a598e75804d142368aca139.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SYNC.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/306454168a77e2087e7293e02422d6a2d840ae4c.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_TIME.c  -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/6ff2ed07772146b349f7570516287db3a068aeb0.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/398c9aced50d85434778a79deaa894e4351283f5.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_fifo.c  -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/caf86299c784d9bd00782892d20c9bcb2f178188.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/303/CO_LEDs.c  -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/171814298f31d2e1eee6399acdca1b656f02c7b8.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSmaster.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/e9d78edd0c41c2723a0eb2779e86eb682ebb1c01.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSslave.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1025206115/CO_driver.o: ../dsPIC30F/CO_driver.c  .generated_files/b6d2c2f2329b4038eb96ddd8a14536740c31639b.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1025206115" 
	@${RM} ${OBJECTDIR}/_ext/1025206115/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1025206115/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../dsPIC30F/CO_driver.c  -o ${OBJECTDIR}/_ext/1025206115/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1025206115/CO_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/336b4273f1d29d85391a16f68c6d245e5267c1e3.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/extra/CO_trace.c  -o ${OBJECTDIR}/_ext/981374158/CO_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/4ce6a3ec625bb8a9f86455672d0c061e4f01cb36.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/53a631631000d115e66ad904f5392819f8340008.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_dsPIC30F.o: main_dsPIC30F.c  .generated_files/fa854d50ef518ea92e09c3eaca7e07e5ea190903.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_dsPIC30F.o.d 
	@${RM} ${OBJECTDIR}/main_dsPIC30F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_dsPIC30F.c  -o ${OBJECTDIR}/main_dsPIC30F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_dsPIC30F.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/51fc7e3f39f9d921e3dc128b915307c2a3e0a9d6.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_Emergency.c  -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/5b8285b86d71456f4a773d65360a3d4c59703b67.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/60a463cd198523da76e32dff384acf21fae94781.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/3c5dc7a3f7aa051c99ac47af15a0eebd7635e35d.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_PDO.c  -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/dc72bc1d418dd1c0823ec069e0ba04e86566a766.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOclient.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/6eaa85f4cd94d6d7ea6779eb017215c528df17d6.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOserver.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/3a07d8401036449440a4b866d4dfc9400ceb0415.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SYNC.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/bdb0ac4a6c1ae09d8d016320301c33a3704db7d7.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_TIME.c  -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/851cfa10adba5c49946a8e6003fc01f46752de82.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/ce835bb6c00168767d32af4900ca58c88b0cf35c.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_fifo.c  -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/4d18806d3fa13909257ef92ebcf457630b7082e.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/303/CO_LEDs.c  -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/945532fc2dcebf1fd00773cdf302a34c3ac561b6.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSmaster.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/86586b73f141e17205e57d7ee352c4669453c339.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSslave.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1025206115/CO_driver.o: ../dsPIC30F/CO_driver.c  .generated_files/b3e9360ee19135dcc2479416b15342fd63883654.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1025206115" 
	@${RM} ${OBJECTDIR}/_ext/1025206115/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1025206115/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../dsPIC30F/CO_driver.c  -o ${OBJECTDIR}/_ext/1025206115/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1025206115/CO_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/98ebe38e2b05020d4292bd9a7ae19d1b6a3f0f3.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/extra/CO_trace.c  -o ${OBJECTDIR}/_ext/981374158/CO_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/7e2ed5490b58084d46a51d8bca009e385bf358b8.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/d2b2cb9b3aea733836ee63df708bb5cbae32ffda.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_dsPIC30F.o: main_dsPIC30F.c  .generated_files/7574a65cf0f03d288b2851cd9fa3917dbaffe5ed.flag .generated_files/298a5f2c065b173b649d10d5eefb106f8f1a1926.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_dsPIC30F.o.d 
	@${RM} ${OBJECTDIR}/main_dsPIC30F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_dsPIC30F.c  -o ${OBJECTDIR}/main_dsPIC30F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_dsPIC30F.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -msmall-code -msmall-data -O1 -I"../dsPIC30F" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99     -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--heap=0,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=0,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC30F.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
