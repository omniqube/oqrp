/// @desc OQRP GameJolt Integration Driver
// Version 1, for GameJolt Game API version 1.2
// See https://gamejolt.com/game-api/doc/ for more information.

//if (not global.oqrp.gj.active) {instance_destroy();}
gj_apiversion = "v1_2"
gj_online = false;
gj_requests = ds_list_create();
global.gj_requestdata = ds_map_create();

gj_session_connected = false;
_sessionrequestid = -1;
_waitingonping = false;

_result = "";

gj_user_name = ""; gj_user_token = "";

/* TEMPORARY */ gj_user_name = "FktM"; gj_user_token = "oqFktM";

// Capture Persistent Save information
if not global.firstlaunch {
	if (not is_undefined(ds_map_find_value(global.psave, "GJ_USERINFO"))) {
		var _gjimportuser = ds_map_find_value(global.psave, "GJ_USERINFO");
		gj_user_name = _gjimportuser[? "USERNAME"];
		gj_user_token = _gjimportuser[? "USERTOKEN"];
	}
}

// Capture GameJolt Client - only if player doesn't have alternative account!
gj_uses_client = file_exists(".gj_credentials");
if (gj_uses_client && gj_user_name == "" && gj_user_token == "") {
	gj_client_credentials = file_text_open_read(".gj-credentials");
	gj_client_credversion = file_text_readln(gj_client_credentials);
	gj_user_name = file_text_readln(gj_client_credentials);
	gj_user_token = file_text_readln(gj_client_credentials);
	file_text_close(gj_client_credentials);
} 

if (gj_user_name != "" && gj_user_token != "") {
	event_user(0);
	alarm[0] = 1;
}

// Driver will stay idle if session not open

