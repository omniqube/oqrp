// Client timeout handling

for (_k = ds_map_find_first(server_timeouts); !is_undefined(_k); _k = ds_map_find_next(server_timeouts, _k)) {
  _v = server_timeouts[? _k];
  if (_v >= room_speed*timeout_time) {disconnect_player(_k);}
  else {_v++;}
}

function disconnect_player(soc) {
		var dbuff = buffer_create(32, buffer_grow, 1);
		buffer_seek(dbuff, buffer_seek_start, 0);
		buffer_write(dbuff, buffer_u8, network.disconnect);
		buffer_write(dbuff, buffer_u16, ds_map_find_value(instance_to_socket, soc));
		for (var i = 0; i < ds_list_size(total_players); i++) {
			network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));
		}
		ds_map_delete(server_timeouts, soc);
		ds_map_delete(instance_to_socket, soc);
		ds_list_delete(total_players, ds_list_find_index(total_players, soc));
}