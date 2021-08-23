// Keyboard and Controller Binding

function loadbinds() {
	
	defaultbinds()
	
	global.lockedGameInput = false;
	
	return true;
}

function defaultbinds() {
	// Array position for keyboard = 0; gamepad = 1; single-sesion binds = 2+;
	
	global.binds = ds_map_create()
		
		b_move_up = ds_list_create(); ds_list_add(b_move_up, vk_up, gp_padu); ds_map_add_list(global.binds, "move_up", b_move_up);
		b_move_down = ds_list_create(); ds_list_add(b_move_down, vk_down, gp_padd); ds_map_add_list(global.binds, "move_down", b_move_down);
		b_move_right = ds_list_create(); ds_list_add(b_move_right, vk_right, gp_padr); ds_map_add_list(global.binds, "move_right", b_move_right);
		b_move_left = ds_list_create(); ds_list_add(b_move_left, vk_left, gp_padl); ds_map_add_list(global.binds, "move_left", b_move_left);
		
		b_ui_confirm = ds_list_create(); ds_list_add(b_ui_confirm, vk_enter, gp_face1); ds_map_add_list(global.binds, "ui_confirm", b_ui_confirm);
		b_ui_cancel = ds_list_create(); ds_list_add(b_ui_cancel, ord("X"), gp_face2); ds_map_add_list(global.binds, "ui_cancel", b_ui_cancel);
		b_ui_menu = ds_list_create(); ds_list_add(b_ui_menu, ord("C"), gp_select); ds_map_add_list(global.binds, "ui_menu", b_ui_menu);
		
		b_fullscreen = ds_list_create(); ds_list_add(b_fullscreen, vk_f4); ds_map_add_list(global.binds, "fullscreen", b_fullscreen);
		b_console = ds_list_create(); ds_list_add(b_console, vk_pause); ds_map_add_list(global.binds, "console", b_console);
		b_pause = ds_list_create(); ds_list_add(b_pause, vk_escape, gp_start); ds_map_add_list(global.binds, "pause", b_pause);
		b_screenshot = ds_list_create(); ds_list_add(b_screenshot, vk_f2); ds_map_add_list(global.binds, "screenshot", b_screenshot);
		
	ds_map_secure_save(global.binds, "binds")
		// show_debug_message(ds_list_find_value(ds_map_find_value(binds, "ui_cancel"), 0));
		
}

function input(action_id) {
	
	if (string_contains(action_id, "move") && !global.lockedGameInput) {
		
		for (i = 0; i <= ds_list_size(ds_map_find_value(global.binds, action_id)); i++) {
		if (
		
		keyboard_check(ds_list_find_value(ds_map_find_value(global.binds, action_id), i)) 
		|| 
		controller_check(ds_list_find_value(ds_map_find_value(global.binds, action_id), 1))
		||
		gpaxistest(action_id)
		
		) 
		
		{return true;} else {return false;}}
	
	} else if ((string_contains(action_id, "ui") || action_id == "pause") && !global.lockedGameInput) {
		
		for (i = 0; i <= ds_list_size(ds_map_find_value(global.binds, action_id)); i++) {
		if (
		
		keyboard_check_pressed(ds_list_find_value(ds_map_find_value(global.binds, action_id), i)) 
		|| 
		controller_check_pressed(ds_list_find_value(ds_map_find_value(global.binds, action_id), 1))
		
		) 
		
		{return true;} else {return false;}}
		
		
	} else if (!string_contains(action_id, "ui") && !string_contains(action_id, "move")) {
		
		for (i = 0; i <= ds_list_size(ds_map_find_value(global.binds, action_id)); i++) {
		if (keyboard_check_pressed(ds_list_find_value(ds_map_find_value(global.binds, action_id), i))) 
		{return true;} else {return false;}}
		
	}
	
	
}

function input_forcepressed(action_id) {
	
	if (string_contains(action_id, "move") && !global.lockedGameInput) {
		
		for (i = 0; i <= ds_list_size(ds_map_find_value(global.binds, action_id)); i++) {
		if (
		
		keyboard_check_pressed(ds_list_find_value(ds_map_find_value(global.binds, action_id), i)) 
		|| 
		controller_check_pressed(ds_list_find_value(ds_map_find_value(global.binds, action_id), 1))
		||
		gpaxistest(action_id)
		
		) 
		
		{return true;} else {return false;}}
	
	} else {return false;}
}


function getbind(action, iscontroller) {
	if (!iscontroller) {return ds_list_find_value(ds_map_find_value(binds, "ui_cancel"), 0)}
	else {return ds_list_find_value(ds_map_find_value(binds, "ui_cancel"), 1)}
}

function keydictionary(key) {
	
	switch key {
		// Alphabet Keys
		case ord("A"): return "A"; break;
		case ord("B"): return "B"; break;
		case ord("C"): return "C"; break;
		case ord("D"): return "D"; break;
		case ord("E"): return "E"; break;
		case ord("F"): return "F"; break;
		case ord("G"): return "G"; break;
		case ord("H"): return "H"; break;
		case ord("I"): return "I"; break;
		case ord("J"): return "J"; break;
		case ord("K"): return "K"; break;
		case ord("L"): return "L"; break;
		case ord("M"): return "M"; break;
		case ord("N"): return "N"; break;
		case ord("O"): return "O"; break;
		case ord("P"): return "P"; break;
		case ord("Q"): return "Q"; break;
		case ord("R"): return "R"; break;
		case ord("S"): return "S"; break;
		case ord("T"): return "T"; break;
		case ord("U"): return "U"; break;
		case ord("V"): return "V"; break;
		case ord("W"): return "W"; break;
		case ord("X"): return "X"; break;
		case ord("Y"): return "Y"; break;
		case ord("Z"): return "Z"; break;
	
		// Number Keys
		case ord("0"): return "0"; break;
		case ord("1"): return "1"; break;
		case ord("2"): return "2"; break;
		case ord("3"): return "3"; break;
		case ord("4"): return "4"; break;
		case ord("5"): return "5"; break;
		case ord("6"): return "6"; break;
		case ord("7"): return "7"; break;
		case ord("8"): return "8"; break;
		case ord("9"): return "9"; break;
	
		// Arrow Keys
		case vk_left: return "Left Arrow"; break;
		case vk_right: return "Right Arrow"; break;
		case vk_up: return "Up Arrow"; break;
		case vk_down: return "Down Arrow"; break;
		
		// Interaction Keys
		case vk_space: return "Space"; break;
		case vk_alt: return "Alt"; break;
		case vk_backspace: return "Backspace"; break;
		case vk_tab: return "Tab"; break;
		
		// Misc Keys
		case vk_insert: return "Insert"; break;
		case vk_delete: return "Delete"; break;
		case vk_home: return "Home"; break;
		case vk_end: return "End"; break;
		case vk_pageup: return "Page Up"; break;
		case vk_pagedown: return "Page Down"; break;
		
		// Numpad Keys
		case vk_numpad0: return "Numpad 0"; break;
		case vk_numpad1: return "Numpad 1"; break;
		case vk_numpad2: return "Numpad 2"; break;
		case vk_numpad3: return "Numpad 3"; break;
		case vk_numpad4: return "Numpad 4"; break;
		case vk_numpad5: return "Numpad 5"; break;
		case vk_numpad6: return "Numpad 6"; break;
		case vk_numpad7: return "Numpad 7"; break;
		case vk_numpad8: return "Numpad 8"; break;
		case vk_numpad9: return "Numpad 9"; break;
		
		default: return "N/A";
	}
}

function lockGameInput() {global.lockedGameInput = true;} function unlockGameInput() {global.lockedGameInput = false;}