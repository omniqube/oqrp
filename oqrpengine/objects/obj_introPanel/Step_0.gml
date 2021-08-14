/// @description Insert description here
// You can write your code in this editor
timer++;
currenttext = obj_introControl.panelText[current];
if(timer = obj_introControl.paneltextSpeed[current] || fadeout = 1){
if(charat = string_length(currenttext)){
if(current = obj_introControl.maxPanels - 1){
room_goto(enginetestroom)	
}else{
show_debug_message("switching message")
if(obj_introPanelSprite.image_alpha > 0){
	obj_introPanelSprite.image_alpha -= 0.05;
	fadeout = 1
}else{
current++; 
timer = 0;
charat = 1; 
text = "";
obj_introPanelSprite.image_alpha = 1
fadeout = 0;
}
}
}else{
show_debug_message("Adding char "+string(charat)+",max: "+string(string_length(currenttext)))
if(string_char_at(currenttext,charat) = "|"){
	//add switch in future development
}else{
text = text + string_char_at(currenttext,charat)
if(string_char_at(currenttext,charat) != " " && string_char_at(currenttext,charat) != "#"){
	show_debug_message("sfx")
	audio_play_sound(snd_introtext, 10, false);
}
}
charat++;
timer = 0; 
}
}