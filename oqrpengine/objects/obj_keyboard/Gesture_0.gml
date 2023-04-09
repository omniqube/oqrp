/// @description Insert description here
// You can write your code in this editor
for(i = 0; i < 3; i++){
if(device_mouse_check_button(mb_left,i)){
if(device_mouse_x(i) > x and device_mouse_x(i) < x + sprite_width and device_mouse_y(i) > y and device_mouse_y(i) < y + sprite_height){
gridx = floor(device_mouse_x(i)/180)
gridy = floor((device_mouse_y(i)-648)/108)
log("5 devices dat: \n");
/*
log("Device 0: " + string(device_mouse_x(0)) + " , " + string(device_mouse_y(0)));
log("Device 1: " + string(device_mouse_x(1)) + " , " + string(device_mouse_y(1)));
log("Device 2: " + string(device_mouse_x(2)) + " , " + string(device_mouse_y(2)));
log("Device 3: " + string(device_mouse_x(3)) + " , " + string(device_mouse_y(3)));
log("Device 4: " + string(device_mouse_x(4)) + " , " + string(device_mouse_y(4)));
log("Tap at keyboard grid: " + string(gridx) + "," + string(gridy))
*/
switch(mapcurrent[gridy][gridx]){
case "?!&": mapcurrent = charmap2; break;
case "ABC": mapcurrent = charmap; break;
case "ENTER": 
//newline or cancel
instance_destroy();
break;
case "SHIFT":  if(mapcurrent = charmap){  mapcurrent = charmapC }else if(mapcurrent = charmapC){ mapcurrent = charmap }; break;
case "SPACE": if(string_length(parentid.text) < parentid.limit){ parentid.text = parentid.text + " ";} break;
case "BACK": if(string_length(parentid.text) > 0){ parentid.text = string_delete(parentid.text,string_length(parentid.text),1) 
				log("Removing char from position " + string(string_length(parentid.text)))
				} break;
default: if(string_length(parentid.text) < parentid.limit){parentid.text = parentid.text + mapcurrent[gridy][gridx];} break;	
}
}
}
}