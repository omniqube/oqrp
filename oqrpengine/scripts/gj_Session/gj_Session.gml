// GameJolt Session Functions

function gj_session_close() {
	//gj_session_close()
	//returns: handle
	//Close session
	var url="http://gamejolt.com/api/game/v1/sessions/close/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_session_open() {
	//gj_session_open()
	//returns: handle
	//Open session
	var url="http://gamejolt.com/api/game/v1/sessions/open/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_session_ping(argument0) {
	//gj_session_ping(bool status (true for active, false for idle))
	//returns: handle
	//Ping session
	if(argument0)
	var url="http://gamejolt.com/api/game/v1/sessions/ping/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&status=active";
	else
	var url="http://gamejolt.com/api/game/v1/sessions/ping/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&status=idle";
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}