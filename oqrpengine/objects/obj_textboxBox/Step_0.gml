/// @description Insert description here
// You can write your code in this editor
timer++;
if(timer = 2){
if(charat = string_length(text[current])){
	finished = 1
}else{
//show_debug_message("Adding char "+string(charat)+",max: "+string(string_length(currenttext)))
if(string_char_at(currenttext,charat) = "|"){
	//add switch in future development
}else{
currenttext =  currenttext + string_char_at(text[current],charat)
if(string_char_at(text[current],charat) != " " && string_char_at(text[current],charat) != "#"){
	//show_debug_message("sfx")
	audio_play_sound(snd, 10, false);
}
}
charat++;
timer = 0; 
}
}
if(finished = 1){
	if(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))){
	if(current = maxboxes - 1){
	instance_destroy();
	obj_player.textbox = 0
	}else{
	current++; 
	timer = 0;
	charat = 1; 
	text = "";
	obj_introPanelSprite.image_alpha = 1
	fadeout = 0;
	}
}	
}