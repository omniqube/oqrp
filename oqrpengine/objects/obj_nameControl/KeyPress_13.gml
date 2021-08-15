/// @description Insert description here
// You can write your code in this editor
if choice = 1{
	if(choiceyes = 0){
	camera_set_view_pos(view_camera[0],0,0)
	camera_set_view_size(view_camera[0],320,240)
	camera_apply(view_camera[0]);	
	choice = 0;
	instance_create_depth(0,0,0,obj_nameCover);
	for(a = 0; a < 3; a++){
	for(i = 0; i < 7; i++){
	instance_create_depth(basex+(i*32),basey+(a*16),-1,obj_nameChoice)	
	}}
	for(i = 0; i < 5; i++){
	instance_create_depth(basex+(i*32),basey+(3*16),-1,obj_nameChoice)	
	}
	for(a = 0; a < 3; a++){
	for(i = 0; i < 7; i++){
	instance_create_depth(basex+(i*32),basey+((4+a)*16+2),-1,obj_nameChoice)	
	}}
	for(i = 0; i < 5; i++){
	instance_create_depth(basex+(i*32),basey+(7*16)+2,-1,obj_nameChoice)	
	}
	instance_create_depth(64,210,-1,obj_nameChoice)	
	instance_create_depth(128,210,-1,obj_nameChoice)	
	instance_create_depth(224,210,-1,obj_nameChoice)	
	}else{
	//Maek rampa script
	room_fade(enginetestroom,120,c_white)	
	}
	
}else{
if(currentline < 8){
if(string_length(text) < 6){
text = text + nameData[currentline, currentrow];	
}
}else if(currentline = 8){
if(currentrow = 0){
//Quit neni kvoli nedostatocnej detekcii first launchu pri save systeme
}else if(currentrow = 1){
text = string_copy(text,0,string_length(text)-1)	
}else if(currentrow = 2 and text != ""){
choice = 1
with obj_nameChoice instance_destroy();
with obj_nameCover instance_destroy();
}
}}