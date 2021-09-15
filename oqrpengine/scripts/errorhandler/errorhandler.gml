function throwerror() {undefined();}
exception_unhandled_handler( function (exception) {
	window_set_caption("OQRP ENGINE EXCEPTION");
		
		if (!global.developerMode) {
		_filename = memlog(exception); // Dump memory into error log file
		show_message("████████████████OQRP████████████████\n\nThe Game has Crashed!\nError Number: " + generateerrorid(exception) +"\n\nSee the Error Log for more details.\n(" + global.oqrp.dir.errorlog + _filename + ")\n\n███████████████████████████████████");
		} else {
			show_debug_message(string(exception));
		show_message(
		"████████████████OQRP████████████████\n\n" +
		"OQRP has encountered a fatal error and will abort code execution.\n\n" +
		"OQRP_ERROR_ID: " + generateerrorid(exception) + "\n" +
		"Message: " + exception.message + "\n" +
		"Location: " + exception.script + " at line " + string(exception.line) + "\n\n" +
		"--- GML Stack Frame ---\n" +
		"" + string(exception.stacktrace) + "\n\n" +
		//"Full Report: " + exception.longMessage + "\n\n" +
		"--- Diagnostic Info ---\n" +
		"Engine Build: " + string(global.oqrp.engine.version) + "\n" +
		"Game Build: " + string(global.oqrp.game.version) + "\n\n" +
		"See the Console for additional details.\n" + 
		"███████████████████████████████████"
		);
		}
	
});

function memlog(exception) {
	var _filename = "errorlog-" + string(current_year) + "-" + string(current_month) + "-" + string(current_day) + "--" + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second) + ".txt";
	//var _filename = "errorlog.txt"
	var _f = file_text_open_write(global.oqrp.dir.errorlog + _filename);
	file_text_write_string(_f, string(exception));
    file_text_close(_f);
	return _filename;
}

function generateerrorid(exception) {
errorid = "0";
errorid = string(asset_get_index(exception.script)) + "L" + string(exception.line)

// Known Error Dictionary
switch (errorid) {
	case "100037L1": errorid = "0 (Simulated Error)"; break;
	default: break;
}
return errorid;
}

function customerrormessage(title, text, action) {
	window_set_caption(title);
	show_message(text);
	switch action {
		case "EXIT": game_end(); return;
		case "RESTART": game_restart(); return;
		default: return;
	}
}
