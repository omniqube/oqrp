// Server data pakcet handling script

function server_data(){
	
	var packet = async_load[? "buffer"]; // Load ID of packet
	var socket = async_load[? "id"];	// Load socket of packet
	buffer_seek(packet, buffer_seek_start, 0); // Seek start of buffer
	
	var PACKET_ID = buffer_read(packet, buffer_u8); // Read network enum of packet through the driver
	
	switch (PACKET_ID) {
		
		case network.move:			// Handle move enum
			var pid = buffer_read(packet, buffer_u16);	// Read contents in order
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
		
		case network.latency:
			var _time = buffer_read(packet, buffer_u32);
			
			var lbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(lbuff, buffer_seek_start, 0);
			buffer_write(lbuff, buffer_u8, network.latency);
			buffer_write(lbuff, buffer_u32, _time);
			network_send_packet(socket, lbuff, buffer_tell(lbuff));
			buffer_delete(lbuff);
		break;
		
		case network.disconnect:
			var discon_id = buffer_read(packet, buffer_u16);
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.disconnect);
			buffer_write(dbuff, buffer_u16, discon_id);
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));
			}
			ds_list_delete(total_players, ds_list_find_index(total_players, socket));
			ds_map_delete(server_timeouts, socket);
			ds_map_delete(instance_to_socket, socket);
		break;
		
		case network.join:
			var client_idd = buffer_read(packet, buffer_u16);
			var player_idd = buffer_read(packet, buffer_u16);
			ds_map_add(server_instances, client_idd, player_idd);
			ds_map_add(instance_to_socket, socket, client_idd);
			var jbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(jbuff, buffer_seek_start, 0);
			buffer_write(jbuff, buffer_u8, network.join);
			buffer_write(jbuff, buffer_u16, client_idd);
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));
			}
			buffer_delete(jbuff);
		break;
			
	}
			
}