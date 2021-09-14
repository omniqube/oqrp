function ds_map_clone() {
    var map, clone;
    map = argument0;
    clone = ds_map_create();
    ds_map_copy(clone, map);
    return clone;
}

function ds_map_deep_clone() {
    var map, json, clone;
    map = argument0;
    json = json_encode(map);
    clone = json_decode(json);
    return clone;
}

function ds_map_default_value() {
    var map, key, val;
    map = argument0;
    key = argument1;
    val = argument2;
    if (!ds_map_exists(map, key)) {
        ds_map_add(map, key, val);
        return val;
    } else {
        return ds_map_find_value(map, key);
    }
}

function ds_map_load() {
    var FileIn, MapItems, CurrLine, NumItems, i, TempKey, TempValue;
 
    // Open the file that contains the map
    FileIn = file_text_open_read(argument0);  // Open the Map File
    MapItems = ds_map_create();               // Create the Map to be read into
    CurrLine = "";                            // Default to an empty string
 
    // Read the entire file into a variable
    while (!file_text_eof(FileIn)) {
        CurrLine += file_text_read_string(FileIn);
        // Technically we should not have a return and a comma
        // But just incase lets make sure that we do not add an extra one.
        if (string_char_at(CurrLine,string_length(CurrLine)) != ",") {
            if (argument1 != 0) {
                if (string_char_at(CurrLine,string_length(CurrLine)) != string(argument1)) {
                    CurrLine += ",";
                }
            }else{
                CurrLine += ",";
            }
        }
        file_text_readln(FileIn);
    }
 
    // Remove the final comma
    CurrLine = string_delete(CurrLine,string_length(CurrLine),1);
 
    // Add Support for other separators.
    CurrLine = string_replace_all(CurrLine,";",",");
    if ( argument1 != 0 ) {
        CurrLine = string_replace_all(CurrLine,string(argument1),",");
    }
    CurrLine = string_replace_all(CurrLine,", ",",");
    CurrLine = string_replace_all(CurrLine," ,",",");
 
    // Get the number of items to be placed into the map, if there is an
    // odd number, round up and we will default to 0.
    NumItems = ceil((string_count(",",CurrLine) + 1)/2);
 
    // Read The Values into the Map
    for( i = 0; i < NumItems; i += 1 ) {
        if ( string_count(",",CurrLine) > 1 ) {
            TempKey = string_copy(CurrLine,1,string_pos(",",CurrLine)-1);
            CurrLine = string_delete(CurrLine,1,string_pos(",",CurrLine));
            TempValue = string_copy(CurrLine,1,string_pos(",",CurrLine)-1);
            CurrLine = string_delete(CurrLine,1,string_pos(",",CurrLine));
        }else{
            if ( string_count(",",CurrLine) = 1 ) {
                TempKey = string_copy(CurrLine,1,string_pos(",",CurrLine)-1);
                CurrLine = string_delete(CurrLine,1,string_pos(",",CurrLine));
                TempValue = CurrLine;
                CurrLine = "";
            }else{
                TempKey = CurrLine;
                CurrLine = "";
                TempValue = 0;
            }
        }
        ds_map_add(MapItems,TempKey,TempValue);
    }
    return (MapItems);
}

function ds_map_mirror() {
    var dsid,temp,key,val;
    dsid = argument0;
    temp = ds_map_create();
    key = ds_map_find_first(dsid);
    val = ds_map_find_value(dsid,key);
    ds_map_add(temp,val,key);
    repeat (ds_map_size(dsid)-1) {
        key = ds_map_find_next(dsid,key);
        val = ds_map_find_value(dsid,key);
        ds_map_add(temp,val,key);    
    }
    ds_map_copy(dsid,temp);
    ds_map_destroy(temp);
    return 0;
}

function ds_map_save() {
    var FileOut, NextKey, i;
 
    FileOut = file_text_open_write(argument1);
 
    if ( ds_map_size(argument0) > 0 ) {
        NextKey = ds_map_find_first(argument0);
        file_text_write_string(FileOut,string(NextKey)+", ");
        file_text_write_string(FileOut,string(ds_map_find_value(argument0,NextKey)));
        NextKey = ds_map_find_next(argument0,NextKey);
        // Define the format to use
        switch (argument2) {
            case 0:
                file_text_writeln(FileOut);
                break;
            case 1:
                file_text_write_string(FileOut,",");
                break;
            case 2:
                file_text_write_string(FileOut,";");
                break;
            default:
                file_text_write_string(FileOut,string(argument2));
                break;
        }
 
        if ( ds_map_size(argument0) > 1 ) {
            for ( i = 1; i < ds_map_size(argument0); i += 1 ) {
                file_text_write_string(FileOut,string(NextKey)+", ");
                file_text_write_string(FileOut,string(ds_map_find_value(argument0,NextKey)));
                NextKey = ds_map_find_next(argument0,NextKey);
                // Define the format to use
                switch (argument2) {
                    case 0:
                        file_text_writeln(FileOut);
                        break;
                    case 1:
                        file_text_write_string(FileOut,",");
                        break;
                    case 2:
                         file_text_write_string(FileOut,";");
                         break;
                    default:
                         file_text_write_string(FileOut,string(argument2));
                         break;
                }
            } 
        }
    }
 
    file_text_close(FileOut);
 
    return 0;
}