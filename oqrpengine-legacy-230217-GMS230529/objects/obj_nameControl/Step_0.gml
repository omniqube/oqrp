if(choice = 1){
	seconds++;
	if(seconds < 90){
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+1.25,camera_get_view_y(view_camera[0])+0.1)
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0])-2.5,camera_get_view_height(view_camera[0])-2)
	camera_apply(view_camera[0]);
	}
	timer++;
//Shake text	
if(timer = 1){
if(deviation = 0){
x = choose(basedx - 0.25, basedx + 0.25)
y = choose(basedy - 0.25, basedy + 0.25)
deviation = 1
}else{
x = basedx; y = basedy
deviation = 0;
}
timer = 0;
}
}


// Inputs

if (input("ui_confirm")) {
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
	room_ramp(enginetestroom,120,c_white)
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
}
if (input("ui_cancel")) {
	if choice = 1{
	
	
}else{
text = string_copy(text,0,string_length(text)-1)
}}

if (input("move_left")) {if choice = 1{
	if(choiceyes = 0){
	choiceyes = 1	
	}else{
	choiceyes = 0	
	}
	
}else{
if(currentrow > 0){
currentrow = currentrow - 1
}else{
if(currentline > 0){
currentline = currentline - 1
currentrow = 0;
while(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}
}else{
//do nothing	
}
}
}}
if (input("move_up")) {if choice = 1{
	
	
}else{
if(currentline < 8 && currentline > 0){
currentline = currentline - 1
if(nameData[currentline,currentrow] = 0){
currentrow = 0;
while(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}	
}
}
if(currentline = 8){
switch(currentrow){
case 0: break;	
case 1: currentrow = 2; break;
case 2: currentrow = 4; break;
}
currentline = currentline - 1
}
}}
if (input("move_right")) {if choice = 1{
	if(choiceyes = 0){
	choiceyes = 1	
	}else{
	choiceyes = 0	
	}
	
}else{
if(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}else{
if(nameData[currentline+1,0] != 0){
currentline = currentline + 1
currentrow = 0
}else{
//do nothing	
}
}
}}
if (input("move_down")) {if choice = 1{
	
	
}else{
if(currentline < 7){
currentline = currentline + 1
if(nameData[currentline,currentrow] = 0){
currentrow = 0;
while(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}	
}
}
else if(currentline = 7){
if(currentrow < 2){
currentrow = 0;	
}else{
currentrow = 1;
}
currentline = currentline + 1
}
}}