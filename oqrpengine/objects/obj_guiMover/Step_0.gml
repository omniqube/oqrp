/// @description Insert description here
// You can write your code in this editor
if(device = -1){
for(i = 0; i < 5; i++){
	if(device_mouse_check_button(i,mb_left)){
		if(device_mouse_x(i) >= parentid.basex && device_mouse_x(i) <= parentid.basex+parentid.offset*2 && device_mouse_y(i) >= parentid.basey && device_mouse_y(i) <= parentid.basey + parentid.offset*2){
		//device touch is active and is inside guiController range	
			device = i;
			basex = device_mouse_x(i);
			basey = device_mouse_y(i);
		}
	}
}
}else{
if(!device_mouse_check_button(device, mb_left)){
	device = -1;
}else{
	
	if(device_mouse_x(device) >= parentid.basex && device_mouse_x(device) <= parentid.basex+parentid.offset*2 && device_mouse_y(device) >= parentid.basey && device_mouse_y(device) <= parentid.basey + parentid.offset*2){
		//The gesture is active and inside 
		basex = device_mouse_x(device);
		basey = device_mouse_y(device);
	}else{
		//Gesture is active but has left the guiController range
		//use pythagoras to get angle and max
		
		
	}
}
}
