/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

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