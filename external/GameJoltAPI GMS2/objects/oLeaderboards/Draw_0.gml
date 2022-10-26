if(ds_exists(BoardList,ds_type_list)) {	
	draw_text(x,y-10,"Leaderboard:")
	for(var i=0; i<ds_list_size(BoardList); i+=1) {
		var Score = ds_list_find_value(BoardList,i)
		//show_debug_message(json_encode(Score))
		var name = ds_map_find_value(Score,"user")
		var sc = ds_map_find_value(Score,"score")
		
		draw_text(x,y+string_height("#")*(i+1),name)
		draw_text(room_width-5-string_width(sc),y+string_height("#")*(i+1),sc)
	}
	
	if(GJGetLoginStatus() != "") {
		var yy = y+string_height("#")*(ds_list_size(BoardList)+1)+5
		draw_sprite(sSubmitButton,0,x,yy)
		if(point_in_rectangle(mouse_x,mouse_y,x,yy,x+sprite_get_width(sSubmitButton),yy+sprite_get_height(sSubmitButton)) && mouse_check_button_released(mb_left)) {
			GJScoreAdd("",oLoginButton.BubblesPopped,string(oLoginButton.BubblesPopped)+" Popped","","",-1,-1)
			oLoginButton.BubblesPopped = 0; //This is a really bad way of doing this because if the send fails then your score is lost forever, however since this is just an example it's fine. In a realistic senario, you should always make sure your send was successful before resetting
			oLoginButton.totalClickAttempts = 0
		}
	}
} else {
	draw_text(x,y,"Leaderboard: [Loading]")
}