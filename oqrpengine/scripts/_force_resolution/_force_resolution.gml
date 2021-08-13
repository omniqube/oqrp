function _force_resultion(consoleArgs) {
	
	if (argCheck(consoleArgs, 2, 2)) {
		
	w = string_digits(consoleArgs[0]);
	h = string_digits(consoleArgs[1]);
	
	show_debug_message("Forcing resolution of " + string(w) + "x" + string(h));
	
	window_set_size(w, h)
	returnstring = "Forcing resolution of " + string(w) + "x" + string(h);
	return returnstring;
	
	
} else return "Invalid Arguments." }
