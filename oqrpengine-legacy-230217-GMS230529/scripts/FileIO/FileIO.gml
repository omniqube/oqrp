function file_bin_read_word() {
    var file,size,bigend,value,i,b;
    file = argument0;
    size = argument1;
    bigend = argument2;
    value = 0;
    for (i=0; i<size; i+=1) {
        b[i] = file_bin_read_byte(file);
    }
    if (bigend) for (i=0; i<size; i+=1) value = value << 8 | b[i];
    else for (i=size-1; i>=0; i-=1) value = value << 8 | b[i];
    return value;
}

function file_bin_seek_relative() {
    var file,offset;
    file = argument0;
    offset = argument1;
    file_bin_seek(file,file_bin_position(file)+offset);
    return 0;
}

function file_bin_write_word() {
    var file,size,bigend,value,i,b;
    file = argument0;
    size = argument1;
    bigend = argument2;
    value = argument3;
    for (i=0; i<size; i+=1) {
        b[i] = value & 255;
        value = value >> 8;
    }
    if (bigend) for (i=size-1; i>=0; i-=1) file_bin_write_byte(file,b[i]);
    else for (i=0; i<size; i+=1) file_bin_write_byte(file,b[i]);
    return 0;
}

function file_text_open_read_all() {
    var file = file_text_open_read(argument0);
    if (file < 0) return undefined;
    var delim = "#";
    var str = "";
    while (!file_text_eof(file)) {
        str += file_text_read_string(file);
        str += delim;
        file_text_readln(file);
    }
    file_text_close(file);
    return str;
}

function file_text_open_write_all() {
    var file = file_text_open_write(argument0);
    if (file < 0) return false;
    var str = argument1;
    while (string_length(str) > 0)
    {
        var i = string_pos("#", str);
        if (i > 0)
        {
            file_text_write_string(file,string_copy(str, 1, i-1));
            file_text_writeln(file);
            str = string_delete(str, 1, i);
        }
        else
        {
            file_text_write_string(file, str);
            str = "";
        }
    }
    file_text_close(file);
    return true;
}