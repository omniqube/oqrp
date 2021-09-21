/// @description Insert description here
// You can write your code in this editor
timer++;
if(choicebox = current){
	if !instance_exists(obj_choiceBack){
	switch(choices){
	case 0: break; 
	case 1: instance_create_layer(x+10,y+26,"Instances",obj_choiceBack); break;
	case 2: instance_create_layer(x+10,y+26,"Instances",obj_choiceBack); instance_create_layer(x+164,y+26,"Instances",obj_choiceBack); break;
	case 3: instance_create_layer(x+10,y+26,"Instances",obj_choiceBack); instance_create_layer(x+164,y+26,"Instances",obj_choiceBack); instance_create_layer(x+10,y+58,"Instances",obj_choiceBack); break;
	case 4: instance_create_layer(x+10,y+26,"Instances",obj_choiceBack); instance_create_layer(x+164,y+26,"Instances",obj_choiceBack); instance_create_layer(x+10,y+58,"Instances",obj_choiceBack); instance_create_layer(x+164,y+58,"Instances",obj_choiceBack); break;
	default: break;
	}
	}
	if(finished = 1 and !instance_exists(obj_choicer)){
		instance_create_layer(x+10,y+26,"Instances",obj_choicer);
		currentchoice = 0
	}
}
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
		//Save choice if choice
	if(choicebox = current){
	//Save shit	
	with obj_choiceBack instance_destroy();
	with obj_choicer instance_destroy();
	}
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