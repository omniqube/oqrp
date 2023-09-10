///@desc Debug View



dbg_view("GameJolt API", false);
dbg_section("User information");
dbg_text("Current user: " + gj_user_name + " with token " + gj_user_token);
dbg_section("Server information");
dbg_text("Online? ");
dbg_same_line();
dbg_text(ref_create(self, gj_online));
dbg_section("Session information");
dbg_text("Connected? ");
dbg_same_line();
dbg_text(ref_create(self, gj_session_connected));