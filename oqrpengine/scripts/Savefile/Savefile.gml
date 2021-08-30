// OQRP Engine Gamesave System

#region Initialization
function initSave() {
global.firstlaunch = detectFL();
if global.firstlaunch {createSave(0);} else {Loadinfo();}
initCache();
}

function detectFL() {if (file_find_first(global.oqrp_save_directory + "*.oqrpsav", 0) == "") {return true} else {return false}}

function createSave(slot) {
	global.save_activeslot = slot;
	global.save = ds_map_create();
	signSave();
	Savegame();
}

#endregion

function signSave() {
	ds_map_add(global.save, "VKEY", 15171816);
	ds_map_add(global.save, "NGVER", global.oqrp_engine_version);
	ds_map_add(global.save, "GBUILD", global.oqrp_game_build);
}

function Savegame() {
	file_delete(global.oqrp_save_directory + "slot" + string(global.save_activeslot) + ".oqrpsav");
	ds_map_secure_save(global.save, global.oqrp_save_directory + "slot" + string(global.save_activeslot) + ".oqrpsav");
}

function Loadinfo() {
	global.save_existingslots = ds_list_create();
	ds_list_add(global.save_existingslots, real(string_replace(file_find_first(global.oqrp_save_directory + "*.oqrpsav", 0), "slot", "")));
	while (file_find_next() != "") {
	ds_list_add(global.save_existingslots, real(string_replace(file_find_next(), "slot", "")));
	}
}

function Loadgame(slot) {
	if (ds_list_find_index(global.save_existingslots, slot) != -1) {
	global.save_activeslot = slot;
	if !verifySave() {customerrormessage("OQRP ENGINE EXCEPTION", "Error: Save file corrupted, or has been tampered with.\nPlease delete the save file, and restart the game.", "EXIT")}
	global.save = ds_map_secure_load(global.oqrp_save_directory + "slot" + string(global.save_activeslot) + ".oqrpsav");
	} else {customerrormessage("OQRP ENGINE EXCEPTION", "Error: Game attempted to load from an unavailable save slot.", "EXIT")}
}

function verifySave() {
	_tempload = ds_map_secure_load(global.oqrp_save_directory + "slot" + string(global.save_activeslot) + ".oqrpsav");
	if (is_undefined(ds_map_find_value(_svcheck, "VKEY")) || ds_map_find_value(_svcheck, "VKEY") != 15171816) {return false;} else {return true;}
}

function varSave(name, value) {ds_map_replace(global.save, string(name), value);}
function varLoad(name) {return ds_map_find_value(global.save, string(name));}

#region Cache // Variable Cache functionality
function initCache() {global.cache = ds_map_create();}
function cacheSave(name, value) {ds_map_replace(global.cache, string(name), value);}
function cacheLoad(name) {return ds_map_find_value(global.cache, string(name));}
#endregion