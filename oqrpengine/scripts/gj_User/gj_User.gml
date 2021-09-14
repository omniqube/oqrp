// GameJolt User Functions

function gj_user_autologin() {
	//gj_user_autologin()
	//returns: boolean
	//Returns boolean: if user logged in
	//New way of doing this
	if(parameter_count()>=2)
	{
	    var gj_loop,parameterstring;
	    if(os_browser!=browser_not_a_browser)
	    {
	        for(gj_loop=1;gj_loop<=parameter_count();gj_loop++)
	        {
	            parameterstring=parameter_string(gj_loop)
	            switch(string_copy(parameterstring,1,string_pos("=",parameterstring)-1))
	            {
	                case "gjapi_username":
	                gj_user=string_delete(parameterstring,1,string_pos("=",parameterstring));
	                break;
	                case "gjapi_token":
	                gj_token=string_delete(parameterstring,1,string_pos("=",parameterstring));
	                break;
	            }
	        }
	    }
	    else
	    {
	        for(gj_loop=1;gj_loop<parameter_count();gj_loop++)
	        {
	            parameterstring=parameter_string(gj_loop)
	            switch(string_copy(parameterstring,1,string_pos("=",parameterstring)-1))
	            {
	                case "gjapi_username":
	                gj_user=string_delete(parameterstring,1,string_pos("=",parameterstring));
	                break;
	                case "gjapi_token":
	                gj_token=string_delete(parameterstring,1,string_pos("=",parameterstring));
	                break;
	            }
	        }
	    }
	    return true;
	}
	else return false;
	//Old way of doing this
	/*if (file_exists("gjapi-credentials.txt"))
	{
	    var file=file_text_open_read("gjapi-credentials.txt")
	    gj_user=file_text_read_string(file) 
	    file_text_readln(file)
	    gj_token=file_text_read_string(file)
	    file_text_close(file)
	    return true;
	}
	else
	return false;


/* end gj_user_autologin */
}

function gj_user_info_fromuserid(argument0) {
	//gj_user_info_fromuserid(string userid(s))
	//argument0 can be a Comma Separated List
	//returns: handle
	//Gets user info. 
	var url="http://gamejolt.com/api/game/v1/users/?game_id="+gj_gameid+"&user_id="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_user_info_fromusername(argument0) {
	//gj_user_info_fromusername(string username)
	//returns: handle
	//Gets user info. 
	var url="http://gamejolt.com/api/game/v1/users/?game_id="+gj_gameid+"&username="+argument0;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	ds_map_add(gj_handletypemap,gj_currhandle,1)
	return gj_currhandle;



}

function gj_user_isloggedin() {
	//gj_user_isloggedin()
	//returns: boolean
	//Checks if the user is logged in
	return gj_user!="";



}

function gj_user_login(argument0, argument1) {
	//gj_user_login(string username,string user_token)
	//returns: handle
	//Auth the user. Check for the result in the async event.
	var url="http://gamejolt.com/api/game/v1/users/auth/?game_id="+gj_gameid+"&username="+argument0+"&user_token="+argument1;
	url+="&signature="+md5_string_utf8(url+gj_privatekey)
	var gj_currhandle=http_get(url);
	gj_tempuser=argument0
	gj_temptoken=argument1
	ds_map_add(gj_handletypemap,gj_currhandle,0)
	return gj_currhandle;



}

function gj_user_logout() {
	//gj_user_logout()
	//returns: nothing
	//if logged in: log out
	gj_user=""
	gj_token=""



}

function gj_user_username() {
	//gj_user_username()
	//returns: string
	//Returns username
	return gj_user;



}
