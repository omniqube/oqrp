function map_fonts(arg0){
var no,i,ds_map;
    ds_map = arg0
    no = font_add(global.oqrp_directory+"callibration_font.ttf",12,false,false,32,128);
    font_delete(no);
    for (i=0;i<no;i+=1) {
        if (path_exists(i)) {
            ds_map_add(ds_map,path_get_name(i),i)
        }
    }
return 0;
}