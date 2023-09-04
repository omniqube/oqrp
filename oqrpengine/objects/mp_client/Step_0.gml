var lbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(lbuff, buffer_seek_start, 0);
buffer_write(lbuff, buffer_u8, network.latency);
buffer_write(lbuff, buffer_u32, current_time);
network_send_packet(client, lbuff, buffer_tell(lbuff));

timeout++;
if (timeout > global.realtime*timeout_time) {
	disconnect();
	show_message("Connection timed out.");
	game_restart();
}