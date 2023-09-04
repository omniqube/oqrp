draw_set_colour(c_white);
draw_set_font(fontCourierNew);

draw_text_transformed(x+10,y+50,"GameJolt API Driver ---\n"
+ "Status: Online? " + string(gj_online) + " Connected? " + string(gj_connected) 
,4,4,0);

draw_text_transformed(x+10, y+300, "Result: ", 3.5, 3.5, 0);
draw_text_transformed(x+10, y+350, string(_result), 2.5, 2.5, 0);