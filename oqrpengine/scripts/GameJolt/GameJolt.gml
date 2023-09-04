/// GameJolt API Script
// See https://gamejolt.com/game-api/doc/ for more information.

/*
						--- FUNCTION LIST AND DESRIPTIONS ---
(non-feather compatible functions are private and to be used only within the driver.)

	GENERAL:
		gj_construct_url(STRING, STRING, DS_MAP) -> URL Constructor for HTTP_GET requests.
		gj_submit

	SESSION:
	
	USER:

*/

function gj_submit(_type, _action, _data) {
		_requestid = http_get(gj_construct_url(_type, _action, _data));
		ds_list_add(gj_requests,_requestid);
		return _requestid;
}

function gj_session_ping() { 
	_sessionping = ds_map_create();
	_sessionping[? "action"] = "ping";
	//gj_send("session", undefined);
}

function gj_session_check() {
	return true;
}

function gj_ping() {
	timeid = gj_submit("time", undefined, undefined);
}

function gj_user_authenticate() {
	_request = ds_map_create();
	_request[? "action"] = "auth";
	
	
}

function gj_construct_url(_type, _action, _data) {
	
	_url = "https://api.gamejolt.com/api/game/" + gj_apiversion + "/" + _type + "/" 
	if (not is_undefined(_action)) {_url += _action + "/?";} else {_url += "?";}
	
	if (not is_undefined(_data)) {
		_parameter = ds_map_find_first(_data);
		if (not is_undefined(_parameter)) {
			_url += "&" + _parameter + "=" + str2utf8(ds_map_find_value(_data, _parameter));
			_parameter = ds_map_find_next(_data, ds_map_find_value(_data, _parameter));
			while (not is_undefined(_parameter)) {
				_url += "&" + _parameter + "=" + str2utf8(ds_map_find_value(_data, _parameter));
				_parameter = ds_map_find_next(_data, ds_map_find_value(_data, _parameter));
		}}}
	
	_url += "&game_id=" + string(global.oqrp.gj.gameid);
	_signature = md5_string_utf8(_url + global.oqrp.gj.key);
	_url += "&signature=" + _signature;
	
	if (not is_undefined(_data)) {ds_map_destroy(_data);}
	show_debug_message(_url); // DELETE BEFORE RELEASE
	return _url;
}