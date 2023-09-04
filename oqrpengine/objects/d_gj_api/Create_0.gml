/// @desc OQRP GameJolt Integration Driver
// Version 1, for GameJolt Game API version 1.2 and OQRP Engine build 230905
// See https://gamejolt.com/game-api/doc/ for more information.

if (not global.oqrp.gj.active) {instance_destroy();}
gj_apiversion = "v1_2"
gj_connected = false;
gj_online = false;

gj_requests = ds_list_create();

// Capture GameJolt Client - only if player doesn't have alternative account!
gj_uses_client = file_exists(".gj_credentials");
if (gj_uses_client) {
	gj_client_credentials = file_text_open_read(".gj-credentials");
	gj_client_credversion = file_text_readln(gj_client_credentials);
	gj_username = file_text_readln(gj_client_credentials);
	gj_usertoken = file_text_readln(gj_client_credentials);
	file_text_close(gj_client_credentials);
} 

alarm[0] = global.realtime;

/* TEMPORARY */ gj_username = "FktM"; gj_usertoken = "oqFktM";

_result = "";