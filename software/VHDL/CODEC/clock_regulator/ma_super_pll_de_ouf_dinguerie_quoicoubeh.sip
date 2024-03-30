set_global_assignment -entity "ma_super_pll_de_ouf_dinguerie_quoicoubeh" -library "lib_ma_super_pll_de_ouf_dinguerie_quoicoubeh" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "ma_super_pll_de_ouf_dinguerie_quoicoubeh" -library "lib_ma_super_pll_de_ouf_dinguerie_quoicoubeh" -name IP_TOOL_VERSION "23.1"
set_global_assignment -entity "ma_super_pll_de_ouf_dinguerie_quoicoubeh" -library "lib_ma_super_pll_de_ouf_dinguerie_quoicoubeh" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_ma_super_pll_de_ouf_dinguerie_quoicoubeh" -name SPD_FILE [file join $::quartus(sip_path) "ma_super_pll_de_ouf_dinguerie_quoicoubeh.spd"]

set_global_assignment -library "lib_ma_super_pll_de_ouf_dinguerie_quoicoubeh" -name MISC_FILE [file join $::quartus(sip_path) "ma_super_pll_de_ouf_dinguerie_quoicoubeh_sim/ma_super_pll_de_ouf_dinguerie_quoicoubeh.vho"]
