/// @desc HTTP Receiver

_reqid = ds_map_find_value(async_load, "id");

for (i = 0; i < ds_list_size(gj_requests); i++) {
	if (ds_list_find_value(gj_requests, i) == _reqid) {
	_result = "";
	
	ds_list_delete(gj_requests, _reqid);
	
	if (ds_map_find_value(async_load, "status") < 0) {
		gj_online = false;
		gj_session_connected = false;
		_sessionrequestid = -1;
		_result = "HTTP Status error: " + string(ds_map_find_value(async_load, "http_status"));
		ds_map_add(global.gj_requestdata, _reqid, _result);
	} else {
		gj_online = true;
		var _result_nonparsed = json_decode(ds_map_find_value(async_load, "result"));
		_result = json_encode(ds_map_find_value(_result_nonparsed, "response"));
		ds_map_add(global.gj_requestdata, _reqid, _result);
	}
	
	
	
	
	
	
}}
