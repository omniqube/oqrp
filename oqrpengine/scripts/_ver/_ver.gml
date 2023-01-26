function _ver(){
	show_console_message(global.oqrp.engine.name + ", build " + global.oqrp.engine.branch + string(global.oqrp.engine.version));
	show_console_message("(c) 2021-" + string(current_year) + " " + global.oqrp.engine.dev);
	show_console_message("Running " + global.oqrp.game.name + ", version " + string(global.oqrp.game.version) + " build " + string(global.oqrp.game.build));
	return "By " + global.oqrp.game.author;
}