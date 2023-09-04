function map_paths(){
var no,i,ds_map;
    ds_map = argument0;
    no = path_add();
    path_delete(no);
    for (i=0; i<no; i+=1) {
        if (path_exists(i)) {
            ds_map_add(argument0,path_get_name(i),i);
        }
    }
return 0;
}