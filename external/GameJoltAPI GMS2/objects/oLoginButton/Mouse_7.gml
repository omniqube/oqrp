if(GJGetLoginStatus() = "") {
	loginAttempt = get_login_async("","");
} else {
	//Don't allow the user to login twice
	show_message_async("You can't do that twice! You're welcome to keep trying though.")
}

totalClickAttempts --