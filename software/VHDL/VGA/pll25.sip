set_global_assignment -entity "pll25" -library "lib_pll25" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll25" -library "lib_pll25" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "pll25" -library "lib_pll25" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll25" -name SPD_FILE [file join $::quartus(sip_path) "pll25.spd"]

set_global_assignment -library "lib_pll25" -name MISC_FILE [file join $::quartus(sip_path) "pll25_sim/pll25.vho"]
