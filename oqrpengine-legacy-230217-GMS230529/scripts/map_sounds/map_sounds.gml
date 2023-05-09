function map_sounds(arg0){
	var no,i,ds_map;
    ds_map = arg0;
	no = 0;
	while (audio_exists(no)) {no++;}
        for (i=0; i<no; i+=1) {
            if (audio_exists(i)) {
                ds_map_add(ds_map,audio_get_name(i),i);
            }
        }
		return 0;
    }
    


