function array() {
    var r, i = argument_count;
    while (--i >= 0) r[i] = argument[i];
    return r;
}

function array_add() {
    var r = argument[0];
    var o = array_length(r) - 1;
    var i = argument_count;
    while (--i > 0) r[@o + i] = argument[i];
    return r;
}

function array_sort() {
    var arra = argument0;
    var ascend = argument1;
    var list = ds_list_create();
    var count = array_length(arra);
    for (var i=0; i<count; i++) list[| i] = array[i];
    ds_list_sort(list, ascend);
    for (i=0; i<count; i++) array[i] = list[| i];
    ds_list_destroy(list);
    return arra;
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
    var num = array_length(arr);
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
    var num = array_length(arr);
    repeat (num-1) {
        out += string(arr[ind]) + del;
        ind++;
    }
    out += string(arr[ind]);
    return out;
}

function array_select_relative(current, delta, choices) {
    var size = array_length(choices);
    var list = ds_list_create();
    var result = undefined;
    for (var i = 0; i < size; i++) ds_list_add(list, choices[i]);
    i = ds_list_find_index(list, current);
    if (i >= 0) {
        i = clamp(i + delta, 0, size - 1);
        var result = ds_list_find_value(list, i);
    }
    ds_list_destroy(list);
    return result;
}

function array_select_relative_wrap(current, delta, choices) {
    var size = array_length(choices);
    var list = ds_list_create();
    var result = undefined;
    for (var i = 0; i < size; i++) ds_list_add(list, choices[i]);
    i = ds_list_find_index(list, current);
    if (i >= 0) {
        i = (((i + delta) mod size) + size) mod size;
        result = ds_list_find_value(list, i);
    }
    ds_list_destroy(list);
    return result;
}
