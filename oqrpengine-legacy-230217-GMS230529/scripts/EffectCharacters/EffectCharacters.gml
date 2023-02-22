function scl(charAt) {  // Special Character List
contains = false;
for (i=0; i<ds_list_size(global.SpecialCharacterList); i++) {if (ds_list_find_value(global.SpecialCharacterList, i) == string(charAt)) {contains = true;}}
return contains;
}

function scl_create() {
global.SpecialCharacterList = ds_list_create()
ds_list_add(0, "|")
ds_list_add(1, "¤")
}