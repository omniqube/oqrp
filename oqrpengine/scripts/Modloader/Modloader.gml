// OQRP Engine Modloader

function modScan() {
	modmap = ds_list_create();
	file = file_find_first(global.oqrp_mods_directory + "*", fa_directory);
	while (file != "") {
    ds_list_add(modmap, file);
    file = file_find_next();
}
	for (i=0; i<ds_list_size(modmap); i++) {
		ini_open(ds_list_find_value(modmap, i) + "\mod.ini");
		// Mod loading goes here
		ini_close();
	}
}