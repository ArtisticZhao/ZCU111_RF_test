# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Neg_Level" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Pos_Level" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sps" -parent ${Page_0}


}

proc update_PARAM_VALUE.Neg_Level { PARAM_VALUE.Neg_Level } {
	# Procedure called to update Neg_Level when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Neg_Level { PARAM_VALUE.Neg_Level } {
	# Procedure called to validate Neg_Level
	return true
}

proc update_PARAM_VALUE.Pos_Level { PARAM_VALUE.Pos_Level } {
	# Procedure called to update Pos_Level when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Pos_Level { PARAM_VALUE.Pos_Level } {
	# Procedure called to validate Pos_Level
	return true
}

proc update_PARAM_VALUE.sps { PARAM_VALUE.sps } {
	# Procedure called to update sps when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sps { PARAM_VALUE.sps } {
	# Procedure called to validate sps
	return true
}


proc update_MODELPARAM_VALUE.sps { MODELPARAM_VALUE.sps PARAM_VALUE.sps } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sps}] ${MODELPARAM_VALUE.sps}
}

proc update_MODELPARAM_VALUE.Pos_Level { MODELPARAM_VALUE.Pos_Level PARAM_VALUE.Pos_Level } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Pos_Level}] ${MODELPARAM_VALUE.Pos_Level}
}

proc update_MODELPARAM_VALUE.Neg_Level { MODELPARAM_VALUE.Neg_Level PARAM_VALUE.Neg_Level } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Neg_Level}] ${MODELPARAM_VALUE.Neg_Level}
}

