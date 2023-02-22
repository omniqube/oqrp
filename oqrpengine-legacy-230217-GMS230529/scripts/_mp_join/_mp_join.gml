function _mp_join(conarg){
	if (conarg[0] == 0) {show_console_message("No target specified."); return;}
	show_console_message("Attempting to connect...");
	global.mp_tgip = conarg[0];
	global.mp_tgport = conarg[1];
	instance_create_depth(0, 0, 0, mp_client);
	return "Connected sucessfully!";
}