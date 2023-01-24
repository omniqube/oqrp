/// OQRP Engine Multiplayer Integration, WIP ALPHA
// Server

max_players = 8;

show_console_message("[Server] TG " + string(global.mp_tgport));
server = network_create_server(network_socket_tcp, global.mp_tgport, max_players);
total_players = ds_list_create(); // former socket_list

if (server < 0) {
	show_message("Error creating server.");
	game_restart();
}