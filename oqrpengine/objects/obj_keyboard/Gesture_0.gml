/// @description Insert description here
// You can write your code in this editor
gridx = floor(mouse_x/180)
gridy = floor((mouse_y-648)/108)
switch(mapcurrent[gridy][gridx]){
case "?!&": mapcurrent = charmap2; break;
case "ABC": mapcurrent = charmap; break;
case "ENTER": 
//newline or cancel
instance_destroy();
break;
case "SHIFT":  if(mapcurrent = charmap){  mapcurrent = charmapC }else if(mapcurrent = charmapC){ mapcurrent = charmap }; break;
case "SPACE": if(string_length(text[0]) < obj_textField.limit){ text[0] = text[0] + " ";} break;
case "BACK": if(string_length(text[0]) > 1){ string_delete(text[0],string_length(text[0])-1,1) } break;
default: if(string_length(text[0]) < obj_textField.limit){text[0] = text[0] + charmap[gridy][gridx];} break;	
}
log("Tap at keyboard grid: " + string(gridx) + "," + string(gridy))