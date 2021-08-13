function map_timelines(arg0){
    var no,i,ds_map;
    ds_map = arg0;
    no = timeline_add();
    timeline_delete(no);
    for (i=0; i<no; i+=1) {
        if (timeline_exists(i)) {
            ds_map_add(ds_map,timeline_get_name(i),i);
        }
    }
    return 0;
}