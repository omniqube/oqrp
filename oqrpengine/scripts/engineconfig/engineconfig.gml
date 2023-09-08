/// OQRP Engine Config

function oqrp_configmap() {
	global.oqrp = {
		
		// Game Settings
		game : {
			name: "OQRP Engine Project",
			author: "OmniQube",
			version: 0,
			build: 0,
			oqupdater: {url: "", downloadurl: ""},
			allow_mods: false
			
		},
		
		// Engine Settings - Do not change
		engine : {
			
			name: "OQRP Engine",
			dev: "OmniQube",
			version: 230908,
			fbsc: os_get_info(),
			branch: "MP",
			allow_error_logging: false
			
		},
		
		gj : { // GameJolt API Settings
		
			active: false,
			gameid: 647955,
			key: "bda243824af22578e13f3338c61f7b21"
			
		},
		
		// Directory Settings - Do not change
		dir : {
			
			engine: "oqrp\\",
			errorlog: "error-logs\\",
			save: "saves\\",
			mods: "mods\\",
			screenshot: "screenshots\\",
			lang: "lang\\"
			
		}
		
	}
}



function fulldir(dir) {return working_directory + "\\" + dir}
