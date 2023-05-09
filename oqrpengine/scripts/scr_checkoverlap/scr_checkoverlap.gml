// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Check if various objects (mostly GUI) overlap with the object -> turning off events through tapactive
//DevComment: Every object which has "tap" events should have a local var names tapactive to use this script
function scr_checkoverlap(){
	tapactive = 1;
    if(instance_exists(obj_keyboard)){
		if(y > obj_keyboard.y and y+sprite_height < obj_keyboard.y+obj_keyboard.sprite_height){
			tapactive = 0;	
	}}
}