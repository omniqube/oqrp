function disconnect(){
	if (instance_exists(mp_client)) {
		if (instance_exists(mp_client.Player)) {
			
			var dis_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dis_buff, buffer_seek_start, 0);
			buffer_write(dis_buff, buffer_u8, network.disconnect);
			buffer_write(dis_buff, buffer_u16, mp_client.Player.my_id);
			network_send_packet(mp_client.client, dis_buff, buffer_tell(dis_buff));
			buffer_delete(dis_buff);
			
		} else {
			show_message("No player instance was found to disconnect.");
		}
		
	} else {
		show_message("No client was found!");
	}
}