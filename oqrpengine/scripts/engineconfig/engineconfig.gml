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
			version: 220119
			
		},
		
		gj : { // GameJolt API Settings
		
			active: false,
			gameid: "",
			key: ""
			
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
