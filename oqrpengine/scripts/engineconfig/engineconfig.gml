/// OQRP Engine Config

function oqrp_configmap() {
	
	// Game Settings
	global.oqrp_game_name = "OQRP Engine Project"
	global.oqrp_game_author = "OmniQube"
	
	// Versioning Settings
	global.oqrp_game_version = "0"
	global.oqrp_game_build = 0
	global.oqrp_engine_oqupdater_url = ""
	global.oqrp_engine_oqupdater_downloadurl = ""
	
	// Engine (DO NOT CHANGE)
	global.oqrp_engine_id = "OQRP Engine"
	global.oqrp_engine_dev = "OmniQube"
	global.oqrp_engine_version = 210913
	
	// Directories
	global.oqrp_directory = "oqrp\\"
	global.oqrp_errorlog_directory = "error-logs\\"
	global.oqrp_save_directory = "saves\\"
	global.oqrp_mods_directory = "oqrp\\mods\\"
	global.oqrp_screenshot_directory = "screenshots\\"
	
}

function fulldir(dir) {return working_directory + "\\" + dir}