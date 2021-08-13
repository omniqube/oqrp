// OQRP Engine Gamesave System

function initSave() {
if (saveExists()) {global.saveExists = true;} else {global.saveExists = false;}
global.save = ds_map_create();
}

function saveExists() {if (file_exists("save.oqrpsav")) {return true;} else {return false;}}

function valueSave(name, value) {ds_map_replace(global.save, string(name), value);}
function valueLoad(name) {return ds_map_find_value(global.save, name);}

function Savegame() {
	SignSave();
	if (saveExists) {file_delete("save.oqrpsav")}
	ds_map_secure_save(global.save, "save.oqrpsav");
}

function Loadgame() {
	if (!SaveCorruptionCheck()) {show_message("Error: Save file is corrupted.\nGame will now restart."); file_delete("save.oqrpsav"); game_restart();}
	global.save = ds_map_secure_load("save.oqrpsav");
	
}

function SaveCorruptionCheck() {
	_svcheck = ds_map_secure_load("save.oqrpsav");
	if (is_undefined(ds_map_find_value(_svcheck, "oqrp_tamperid"))) {return false;} else {return true;}
}

function SignSave() {
	
}