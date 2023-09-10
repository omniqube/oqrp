/// GameJolt API Script (d_gj_api)
// See https://gamejolt.com/game-api/doc/ for more information.

/*
(non-feather compatible functions are private and to be used only within the driver.)
*/

function gj_request_to_map(_requestid) {
	return json_decode(ds_map_find_value(global.gj_requestdata, _requestid));
}

function gj_requestprocessed(_requestid) {
	for (i = 0; i < ds_list_size(d_gj_api.gj_requests); i++) {
		if (ds_list_find_value(d_gj_api.gj_requests, i) == _requestid) {return false;}
	}
	return true;
}

function gj_acknowledge(_requestid) {
	ds_map_delete(global.gj_requestdata, _requestid);
}

function gj_user_fetchdata(_username) {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	return gj_submit("users", "fetch", _temp);
}

function gj_user_authenticate() {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	ds_map_add(_temp, "user_token", gj_user_token);
	return gj_submit("users", "auth", _temp);
}

function gj_session_open() {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	ds_map_add(_temp, "user_token", gj_user_token);
	return gj_submit("sessions", "open", _temp);
}

function gj_session_ping(_activity) {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	ds_map_add(_temp, "user_token", gj_user_token);
	ds_map_add(_temp, "status", _activity);
	return gj_submit("sessions", "ping", _temp);
}

function gj_session_close() {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	ds_map_add(_temp, "user_token", gj_user_token);
	return gj_submit("sessions", "close", _temp);
}

function gj_session_check() {
	var _temp = ds_map_create();
	ds_map_add(_temp, "username", gj_user_name);
	ds_map_add(_temp, "user_token", gj_user_token);
	return gj_submit("sessions", "check", _temp);
}






///@func gj_submit()
///@desc Sends a GameJolt API request based on the parameters provided.
function gj_submit(_type, _action, _data) {
		_requestid = http_get(gj_construct_url(_type, _action, _data));
		ds_list_add(d_gj_api.gj_requests,_requestid);
		return _requestid;
}

function gj_construct_url(_type, _action, _data) {
	
	var _url = "https://api.gamejolt.com/api/game/" + d_gj_api.gj_apiversion + "/" + _type + "/" 
	if (not is_undefined(_action)) {_url += _action + "/?";} else {_url += "?";}
	
	var _datakeys = ds_map_keys_to_array(_data);
		for (i = 0; i < array_length(_datakeys); i++) {
			_url += "&" + string(_datakeys[i]) + "=" + string(ds_map_find_value(_data, _datakeys[i]));
		}
	
	_url += "&game_id=" + string(global.oqrp.gj.gameid);
	var _signature = md5_string_utf8(_url + global.oqrp.gj.key);
	_url += "&signature=" + _signature;
	
	if (not is_undefined(_data)) {ds_map_destroy(_data);}
	show_debug_message(_url);
	return _url;
}