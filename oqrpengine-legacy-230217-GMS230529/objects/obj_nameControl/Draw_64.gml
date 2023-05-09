/// @description Insert description here
// You can write your code in this editor

if(choice = 1){
	draw_set_halign(fa_center);
draw_text_transformed(window_get_width()-(window_get_width()/2),window_get_height()-(window_get_height()/8)*7.5,"Is this name correct?",window_get_width()/320,window_get_width()/320,0)
if(choiceyes = 0){ draw_set_color(c_yellow) }else{ draw_set_color(c_white) }
draw_text_transformed(window_get_width()-(window_get_width()/3)*2,window_get_height()-(window_get_height()/8),"No",window_get_width()/320,window_get_width()/320,0)
if(choiceyes = 1){ draw_set_color(c_yellow) }else{ draw_set_color(c_white) }
draw_text_transformed(window_get_width()-(window_get_width()/3)*1,window_get_height()-(window_get_height()/8),"Yes",window_get_width()/320,window_get_width()/320,0)
	draw_set_halign(fa_left);
}