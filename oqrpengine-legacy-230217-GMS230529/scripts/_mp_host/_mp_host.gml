function _mp_host(conarg){
	if (conarg[0] == 0) {show_console_message("No port specified."); return;}
	show_console_message("Attempting to host...");
	global.mp_tgport = conarg[0];
	instance_create_depth(0, 0, 0, mp_server);
	return "Hosted sucessfully!";
}