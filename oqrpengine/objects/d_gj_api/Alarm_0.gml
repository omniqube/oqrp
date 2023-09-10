///@desc Session manager

if (_waitingonping) {gj_acknowledge(_sessionrequestid); _waitingonping = false;}

if (not gj_session_connected && _sessionrequestid = -1) {
	_sessionrequestid = gj_session_check();
	alarm[0] = global.realtime;
	return;
}

if (not gj_session_connected) {
	if (not gj_requestprocessed(_sessionrequestid)) {
		var _tempsession = gj_request_to_map(_sessionrequestid);
		gj_session_connected = ds_map_find_value(_tempsession, "success");
		ds_map_destroy(_tempsession);
		gj_acknowledge(_sessionrequestid);
		} else {alarm[0] = global.realtime; return;}
}

if (not gj_session_connected) {
	_sessionrequestid = gj_session_open();
	alarm[0] = global.realtime;
	return;
}

_sessionrequestid = gj_session_ping("active");
_waitingonping = true;
alarm[0] = global.realtime*30;
