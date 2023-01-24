// Server data pakcet handling script

function server_data(){
	
	var packet = async_load[? "buffer"]; // Load ID of packet
	buffer_seek(packet, buffer_seek_start, 0); // Seek start of buffer
	
	var PACKET_ID = buffer_read(packet, buffer_u8); // Read network enum of packet through the driver
	
	switch (PACKET_ID) {
		
		case network.move:			// Handle move enum
			var player_id = buffer_read(packet, buffer_u16);	// Read contents in order
			var player_x = buffer_read(packet, buffer_s16);
			var player_y = buffer_read(packet, buffer_s16);
			var player_angle = buffer_read(packet, buffer_s16);
			
			// Repack buffer
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.move);
			buffer_write(buff, buffer_u16, player_id);
			buffer_write(buff, buffer_s16, player_x);
			buffer_write(buff, buffer_s16, player_y);
			buffer_write(buff, buffer_s16, player_angle);
			
			// Send buffer to other clients
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));
			}
			
			buffer_delete(buff);
		break;
	}
			
}