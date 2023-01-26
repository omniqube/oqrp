if (engdraw) {
draw_set_colour(c_white);
draw_set_font(fontCourierNew);
draw_text(x,y,"OQRP Engine is initializing...");
draw_text(x,y+30,
string(global.oqrp.game.version) + "/" + 
string(global.oqrp.game.build) + " " + 
string(global.oqrp.engine.branch) + "" + 
string(global.oqrp.engine.version));
} else {}
