if (instance_exists(mp_client) && (my_id == mp_client.idd)) {
	
		if (input("move_up")) y -= 3;
		if (input("move_down")) y += 3;
		if (input("move_left")) x -= 3;
		if (input("move_right")) x += 3;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	// Send data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);		// Packet type: movement
	buffer_write(buff, buffer_u16, my_id);
	buffer_write(buff, buffer_u16, x);
	buffer_write(buff, buffer_u16, y);
	buffer_write(buff, buffer_u16, image_angle);
	network_send_packet(mp_client.client, buff, buffer_tell(buff));		// Use client's socket
	buffer_delete(buff);
	
}