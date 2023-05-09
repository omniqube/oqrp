function map_rooms(arg0){
var ds_map,i;
    ds_map = arg0;
    i = room_first;
    while (room_exists(i)) {
        ds_map_add(ds_map,room_get_name(i),i);
        i = room_next(i);
    }
return 0;
}