/// @description Insert description here
// You can write your code in this editor
timer++;
if(timer = 2 and finished = 0){
if(charat-1 = string_length(text[current])){
	finished = 1
}else{
//show_debug_message("Adding char "+string(charat)+",max: "+string(string_length(currenttext)))
if(string_char_at(text[current],charat) = "|"){
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
	if(input("ui_confirm")){
	if(current = maxboxes - 1){
	if (instance_exists(obj_textboxSequence)) {obj_textboxSequence.returnPulse = true;}
	obj_player.textbox = 0
	instance_destroy();
	}else{
	finished = 0
	current++; 
	timer = 0;
	charat = 1; 
	currenttext = "";
	}
}	
}