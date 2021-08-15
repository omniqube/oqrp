/// @description Insert description here
// You can write your code in this editor
draw_set_font(obj_nameControl.font)
if(obj_nameControl.currentline = line && obj_nameControl.currentrow = row){
draw_set_color(c_yellow)	
}else{
draw_set_color(c_white)
}
draw_text(x,y,text)