if (engdraw) {
draw_set_colour(c_white);
draw_set_font(fontCourierNew);

draw_text_transformed(x,y,"OQRP Engine is initializing...",1.5,1.5,0);
draw_text_transformed(x,y+45,
string(global.oqrp.game.version) + "/" + 
string(global.oqrp.game.build) + " " + 
string(global.oqrp.engine.branch) + "" + 
string(global.oqrp.engine.version),1.5,1.5,0);
} else {}
