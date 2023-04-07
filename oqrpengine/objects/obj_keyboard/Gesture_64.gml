/// @description Insert description here
// You can write your code in this editor
//logs all 3 taps

for(i = 0; i < 3; i++){
	if(device_mouse_check_button(i,mb_left)){
//Default value for unused taps: -120, 0
if(device_mouse_x(i) >= x and device_mouse_x(i) <= x + sprite_width and device_mouse_y(i) >= y and device_mouse_y(i) <= y + sprite_height){
	//if tap is correct
}else{
	if(device_mouse_x(i) >= 0 and device_mouse_y(i) >= 0){
	instance_destroy()
	}
}}}