/// @description Insert description here
// You can write your code in this editor
sprite_index = sprite
draw_self()
draw_set_halign(fa_left); draw_set_valign(fa_center);
draw_set_font(font)
if(linemax = 1){
draw_text(x+(sprite_width/75),y + (sprite_height/2),text)
}
if(instance_exists(obj_keyboard)){
cursortimer++
if(cursortimer <= 15){
draw_line(x+(font_get_size(font)/5)+string_width(text),y + (sprite_height/2) - (font_get_size(font)/2) - (font_get_size(font)/4), x+(font_get_size(font)/5)+string_width(text), y + (sprite_height/2) + (font_get_size(font)/2) - (font_get_size(font)/4))
}
if(cursortimer = 30){
cursortimer = 0;	
}
}
draw_set_halign(fa_left); draw_set_valign(fa_top);