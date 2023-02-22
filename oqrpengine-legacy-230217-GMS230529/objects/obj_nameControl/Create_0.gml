/// @description Insert description here
// You can write your code in this editor
//Pridat normalne napisanie na klavesnici
//editable vars
camera_apply(view_camera[0]);
font = UTfont
//
seconds = 0
text = ""
choice = 0;
choiceyes = 0;
timer = 0;
deviation = 0;
currentrow = 0;
currentline = 0;
nameData = [
["A","B","C","D","E","F","G",0],
["H","I","J","K","L","M","N",0],
["O","P","Q","R","S","T","U",0],
["V","W","X","Y","Z",0,0],
["a","b","c","d","e","f","g",0],
["h","i","j","k","l","m","n",0],
["o","p","q","r","s","t","u",0],
["v","w","x","y","z",0,0],
["Quit","Backspace","Done",0],
[0]
];
basedx = 0;
basedy = 0;
basex = 64;
basey = 64; 
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