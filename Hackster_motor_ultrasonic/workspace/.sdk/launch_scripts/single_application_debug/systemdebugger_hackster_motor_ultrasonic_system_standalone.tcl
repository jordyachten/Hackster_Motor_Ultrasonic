connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Avnet MiniZed V1 1234-oj1A" && level==0} -index 1
fpga -file D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic/_ide/bitstream/Block_Design_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/Projects/Hackster_motor_ultrasonic/workspace/Block_Design_wrapper/export/Block_Design_wrapper/hw/Block_Design_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/Projects/Hackster_motor_ultrasonic/workspace/hackster_motor_ultrasonic/Debug/hackster_motor_ultrasonic.elf
configparams force-mem-access 0
bpadd -addr &main
