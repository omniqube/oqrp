/// @description Insert description here
// You can write your code in this editor
basex = x;
basey = y;
timer = 0;
deviation = 0
text = ""
row = 0;
line = 0;
switch(y){
case 64: line = 0; break;
case 80: line = 1; break;
case 96: line = 2; break;
case 112: line = 3; break;

case 130: line = 4; break;
case 146: line = 5; break;
case 162: line = 6; break;
case 178: line = 7; break;
	
case 210: line = 8; break;
default: break;
}
if(line = 8){
switch(x){
case 64: row = 0; break;
case 128: row = 1; break;
case 224: row = 2; break;
default: break;
	
}
	
}else{
	switch(x){
case 64: row = 0; break;
case 96: row = 1; break; 
case 128: row = 2; break;
case 160: row = 3; break;
case 192: row = 4; break;
case 224: row = 5; break;
case 256: row = 6; break;
default: break;
}
}
show_debug_message(line)
text = obj_nameControl.nameData[line,row];
