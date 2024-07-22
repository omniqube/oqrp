// OQRP Engine Modloader

function modScan() {/*   BLOCK DISABLED FOR NOW
	modmap = ds_list_create();
	file = file_find_first(global.oqrp.dir.mods + "*", fa_directory);
	while (file != "") {
    ds_list_add(modmap, file);
    file = file_find_next();
}
show_debug_message("MODMAP " + string(modmap))
	modinimap = ds_list_create();
	for (i=0; i<ds_list_size(modmap); i++) {
		tempini = ds_list_find_value(modmap, i) + "\mod.ini";
		ds_list_add(modinimap, tempini);
	}
	modLoad(modinimap);
*/}

function modLoad(modinimap) {
	global.mods = ds_map_create();
	for (i=0; i<ds_list_size(modinimap); i++) {
		_tempmodmap = ds_map_create();
		ini_open(ds_list_find_value(modinimap, i));
		// ModID
		ds_map_add(_tempmodmap, "ModName", ini_read_string("ModID", "ModName", "N/A"));
		ds_map_add(_tempmodmap, "ModVersion", ini_read_real("ModID", "ModVersion", 0));
		ds_map_add(_tempmodmap, "ModDesc", ini_read_string("ModID", "ModDesc", "N/A"));
		// OQRP
		ds_map_add(_tempmodmap, "TargetBuild", ini_read_real("OQRP", "TargetBuild", global.oqrp.engine.version));
		ds_map_add(_tempmodmap, "CheckForUpdates", string_to_bool(ini_read_string("OQRP", "CheckForUpdates", false)));
		ds_map_add(_tempmodmap, "UpdateURL", ini_read_string("OQRP", "UpdateURL", ""));
		// Data
		
		_data = ds_map_create();
		while (ini_key_exists("Data", "file" + string(ds_map_size(_data)))) {ds_map_add(_data, ds_map_size(_data), 0)}
		show_debug_message("DATA: " + string(_data))
		for (a=0; a<=_files; a++) {
			
			
		}
		
		
		
		
		
		ds_map_add_map(global.mods, ds_list_find_value(modinimap, i), _tempmodmap)
		// ds_map_destroy(_tempmodmap)
	}
	
}

// Still unfinished after 4 months :(

// Update: it's been 16 months :(((
// Update 2: 50 month milestone since this feature was first implemented!