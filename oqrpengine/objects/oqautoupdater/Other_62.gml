var result, evid
evid = ds_map_find_value(async_load, "id")

// Download the version file
	switch (evid) {
		
		case async_ini:
		result = ds_map_find_value(async_load, "result")
		file = file_text_open_write("oqau_verdwn.ini")
		file_text_write_string(file, result)
		file_text_close(file)
		break;
		default: return;
		
	}
	
// Evaluate the version file
ini_open("oqau_verdwn.ini")
str = ini_read_string("Version", "Build", "")
ini_close()

if (str >= global.oqrp.game.build) {
	if show_question_async("An Update is available! Do you want to go to the download page?") {
		url_open(global.oqrp_engine_oqupdater_downloadurl)
		instance_destroy()
	} else {instance_destroy()}
	
}