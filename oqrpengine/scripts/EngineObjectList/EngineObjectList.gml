/// List of all engine execution-critical objects, i.e. drivers, handlers and managers

function EngineObjectList(){
	
	global.EngineObjects = [
	
	// System
	oqrp, oqui, err, oqautoupdater,
	
	// Drivers
	d_gj_api_old, d_display_api, d_gamepad_api, d_network_api, d_sound_api
	
	];
	
}