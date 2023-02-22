function LoadScript(lang) {
	
	global.gametext = ds_map_create();
	
	switch lang {
		case "EN": DATA_EN(); break;
		default: break;
	}
	
}

function LanguageDictionary(lang) {
	
	switch lang {
		case "EN": return "English"; break;
		case "DE": return "Deutsch"; break;
		case "SK": return "Slovensky"; break;
		case "CZ": return "Cesky"; break;
		case "FR": return "Francois"; break;
		case "ES": return "Espanol"; break;
		case "RU": return "Ruski"; break;
		case "PL": return "Polski"; break;
		default: return lang; break;
	}
	
}

function s(key) {return ds_map_find_value(global.gametext, key)}
function scr(key, val) {ds_map_add(global.gametext, key, val)}

function DATA_EN() {
	
	global.gametext = import_json(global.oqrp.dir.lang + "en.json");
		
}
