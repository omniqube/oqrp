function array() {
    var r, i = argument_count;
    while (--i >= 0) r[i] = argument[i];
    return r;
}

function array_add() {
    var r = argument[0];
    var o = array_length_1d(r) - 1;
    var i = argument_count;
    while (--i > 0) r[@o + i] = argument[i];
    return r;
}

function array_sort() {
    var array = argument0;
    var ascend = argument1;
    var list = ds_list_create();
    var count = array_length_1d(array);
    for (var i=0; i<count; i++) list[| i] = array[i];
    ds_list_sort(list, ascend);
    for (i=0; i<count; i++) array[i] = list[| i];
    ds_list_destroy(list);
    return array;
}

function array_explode() {
    var arr;
    var del = argument0;
    var str = argument1 + del;
    var len = string_length(del);
    var ind = 0;
    repeat (string_count(del, str)) {
        var pos = string_pos(del, str) - 1;
        arr[ind] = string_copy(str, 1, pos);
        str = string_delete(str, 1, pos + len);
        ind++;
    }
    return arr;
}

function array_explode_real() {
    var arr;
    var del = argument0;
    var str = argument1 + del;
    var len = string_length(del);
    var ind = 0;
    repeat (string_count(del, str)) {
        var pos = string_pos(del, str) - 1;
        arr[ind] = real(string_copy(str, 1, pos));
        str = string_delete(str, 1, pos + len);
        ind++;
    }
    return arr;
}

function array_implode() {
    var del = argument0;
    var arr = argument1;
    var out = "";
    var ind = 0;
    var num = array_length_1d(arr);
    repeat (num-1) {
        out += arr[ind] + del;
        ind++;
    }
    out += arr[ind];
    return out;
}

function array_implode_real() {
    var del = argument0;
    var arr = argument1;
    var out = "";
    var ind = 0;
    var num = array_length_1d(arr);
    repeat (num-1) {
        out += string(arr[ind]) + del;
        ind++;
    }
    out += string(arr[ind]);
    return out;
}

