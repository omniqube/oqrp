/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_sprite(spr_keyboard,0,x,y)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

for(i = 0; i < 4; i++;){
	for(j = 0; j < 12; j++){
		if(string_length(mapcurrent[i][j]) > 1){
		switch(mapcurrent[i][j]){
			case "ABC": break;
			case "BACK": break;
			case "SPACE": break;
			case "ENTER": break;
			case "?!&": break;
			case "SHIFT": break;
			
			default: break;
		}
		}else{
		draw_text(x+90+(j*180),y+54+(i*108),mapcurrent[i][j]);	
		}
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)