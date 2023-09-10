/// OQRP Engine Saving System, Second Edition, Rewritten for Build 220804
// Uses Sphinx 1.0.0 by JujuAdams. See the licenses note for more information.


#region Initialization
function sv_init() { // Save System Entry Point
	global.oqrpsum = 15171816
	fs_init();
	global.firstlaunch = detect_fl();
	sv_persistent_init();
	initCache();
	sv_slot_init();
}

function fs_init() { // File System Entry Point
	if (!directory_exists(global.oqrp.dir.errorlog)) {directory_create(global.oqrp.dir.errorlog)}
	if (!directory_exists(global.oqrp.dir.save)) {directory_create(global.oqrp.dir.save)}
	if (!directory_exists(global.oqrp.dir.screenshot)) {directory_create(global.oqrp.dir.screenshot)}
}

function detect_fl() {return !file_exists(global.oqrp.dir.save + "persistent.OQRPSAV")}
#endregion

#region Persistent Save File
function sv_persistent_init() {
	if (global.firstlaunch) {sv_persistent_build()} else {LoadgamePersistent()}
}

function sv_persistent_build() {
	global.psave = ds_map_create();
	global.psave[? "Launches"] = 1;
	global.psave[? "VKEY"] = global.oqrpsum;
	ini_open(global.oqrp.dir.save + "persistent.oqrpsav")
	psave_timeofbuild = string(current_year) + "?" + string(current_month) + "?" + string(current_day) + "?" + string(current_hour) + "?" + string(current_minute) + "?" + string(current_second)
	ini_write_real("Config", "EngineBuild", global.oqrp.engine.version)
	ini_write_real("Config", "GameVersion", global.oqrp.game.version)
	ini_write_string("Config", "GameName", global.oqrp.game.name)
	ini_write_string("Config", "TOB", psave_timeofbuild)
	ini_write_real("Data", "VK", global.oqrpsum)
	ini_write_string("Data", "Chunk", SphinxEncryptString(json_encode(global.psave), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Persistent " + psave_timeofbuild)))
	ini_close();
}

function SavegamePersistent() {
	global.psave[? "VKEY"] = oqrp.oqrpsum;
	ini_open(global.oqrp.dir.save + "persistent.oqrpsav")
	psave_timeofbuild = string(current_year) + "?" + string(current_month) + "?" + string(current_day) + "?" + string(current_hour) + "?" + string(current_minute) + "?" + string(current_second)
	ini_write_real("Config", "EngineBuild", global.oqrp.engine.version)
	ini_write_real("Config", "GameVersion", global.oqrp.game.version)
	ini_write_string("Config", "GameName", global.oqrp.game.name)
	ini_write_string("Config", "TOB", psave_timeofbuild)
	ini_write_real("Data", "VK", global.oqrpsum)
	ini_write_string("Data", "Chunk", SphinxEncryptString(json_encode(global.psave), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Persistent " + psave_timeofbuild)))
	ini_close();
}

function LoadgamePersistent() {
	global.psave = ds_map_create();
	ini_open(global.oqrp.dir.save + "persistent.oqrpsav")
	if (!sv_persistent_integcheck()) {
		ini_close(); SaveReset(true)
		customerrormessage("OQRP ENGINE EXCEPTION", "Error: Persistent file failed integrity check! The file may be corrupted, or has been tampered with.\nSave files cannot be recovered. Game will now reset to a default configuration.", "RESTART")}
		else {
		global.psave = json_decode(SphinxDecryptString(ini_read_string("Data", "Chunk", 0), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Persistent " + ini_read_string("Config", "TOB", 0))))
		global.psave[? "Launches"] += 1;
		ini_write_string("Data", "Chunk", SphinxEncryptString(json_encode(global.psave), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Persistent " + ini_read_string("Config", "TOB", 0))))
		ini_close();
		}
}

function sv_persistent_integcheck() {
	
	// Due to an error with assigning ini files to variables, this function was rewritten to not take an argument. Make sure that the persistent save file is opened before using this function.
	
	if (!ini_section_exists("Config") || !ini_section_exists("Data") ||
	!ini_key_exists("Config", "EngineBuild") || !ini_key_exists("Config", "GameVersion") || !ini_key_exists("Config", "GameName") || !ini_key_exists("Config", "TOB") ||
	!ini_key_exists("Data", "VK") || !ini_key_exists("Data", "Chunk")) {return false}
	
	if (ini_read_string("Config", "GameName", "") != global.oqrp.game.name) {return false}
	if (ini_read_real("Config", "GameVersion", -1) < global.oqrp.game.version) {return false}
	if (ini_read_real("Config", "EngineBuild", -1) < global.oqrp.engine.version) {return false}
	if (ini_read_string("Config", "TOB", "") == "") {return false}
	
	try {_previous_tob_s = sv_reconstruct_tob_as_struct(ini_read_string("Config", "TOB", ""))} catch(_e) {return false}
	if (_previous_tob_s.year < current_year) {return false}
	
	if (ini_read_real("Data", "VK", -1) != global.oqrpsum) {return false}
	
	if (ini_read_string("Data", "Chunk", "") == "") {return false}
	_ds_check = ds_map_create();
	try {_ds_check = json_decode(SphinxDecryptString(ini_read_string("Data", "Chunk", 0), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Persistent " + ini_read_string("Config", "TOB", -1))))}
	catch (_e) {return false}
	
	return true;
}

#endregion

#region Main Save System

function sv_slot_init() { // See available slots
	global.save = ds_map_create();
	global.save_special = ds_list_create();
	slotname = file_find_first(global.oqrp.dir.save + "slot*.oqrpsav", 0)
	slotno = 0;
	while (slotname != "") {
		ini_open(slotname)
		if (ini_section_exists("Info") && ini_key_exists("Info", "PreLoad")) {ds_list_add(global.save_special, ini_read_string("Info", "PreLoad", ""))}
		else {ds_list_add(global.save_special, "")}
		ini_close()
		slotname = file_find_next();
	}
	file_find_close();
}

function SaveInfo(num) {
	value = ds_list_find_value(global.save_special, num)
	if (value == "") {return ds_map_create()} else {return json_decode(value);}
}

function SaveInfo_Edit(num, key, value) {
	_ds_edit = ds_map_create();
	_ds_edit = SaveInfo(num)
	ds_map_replace(_ds_edit, key, value)
	ds_list_replace(global.save_special, num, json_encode(_ds_edit))
}

function Savegame(slot) {
	if (file_exists(global.oqrp.dir.save + "slot" + slot + ".oqrpsav")) {file_delete(global.oqrp.dir.save + "slot" + slot + ".oqrpsav")}
	ini_open(global.oqrp.dir.save + "slot" + slot + ".oqrpsav");
	save_timeofbuild = string(current_year) + "?" + string(current_month) + "?" + string(current_day) + "?" + string(current_hour) + "?" + string(current_minute) + "?" + string(current_second)
	
	ini_write_real("Config", "EngineBuild", global.oqrp.engine.version)
	ini_write_real("Config", "GameVersion", global.oqrp.game.version)
	ini_write_string("Config", "GameName", global.oqrp.game.name)
	ini_write_string("Config", "TOB", save_timeofbuild)
	
	ini_write_string("Info", "PreLoad", ds_list_find_value(global.save_special, slot))
	
	ini_write_real("Data", "VK", global.oqrpsum)
	ini_write_string("Data", "Chunk", SphinxEncryptString(json_encode(global.save), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Slot" + slot + " " + psave_timeofbuild)))
	
	ini_close();
}

function Loadgame(slot) {
	if (!file_exists(global.oqrp.dir.save + "slot" + slot + ".oqrpsav")) {
		customerrormessage("OQRP ENGINE EXCEPTION", "Error: Save File does not exist. Game will now restart.", "RESTART")
	} 
	ini_open(global.oqrp.dir.save + "slot" + slot + ".oqrpsav")
	if (!sv_slot_integrity_check(slot)) {
		customerrormessage("OQRP ENGINE EXCEPTION", "Error: Save File failed to load!\nThe file may be corrupted, or has been tampered with.", "EXIT")
	}
	
	global.save = json_decode(SphinxDecryptString(ini_read_string("Data", "Chunk", 0), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Slot" + slot + " " + ini_read_string("Config", "TOB", 0))))
	ini_close();
	
}

function sv_slot_integrity_check(slot) {
	
	if (!ini_section_exists("Config") || !ini_section_exists("Data") || !ini_section_exists("Info") ||
	!ini_key_exists("Info", "PreLoad") ||
	!ini_key_exists("Config", "EngineBuild") || !ini_key_exists("Config", "GameVersion") || !ini_key_exists("Config", "GameName") || !ini_key_exists("Config", "TOB") ||
	!ini_key_exists("Data", "VK") || !ini_key_exists("Data", "Chunk")) {return false}
	
	if (ini_read_string("Config", "GameName", "") != global.oqrp.game.name) {return false}
	if (ini_read_real("Config", "GameVersion", -1) < global.oqrp.game.version) {return false}
	if (ini_read_real("Config", "EngineBuild", -1) < global.oqrp.engine.version) {return false}
	if (ini_read_string("Config", "TOB", "") == "") {return false}
	
	try {_previous_tob_s = sv_reconstruct_tob_as_struct(ini_read_string("Config", "TOB", ""))} catch(_e) {return false}
	if (_previous_tob_s.year < current_year) {return false}
	
	if (ini_read_real("Data", "VK", -1) != global.oqrpsum) {return false}
	
	if (ini_read_string("Data", "Chunk", "") == "") {return false}
	_ds_check = ds_map_create();
	try {_ds_check = json_decode(SphinxDecryptString(ini_read_string("Data", "Chunk", 0), str2utf8_undecodable_add(global.oqrp.engine.fbsc[? "udid"] + " " + global.oqrp.game.name + " Slot" + slot + " " + ini_read_string("Config", "TOB", -1))))}
	catch (_e) {return false}
	
	return true;
	
}

#endregion

function SaveReset(full) {
	if (full) {directory_destroy(global.oqrp.dir.save); return true}
	else {
	slotname = file_find_first(global.oqrp.dir.save + "slot*.oqrpsav", 0)
	while (slotname != "") {
		file_delete(slotname);
		slotname = file_find_next();
	}
	file_find_close();
		
	}
}

function Delgame(num) {
	if (!file_exists(global.oqrp.dir.save + "slot" + num + ".oqrpsav")) {return false}
	else {
	file_delete(global.oqrp.dir.save + "slot" + num + ".oqrpsav")
	return true;
	}
}

function sv_reconstruct_tob_as_struct(value) {
	_tob_array = ds_list_create();
	_tob_array = string_parse(value, "?", true)
	_tob_struct = {
		year: real(ds_list_find_value(_tob_array, 0)),
		month: real(ds_list_find_value(_tob_array, 1)),
		day: real(ds_list_find_value(_tob_array, 2)),
		hour: real(ds_list_find_value(_tob_array, 3)),
		minute: real(ds_list_find_value(_tob_array, 4)),
		second: real(ds_list_find_value(_tob_array, 5))
	}
	return _tob_struct;
}
	
#region Cache // Variable Cache functionality
function initCache() {global.cache = ds_map_create();}
function cachePut(name, value) {ds_map_replace(global.cache, string(name), value);}
function cacheGet(name) {return ds_map_find_value(global.cache, string(name));}
#endregion

#region Save DS Manipulation
function savePut(name, value) {ds_map_replace(global.save, string(name), value);}
function saveGet(name) {return ds_map_find_value(global.save, string(name));}

function savePut_dsmap(name, value) {if (not ds_map_is_map(global.save, string(name))) {ds_map_add_map(global.save, string(name), value)} else {ds_map_replace_map(global.save, string(name), value)}}
function savePut_dslist(name, value) {if (not ds_map_is_list(global.save, string(name))) {ds_map_add_list(global.save, string(name), value)} else {ds_map_replace_list(global.save, string(name), value)}}

function psavePut(name, value) {ds_map_replace(global.psave, string(name), value);}
function psaveGet(name) {return ds_map_find_value(global.psave, string(name));}

function psavePut_dsmap(name, value) {if (not ds_map_is_map(global.psave, string(name))) {ds_map_add_map(global.psave, string(name), value)} else {ds_map_replace_map(global.psave, string(name), value)}}
function psavePut_dslist(name, value) {if (not ds_map_is_list(global.psave, string(name))) {ds_map_add_list(global.psave, string(name), value)} else {ds_map_replace_list(global.psave, string(name), value)}}
#endregion

