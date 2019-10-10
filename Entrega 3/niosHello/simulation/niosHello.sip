set_global_assignment -entity "niosHello" -library "lib_niosHello" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "niosHello" -library "lib_niosHello" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "niosHello" -library "lib_niosHello" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_niosHello" -name SPD_FILE [file join $::quartus(sip_path) "../niosHello.spd"]
set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "../../niosHello.qsys"]

set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "niosHello.vhd"]
set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "submodules/niosHello_onchip_memory2_0.hex"]
set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "submodules/niosHello_onchip_memory2_0.vhd"]
set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "submodules/niosHello_nios2_gen2_0.v"]
set_global_assignment -library "lib_niosHello" -name MISC_FILE [file join $::quartus(sip_path) "submodules/niosHello_jtag_uart_0.vhd"]
