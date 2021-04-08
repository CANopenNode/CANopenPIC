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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../PIC24_dsPIC33/CO_driver.c ../CANopenNode/extra/CO_trace.c ../CANopenNode/example/CO_OD.c ../CANopenNode/CANopen.c main_dsPIC33F.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/1420542983/CO_driver.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/main_dsPIC33F.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d ${OBJECTDIR}/_ext/1420542983/CO_driver.o.d ${OBJECTDIR}/_ext/981374158/CO_trace.o.d ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d ${OBJECTDIR}/_ext/398055091/CANopen.o.d ${OBJECTDIR}/main_dsPIC33F.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1688412750/CO_Emergency.o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o ${OBJECTDIR}/_ext/1420542983/CO_driver.o ${OBJECTDIR}/_ext/981374158/CO_trace.o ${OBJECTDIR}/_ext/1809917272/CO_OD.o ${OBJECTDIR}/_ext/398055091/CANopen.o ${OBJECTDIR}/main_dsPIC33F.o

# Source Files
SOURCEFILES=../CANopenNode/301/CO_Emergency.c ../CANopenNode/301/CO_HBconsumer.c ../CANopenNode/301/CO_NMT_Heartbeat.c ../CANopenNode/301/CO_PDO.c ../CANopenNode/301/CO_SDOserver.c ../CANopenNode/301/CO_SYNC.c ../CANopenNode/301/CO_TIME.c ../CANopenNode/301/crc16-ccitt.c ../CANopenNode/301/CO_SDOclient.c ../CANopenNode/301/CO_fifo.c ../CANopenNode/303/CO_LEDs.c ../CANopenNode/305/CO_LSSmaster.c ../CANopenNode/305/CO_LSSslave.c ../PIC24_dsPIC33/CO_driver.c ../CANopenNode/extra/CO_trace.c ../CANopenNode/example/CO_OD.c ../CANopenNode/CANopen.c main_dsPIC33F.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ256GP710
MP_LINKER_FILE_OPTION=,--script=p33FJ256GP710.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/a3c97a250f6cc1bba465f222857c23e928050b0d.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_Emergency.c  -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/11d28c432ad6c556dc84ed86f1d97f473565c60b.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/bf2622f8db20ec49dd7b4f428cbdcbff657cb15a.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/9325b886e1fd23bb072011ab2f689822f7108c59.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_PDO.c  -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/d1597350eabc2a46602743d41869ab45ba03f193.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOserver.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/86268b7e7932f2109ad46026bd56e98875de324a.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SYNC.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/bad5aecf0ac58dfa0901ef46d8e79f1fbb6e31df.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_TIME.c  -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/be94568d11fef3b3cf408ff705a558a790519fc2.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/52a9c63cb7d032ce57771db57e5dd42db08bc2d3.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOclient.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/4d280c338ace71acc09bcb65a5f0873c4ee68747.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_fifo.c  -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/e7830d09710def3d828be346fe2d7d5f91bcfa2c.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/303/CO_LEDs.c  -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/4bc2e52d0eddd21aa8054c364dfa61429976873a.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSmaster.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/71f402754752d193767c48bbde01304dd15deba7.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSslave.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1420542983/CO_driver.o: ../PIC24_dsPIC33/CO_driver.c  .generated_files/a65a9ba05a4290056aad8262bd4613680ba99a21.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1420542983" 
	@${RM} ${OBJECTDIR}/_ext/1420542983/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420542983/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../PIC24_dsPIC33/CO_driver.c  -o ${OBJECTDIR}/_ext/1420542983/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1420542983/CO_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/282e4f451648dbbfc3e77a571cd9f1dede5ec376.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/extra/CO_trace.c  -o ${OBJECTDIR}/_ext/981374158/CO_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/b101be00f13401c41ee0a364ec1bf081535c6bd0.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/186fd19f8e0fdea899ba18b735188d2c99f36858.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_dsPIC33F.o: main_dsPIC33F.c  .generated_files/3719de34b7ffa572e0e3d22accd7da61bf46cf22.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_dsPIC33F.o.d 
	@${RM} ${OBJECTDIR}/main_dsPIC33F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_dsPIC33F.c  -o ${OBJECTDIR}/main_dsPIC33F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_dsPIC33F.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1688412750/CO_Emergency.o: ../CANopenNode/301/CO_Emergency.c  .generated_files/65480529f757b8316be5a6feb1fde946eaaffd1c.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_Emergency.c  -o ${OBJECTDIR}/_ext/1688412750/CO_Emergency.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_Emergency.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o: ../CANopenNode/301/CO_HBconsumer.c  .generated_files/71db5f35ee5071abbcdeb900e1b8fe63b068b7c6.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_HBconsumer.c  -o ${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_HBconsumer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o: ../CANopenNode/301/CO_NMT_Heartbeat.c  .generated_files/c461e9a2884e3cf7c400095371aabd6d88d38177.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_NMT_Heartbeat.c  -o ${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_NMT_Heartbeat.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_PDO.o: ../CANopenNode/301/CO_PDO.c  .generated_files/330ebd2f2eb5aa7bfbf720a494aed0faf625039e.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_PDO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_PDO.c  -o ${OBJECTDIR}/_ext/1688412750/CO_PDO.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_PDO.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o: ../CANopenNode/301/CO_SDOserver.c  .generated_files/b70679cd7880a97d895a2997044f2844e1e31630.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOserver.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOserver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SYNC.o: ../CANopenNode/301/CO_SYNC.c  .generated_files/6a635e77af22245a9cdf562ae37d3093bd4ec471.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SYNC.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SYNC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SYNC.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_TIME.o: ../CANopenNode/301/CO_TIME.c  .generated_files/86731b7c96250e77c5fb479fd4b07ecd2d281954.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_TIME.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_TIME.c  -o ${OBJECTDIR}/_ext/1688412750/CO_TIME.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_TIME.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o: ../CANopenNode/301/crc16-ccitt.c  .generated_files/9acf4ff99b3c8546c94996aac70be9653042ff01.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/crc16-ccitt.c  -o ${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/crc16-ccitt.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o: ../CANopenNode/301/CO_SDOclient.c  .generated_files/e2a1e2663919ddcce248afcc595732ccdb2eaad2.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_SDOclient.c  -o ${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_SDOclient.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412750/CO_fifo.o: ../CANopenNode/301/CO_fifo.c  .generated_files/eb6c6668f3c34e0bf8fb34a5680bb6368e88250b.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412750" 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412750/CO_fifo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/301/CO_fifo.c  -o ${OBJECTDIR}/_ext/1688412750/CO_fifo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412750/CO_fifo.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412748/CO_LEDs.o: ../CANopenNode/303/CO_LEDs.c  .generated_files/5ec3c1615383aff83221f878aa2431cbd5a553cb.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412748" 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/303/CO_LEDs.c  -o ${OBJECTDIR}/_ext/1688412748/CO_LEDs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412748/CO_LEDs.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o: ../CANopenNode/305/CO_LSSmaster.c  .generated_files/2f237afe5c7eda7ee431df97faa8771b466b7e87.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSmaster.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSmaster.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o: ../CANopenNode/305/CO_LSSslave.c  .generated_files/4a5579cd8f1755036e3348b99e42267a2fbf46c4.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688412746" 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/305/CO_LSSslave.c  -o ${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1688412746/CO_LSSslave.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1420542983/CO_driver.o: ../PIC24_dsPIC33/CO_driver.c  .generated_files/1a40d33019224e0c0656c41b18cb5d7717c4db85.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1420542983" 
	@${RM} ${OBJECTDIR}/_ext/1420542983/CO_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420542983/CO_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../PIC24_dsPIC33/CO_driver.c  -o ${OBJECTDIR}/_ext/1420542983/CO_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1420542983/CO_driver.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/981374158/CO_trace.o: ../CANopenNode/extra/CO_trace.c  .generated_files/4ea2bd3856ae625a05019ed29ee1735e99510ecf.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/981374158" 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/981374158/CO_trace.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/extra/CO_trace.c  -o ${OBJECTDIR}/_ext/981374158/CO_trace.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/981374158/CO_trace.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1809917272/CO_OD.o: ../CANopenNode/example/CO_OD.c  .generated_files/19c82b0f5de62e633ec4d060666d8d4f3e7ec69.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1809917272" 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1809917272/CO_OD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/example/CO_OD.c  -o ${OBJECTDIR}/_ext/1809917272/CO_OD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1809917272/CO_OD.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/398055091/CANopen.o: ../CANopenNode/CANopen.c  .generated_files/dd85173fa205ef9ba676211e4e22bfb3c799fb62.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}/_ext/398055091" 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/398055091/CANopen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CANopenNode/CANopen.c  -o ${OBJECTDIR}/_ext/398055091/CANopen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/398055091/CANopen.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main_dsPIC33F.o: main_dsPIC33F.c  .generated_files/43bfff2263cd743d7cfeae5a3854c5204a17c1de.flag .generated_files/a6a450259bf7832e5e3d01ae8496fb0915dc4115.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_dsPIC33F.o.d 
	@${RM} ${OBJECTDIR}/main_dsPIC33F.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main_dsPIC33F.c  -o ${OBJECTDIR}/main_dsPIC33F.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main_dsPIC33F.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -O1 -I"../PIC24_dsPIC33" -I"../CANopenNode/example" -I"../CANopenNode" -DCO_VERSION_MAJOR=2 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--heap=5000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=5000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/example_dsPIC33_ex16_IO.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
