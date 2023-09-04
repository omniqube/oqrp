var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	
	case network.move: // Assign packet to correct player
		var pid = buffer_read(packet, buffer_u16);
		var find_player = ds_map_find_value(instances, pid);	// Find player ID through instance map
		
		// Create player and add to map (if non-existant)
		if (is_undefined(find_player)) {
			var p = instance_create_layer(random(room_width), random(room_height), "Instances", mp_testplayer)
			ds_map_add(instances, pid, p);
		} else {	// Assign data to existant player
			if (idd != pid) && (instance_exists(find_player)) {
				var player_x = buffer_read(packet, buffer_s16);
				var player_y = buffer_read(packet, buffer_s16);
				var player_angle = buffer_read(packet, buffer_s16);
				
				find_player.x = player_x;
				find_player.y = player_y;
				find_player.image_angle = player_angle;
			}
		}
	break;
	
	case network.latency:
		var _got_time = buffer_read(packet, buffer_u32);
		latency = current_time - _got_time;
		timeout = 0;
	break;
	
	case network.disconnect:
		var disconnect_id = buffer_read(packet, buffer_u16);
		var disconnect_player = ds_map_find_value(instances, disconnect_id);
		
		if (disconnect_id != idd) {
			if (!is_undefined(disconnect_player)) {
				with (disconnect_player) {instance_destroy();}
			}
		} else {
			game_restart();
		}
	break;
	
	case network.join:
		var connect_id = buffer_read(packet, buffer_u16);
	break;
	
}