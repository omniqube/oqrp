if (variable_instance_exists(self, gp_num)) {

for (var i = 0; i < gp_num; i++;){
	if gamepad_is_connected(i) global.oqrp_gp[i] = true else global.oqrp_gp[i] = false;}
	
	for (i = 0; i < array_length(global.oqrp_gp); i++) {


if (global.oqrp_gp[i]) {

global.oqrp_gpmain = i;
gpmain_GUID = gamepad_get_guid(i)
gpmain_desc = gamepad_get_description(i)

} else {}}

}

