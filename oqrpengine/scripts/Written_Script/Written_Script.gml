function LoadScript(lang) {
	
	global.gametext = ds_map_create();
	
	switch lang {
		case "EN": DATA_EN(); break;
		default: break;
	}
	
}

function LanguageDictionary(lang) {
	
	switch lang {
		case "EN": return "English"; break;
		case "DE": return "Deutsch"; break;
		case "SK": return "Slovensky"; break;
		case "CZ": return "Cesky"; break;
		case "FR": return "Francois"; break;
		case "ES": return "Espanol"; break;
		case "RU": return "Ruski"; break;
		case "PL": return "Polski"; break;
		case "HU": return "Magyar"; break;
		default: return ""; break;
	}
	
}

function scr_seek(key) {return ds_map_find_value(global.gametext, key)}

function scr(key, val) {ds_map_add(global.gametext, key, val)}

function DATA_EN() {
	
	// Main Menu Section
		// Main Menu
		scr("mainmenu[start]", "Start Game");
		scr("mainmenu[set]", "Settings");
		scr("mainmenu[extras]", "Extras");
		scr("mainmenu[exit]", "Exit");
			scr("mainmenu_settings[title]", "Settings");
			scr("mainmenu_settings[title_sound]", "Sound Settings");
				scr("mainmenu_settings[sound_master]", "Master Volume");
				scr("mainmenu_settings[sound_music]", "Music Volume");
				scr("mainmenu_settings[sound_sfx]", "SFX Volume");
			scr("mainmenu_settings[title_controls]", "Controls");
			scr("mainmenu_settings[title_graphics]", "Graphical Settings");
				scr("mainmenu_settings[graphics_fullscreen]", "Fullscreen");
				scr("mainmenu_settings[graphics_windowsize]", "Window Size");
			scr("mainmenu_settings[title_language]", "Language");
				scr("mainmenu_settings_controls[title_keyboard]", "Keyboard Binds");
					scr("mainmenu_settings_controls_keyboard[move_up]", "Move up");
					scr("mainmenu_settings_controls_keyboard[move_down]", "Move down");
					scr("mainmenu_settings_controls_keyboard[move_right]", "Move right");
					scr("mainmenu_settings_controls_keyboard[move_left]", "Move left");
					scr("mainmenu_settings_controls_keyboard[ui_confirm]", "Confirm");
					scr("mainmenu_settings_controls_keyboard[ui_cancel]", "Cancel");
					scr("mainmenu_settings_controls_keyboard[ui_menu]", "Menu");
					scr("mainmenu_settings_controls_keyboard[fullscreen]", "Fullscreen");
					scr("mainmenu_settings_controls_keyboard[pause]", "Pause");
					scr("mainmenu_settings_controls_keyboard[screenshot]", "Screenshot");
						scr("mainmenu_settings_controls_keyboard_keys[up_arrow]", "Up Arrow");
						scr("mainmenu_settings_controls_keyboard_keys[down_arrow]", "Down Arrow");
						scr("mainmenu_settings_controls_keyboard_keys[right_arrow]", "Right Arrow");
						scr("mainmenu_settings_controls_keyboard_keys[left_arrow]", "Left Arrow");
						scr("mainmenu_settings_controls_keyboard_keys[numpad]", "Numpad");
						scr("mainmenu_settings_controls_keyboard_keys[space]", "Space");
						scr("mainmenu_settings_controls_keyboard_keys[alt]", "Alt");
						scr("mainmenu_settings_controls_keyboard_keys[backspace]", "Backspace");
						scr("mainmenu_settings_controls_keyboard_keys[tab]", "Tab");
						scr("mainmenu_settings_controls_keyboard_keys[insert]", "Insert");
						scr("mainmenu_settings_controls_keyboard_keys[delete]", "Delete");
						scr("mainmenu_settings_controls_keyboard_keys[home]", "Home");
						scr("mainmenu_settings_controls_keyboard_keys[end]", "End");
						scr("mainmenu_settings_controls_keyboard_keys[pageup]", "Page Up");
						scr("mainmenu_settings_controls_keyboard_keys[pagedown]", "Page Down");
				scr("mainmenu_settings_controls[title_controller]", "Controller Settings");
				
				scr("mainmenu_settings_controls[applybinds]", "Apply Binds");
				scr("mainmenu_settings_controls[resetbinds]", "Reset to Default");
				scr("mainmenu_settings_controls[title_controller]", "Controller Setup");
		
		
}