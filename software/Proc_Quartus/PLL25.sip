set_global_assignment -entity "PLL25" -library "lib_PLL25" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL25" -library "lib_PLL25" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "PLL25" -library "lib_PLL25" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL25" -name SPD_FILE [file join $::quartus(sip_path) "PLL25.spd"]

set_global_assignment -library "lib_PLL25" -name MISC_FILE [file join $::quartus(sip_path) "PLL25_sim/PLL25.vho"]
