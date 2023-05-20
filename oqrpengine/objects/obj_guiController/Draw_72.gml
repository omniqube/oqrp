/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
offset = (scale*(0.2*camera_get_view_height(camera)))
switch(orientation){
	case 0: basex = 0; basey = camera_get_view_y(camera)+camera_get_view_height(camera)-(offset*2)      break;
	case 1: basex = 0; basey = 0; break;
	case 2: basex = camera_get_view_x(camera)+camera_get_view_width(camera)-(offset*2);
		basey = camera_get_view_y(camera)+camera_get_view_height(camera)-(offset*2);
		break;
	case 3: 
		basex = camera_get_view_x(camera)+camera_get_view_width(camera)-(offset*2);
		basey = 0
		break;
	
default: break;	
}
