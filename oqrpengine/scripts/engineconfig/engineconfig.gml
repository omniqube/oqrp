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
			version: 230216,
			fbsc: os_get_info(),
			branch: "MP"
			
		},
		
		gj : { // GameJolt API Settings
		
			active: false,
			gameid: "",
			key: ""
			
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
