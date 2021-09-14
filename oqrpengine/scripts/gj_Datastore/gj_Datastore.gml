// GameJolt Datastore Functions

function gj_datastore_get_global(argument0) {
	//gj_datastore_get_global(string key)
	//returns: handle
	//Get data from the datastore key.
	var url="http://gamejolt.com/api/game/v1/data-store/?format=dump&game_id="+gj_gameid+"&key="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,4)
	return gj_currhandle;



}

function gj_datastore_get_user(argument0) {
	//gj_datastore_get_user(string key)
	//returns: handle
	//Get data from the datastore key of the user.
	var url="http://gamejolt.com/api/game/v1/data-store/?format=dump&game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,4)
	return gj_currhandle;



}

function gj_datastore_keys_global() {
	//gj_datastore_keys_global()
	//returns: handle
	//Get all keys from the datastore.
	var url="http://gamejolt.com/api/game/v1/data-store/get-keys/?game_id="+gj_gameid;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_datastore_keys_user() {
	//gj_datastore_keys_user()
	//returns: handle
	//Get all keys from the datastore.
	var url="http://gamejolt.com/api/game/v1/data-store/get-keys/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_datastore_remove_global(argument0) {
	//gj_datastore_remove_global(string key)
	//returns: handle
	//Removes the key.
	var url="http://gamejolt.com/api/game/v1/data-store/remove/?game_id="+gj_gameid+"&key="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_datastore_remove_user(argument0) {
	//gj_datastore_remove_user(string key)
	//returns: handle
	//Removes the key from the user data store.
	var url="http://gamejolt.com/api/game/v1/data-store/remove/?game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_datastore_set_global(argument0, argument1) {
	//gj_datastore_set_global(string key,string data)
	//returns: handle
	//Set key (argument0) in data store to data (argument1)
	var url="http://gamejolt.com/api/game/v1/data-store/set/",posturl="game_id="+gj_gameid+"&key="+argument0+"&data="+argument1;
	posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_post_string(url,posturl);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_datastore_set_user(argument0, argument1) {
	//gj_scores_add(string key,string data)
	//returns: handle
	//Set key (argument0) in data store to data (argument1) in the data store of the user
	var url="http://gamejolt.com/api/game/v1/data-store/set/",posturl="game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0+"&data="+argument1;
	posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_post_string(url,posturl);
	ds_map_add(gj_handletypemap,gj_currhandle,2)
	return gj_currhandle;



}

function gj_datastore_update_global(argument0, argument1, argument2) {
	//gj_datastore_update_global(string key,string value,string operation)
	//returns: handle
	//Set key (argument0) in data store to data (argument1)
	var url="http://gamejolt.com/api/game/v1/data-store/update/",posturl="game_id="+gj_gameid+"&key="+argument0+"&value="+argument1+"&operation="+argument2;
	posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_post_string(url,posturl);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_datastore_update_user(argument0, argument1, argument2) {
	//gj_datastore_update_user(string key,string value,string operation)
	//returns: handle
	//Set key (argument0) in user data store to data (argument1)
	var url="http://gamejolt.com/api/game/v1/data-store/update/",posturl="game_id="+gj_gameid+"&username="+gj_user+"&user_token="+gj_token+"&key="+argument0+"&value="+argument1+"&operation="+argument2;
	posturl+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_post_string(url,posturl);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}
