
draw_set_halign(fa_left);
draw_set_colour(c_black);
draw_set_font(fontCourierNew);

draw_text_transformed(x+100,y+50,"GameJolt API Driver ---\n"
+ "Status: Online? " + string(gj_online) + " Connected? " + string(gj_connected) 
,2,2,0);

draw_text_transformed(x+10, y+300, "Result: ", 1.5, 1.5, 0);
draw_text_transformed(x+10, y+350, string(_result), 1, 1, 0);