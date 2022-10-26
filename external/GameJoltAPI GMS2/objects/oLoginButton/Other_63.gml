if(ds_map_find_value(async_load, "id") = loginAttempt) {
    username = ds_map_find_value(async_load, "username");
    password = ds_map_find_value(async_load, "password");
	if(username != "" && password != "") {
			GJLogin(username,password,UserLoggedIn,-1)
	}
} 