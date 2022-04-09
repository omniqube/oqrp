function _room(roomarg){
	if (roomarg[0] == 0) {return string(room_get_name(room))} else {
	if (room_exists(asset_get_index(roomarg[0]))) {room_goto(asset_get_index(roomarg[0]))} else {return "Room does not exist!"}
	}
}