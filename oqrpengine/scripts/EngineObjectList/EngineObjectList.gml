/// List of all engine execution-critical objects, i.e. drivers, handlers and managers

function EngineObjectList(){
	
	global.EngineObjects = [
	
	oqrp, oqui, err, oqautoupdater,
	
	d_gj_api, d_display_api, d_gamepad_api, d_network_api, d_sound_api
	
	];
	
}