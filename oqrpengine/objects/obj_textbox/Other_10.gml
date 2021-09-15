/// @description Insert description here
// You can write your code in this editor


if(obj_player.textbox = 0){
obj_player.textbox = 1	
if(obj_player.y < camera_get_view_border_x(view_camera[0]) + 160){
instance_create_depth(camera_get_view_x(view_camera[0])+8,camera_get_view_y(view_camera[0])+164,-10,obj_textboxBox)
}else{
instance_create_depth(camera_get_view_x(view_camera[0])+8,camera_get_view_y(view_camera[0])+1,-10,obj_textboxBox)
}
		maxboxes = array_length(text);
		obj_textboxBox.maxboxes = maxboxes; 
		for(i = 0; i < maxboxes; i++){ 
			obj_textboxBox.text[i] = text[i] 
		}; 
		obj_textboxBox.font = font; 
		obj_textboxBox.snd = snd;
		instance_destroy();
	
}

