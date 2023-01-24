/// OQRP Engine Multiplayer Integration, WIP ALPHA
// Client

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
show_console_message("[Client] TG " + string(global.mp_tgip) + " " + string(global.mp_tgport));
network_connect(client, global.mp_tgip, global.mp_tgport);

instances = ds_map_create();
idd = 0;
Player = instance_create_layer(random(room_width), random(room_height), "Instances", mp_testplayer);
idd = Player.my_id;

ds_map_add(instances, idd, Player);

if (client < 0) {
	show_message("Error connecting to server.");
	game_restart();
}
