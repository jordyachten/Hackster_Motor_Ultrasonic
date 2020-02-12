#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf

#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = D:/Projects/Hackster_motor_ultrasonic/workspace/Block_Design_wrapper/export/Block_Design_wrapper/Block_Design_wrapper.xpfm
SYS_CONFIG = Block_Design_wrapper
DOMAINS = standalone_domain
BIF_PATH = D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic_system/Debug/system.bif

BITSTREAM_PATH = D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic/_ide/bitstream/Block_Design_wrapper.bit
SD_FILES = --elf D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic/Debug/hackster_motor_ultrasonic.elf,ps7_cortexa9_0

#
# primary build targets
#

all: sd_card

sd_card:
	-@echo Generating bif file for the system project
	generate_system_bif.bat 53327 ${XPFM_PATH} ${DOMAINS} ${BIF_PATH}
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} sd_card
	${RM} system.bif

.PHONY: all sd_card clean


