// GameJolt Score Functions

function gj_scores_add(argument0, argument1, argument2, argument3) {
	//gj_scores_add(string table_id,string scorestring, real scoresort, string extra_data)
	//returns: handle
	//Add a score
	var url="http://gamejolt.com/api/game/v1/scores/add/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&table_id="+argument0+"&score="+string(argument1)+"&sort="+string(argument2)+"&extra_data="+argument3;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_scores_add_guest(argument0, argument1, argument2, argument3, argument4) {
	//gj_scores_add(string table_id,string scorestring, real scoresort, string extra_data, string GuestName)
	//returns: handle
	//Add a score
	var url="http://gamejolt.com/api/game/v1/scores/add/?game_id="+gj_gameid+"&guest="+argument4+"&table_id="+argument0+"&score="+string(argument1)+"&sort="+string(argument2)+"&extra_data="+argument3;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_scores_get(argument0, argument1) {
	//gj_scores_get(string table_id,real limit)
	//returns: handle
	//Get scores from a list
	var url="http://gamejolt.com/api/game/v1/scores/?game_id="+gj_gameid+"&table_id="+argument0+"&limit="+string(argument1);
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,3)
	return gj_currhandle;



}

function gj_scores_get_user(argument0, argument1) {
	//gj_scores_add(string table_id,real limit)
	//returns: handle
	//Get all scores by the current user from a list
	var url="http://gamejolt.com/api/game/v1/scores/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&table_id="+argument0+"&limit="+string(argument1);
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_scores_tables() {
	//gj_scores_tables()
	//returns: handle
	//Get all highscore tables in your game
	var url="http://gamejolt.com/api/game/v1/scores/tables/?game_id="+gj_gameid;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}
