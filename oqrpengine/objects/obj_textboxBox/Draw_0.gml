/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_font(font)
if (face = 1){
	draw_sprite(x+10,y+20, facesprite[current])
	draw_text(x+10,y+10,currenttext)
	
}else{
draw_text(x+10,y+10,currenttext)
}
if(choice = current and finished = 1){
	switch(choices){
	case 0: break; 
	case 1: draw_text(x+28,y+26,choice[0]); break;
	case 2: draw_text(x+28,y+26,choice[0]); draw_text(x+182,y+26,choice[1]); break;
	case 3: draw_text(x+28,y+26,choice[0]); draw_text(x+182,y+26,choice[1]); draw_text(x+28,y+58,choice[0]); break;
	case 4: draw_text(x+28,y+26,choice[0]); draw_text(x+182,y+26,choice[1]); draw_text(x+28,y+58,choice[0]); draw_text(x+182,y+58,choice[0]); break;
	default: break;
	}
}