/// OQRP Engine Config

function oqrp_configmap() {
	global.oqrp = {
		
		// Game Settings
		game : {
			
			name: "OQRP Engine Project",
			author: "OmniQube",
			version: 0,
			build: 0,
			oqupdater: {url: "", downloadurl: ""}
			
		},
		
		engine : {
			
			name: "OQRP Engine",
			dev: "OmniQube",
			version: 210915
			
		},
		
		gj : { // GameJolt API Settings
		
			active: true,
			gameid: "647955",
			key: "bda243824af22578e13f3338c61f7b21"
			
		},
		
		dir : {
			
			engine: "oqrp\\",
			errorlog: "error-logs\\",
			save: "saves\\",
			mods: "mods\\",
			screenshot: "screenshots\\"
			
		}
		
		
	}
}



function fulldir(dir) {return working_directory + "\\" + dir}
