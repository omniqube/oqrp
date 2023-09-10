/// @desc HTTP Receiver

_reqid = ds_map_find_value(async_load, "id");

for (i = 0; i < ds_list_size(gj_requests); i++) {
	if (ds_list_find_value(gj_requests, i) == _reqid) {
	_result = "";
	alarm[0] = global.realtime*14;
	alarm[1] = global.realtime*15;
	if (ds_map_find_value(async_load, "status") < 0) {
		gj_online = false;
		_result = "Status error: " + string(ds_map_find_value(async_load, "http_status"));
		return;
	} else {
		gj_online = true;
		_result = "Success! " + string_wordwrap(string(ds_map_find_value(async_load, "result")), 100, "\n", true);
		
	}
	
	
	
	
	
	
}}


