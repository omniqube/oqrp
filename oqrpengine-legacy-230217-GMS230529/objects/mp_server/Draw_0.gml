var all_players = ds_list_size(total_players);
draw_text(0,0,"SERVER MODE, PORT=" + string(global.mp_tgport));

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(room_width/4, room_height/4, "Connected Players: " + string(all_players));
for (i = 0; i < ds_list_size(total_players); i++) {
draw_text(room_width/4, (room_height/4)+(i*30)+30, "Player " + string(i) + ": " + 
string(ds_list_find_value(total_players, i))
);
}
draw_set_halign(fa_left);