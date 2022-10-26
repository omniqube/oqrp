draw_set_font(fArial)
draw_self()

if(GJGetLoginStatus() != "") { //Draw our "logged in" message if the player is logged in!
	draw_text(x+sprite_width+5,y+sprite_height/2-string_height("#")/2,"Logged in as: "+GJGetLoginStatus())	
}

draw_text(x,y+sprite_height+5,"Bubbles Popped: "+string(BubblesPopped)+"\nBubbles Popped Together: "+string(GlobalBubblesPopped)+"\nAccuracy: "+string(round((BubblesPopped/totalClickAttempts)*100))+"%")

if(mouse_check_button_pressed(mb_left)) {
	totalClickAttempts ++ //really inaccurate accuracy counter, how ironic.
}

while(instance_number(oBubble) < 100) { //I guess I've turned this login button into a control object
	instance_create_layer(random(room_width),random(room_height),layer,oBubble)	
}


//Trophy Handler
if(BubblesPopped >= 100) {
	if(ds_list_find_index(AchievedTrophyList,"Bronze") = -1) {
		ds_list_add(AchievedTrophyList,"Bronze")
		GJTrophyUpdate("127304",1,-1,-1)
	}
}
if(BubblesPopped >= 250) {
	if(ds_list_find_index(AchievedTrophyList,"Silver") = -1) {
		ds_list_add(AchievedTrophyList,"Silver")
		GJTrophyUpdate("127305",1,-1,-1)	
	}
}
if(BubblesPopped >= 500) {
	if(ds_list_find_index(AchievedTrophyList,"Gold") = -1) {
		ds_list_add(AchievedTrophyList,"Gold")
		GJTrophyUpdate("127306",1,-1,-1)	
	}
}
if(BubblesPopped >= 1000) {
	if(ds_list_find_index(AchievedTrophyList,"Plat") = -1) {
		ds_list_add(AchievedTrophyList,"Plat")
		GJTrophyUpdate("127307",1,-1,-1)	
	}
}