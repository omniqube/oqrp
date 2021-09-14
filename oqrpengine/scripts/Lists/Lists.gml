function ds_list_add_list() {
    var parent, list, pos;
    parent = argument0;
    list = argument1;
    pos = ds_list_size(parent);
    ds_list_add(parent, list);
    ds_list_mark_as_list(parent, pos);
}

function ds_list_add_map() {
    var parent, map, pos;
    parent = argument0;
    map = argument1;
    pos = ds_list_size(parent);
    ds_list_add(parent, map);
    ds_list_mark_as_map(parent, pos);
}

function ds_list_cv() {
    var n, avg, sum, i;
    n = ds_list_size(argument0);
    avg = 0;
    sum = 0;
 
    for (i=0; i<n; i+=1) avg += ds_list_find_value(argument0, i);
    avg /= n;
    for (i=0; i<n; i+=1) sum += sqr(ds_list_find_value(argument0, i) - avg);
 
    return sqrt(sum/(n - argument1))/avg;
}

function ds_list_flip() {
    var dsid,i;
    dsid = argument0; 
    for(i=ds_list_size(dsid);i>=0;i-=1) {
        ds_list_add(dsid,ds_list_find_value(dsid,i));
        ds_list_delete(dsid,i);
    }
}

function ds_list_geometric_mean() {
    var n, geo, i;
    n = ds_list_size(argument0);
    geo = 1;
 
    for (i=0; i<n; i+=1) geo *= ds_list_find_value(argument0, i);
 
    return power(geo, 1/n);
}

function ds_list_load() {
    var dsid,filename,sep,fid,dat,len,ind,pos;
    filename = argument0;
    if (is_string(argument1)) sep = argument1; else sep = chr(13)+chr(10);
    fid = file_text_open_read(filename);
    if (fid > 0) {
        dat = "";
        while (!file_text_eof(fid)) {
            dat += file_text_read_string(fid);
            file_text_readln(fid);
        }
        dat += sep;
        len = string_length(sep);
        ind = 0;
        dsid = ds_list_create();
        repeat (string_count(sep,dat)) {
            pos = string_pos(sep,dat)-1;
            ds_list_add(dsid,string_copy(dat,1,pos));
            dat = string_delete(dat,1,pos+len);
            ind += 1;
        }
        file_text_close(fid);
        return dsid;
    }else{
        return -1;
    }
}

function ds_list_max() {
    var n, maxv, i, val;
    n = ds_list_size(argument0);
    maxv = ds_list_find_value(argument0, 0);
 
    for (i=1; i<n; i+=1) {
        val = ds_list_find_value(argument0, i);
        if (val > maxv)
        maxv = val;
    }
 
    return maxv;
}

function ds_list_mean() {
    var i,j,k;
    j = 0;
    k = ds_list_size(argument0);
    for (i=0; i<k; i+=1) j += ds_list_find_value(argument0, i);
    return (j / k);
}

function ds_list_median() {
    var i,j,k;
    j = ds_list_create();
    k = ds_list_size(argument0);
    for (i=0; i<k; i+=1) ds_list_add(j, ds_list_find_value(argument0, i));
    ds_list_sort(j, true);
    i = ds_list_find_value(j,k div 2);
    ds_list_destroy(j);
    return i;
}

function ds_list_min() {
    var n, minv, i, val;
    n = ds_list_size(argument0);
    minv = ds_list_find_value(argument0, 0);
 
    for (i=1; i<n; i+=1) {
        val = ds_list_find_value(argument0, i);
        if (val < minv)
        minv = val;
    }
 
    return minv;
}

function ds_list_pop_standard_deviation() {
    var i,j,k,m;
    j = 0;
    k = ds_list_size(argument0);
    for (i=0; i<k; i+=1) j += ds_list_find_value(argument0, i);
    m = j / k;
    j = 0;
    for (i=0; i<k; i+=1) j += sqr(ds_list_find_value(argument0, i) - m);
    return sqrt(j / k);
}

function ds_list_range() {
    var n, maxv, minv, i, val;
    n = ds_list_size(argument0);
    maxv = ds_list_find_value(argument0, 0);
    minv = maxv;
 
    for (i=1; i<n; i+=1) {
        val = ds_list_find_value(argument0, i);
        if (val > maxv)
        maxv = val;
        else if (val < minv)
        minv = val;
    }
 
    return (maxv - minv);
}

function ds_list_save() {
    var dsid,filename,sep,fid,i;
    dsid = argument0;
    filename = argument1;
    if (is_string(argument2)) sep = argument2; else sep = chr(13)+chr(10);
    fid = file_text_open_write(filename);
    if (fid > 0) {
        for(i=0; i<ds_list_size(argument0); i+=1) {
            if (i != 0) file_text_write_string(fid,sep);
            file_text_write_string(fid,string(ds_list_find_value(dsid,i)));
        }
        file_text_close(fid);
        return 0;
    }else{
        return -1;
    }
}

function ds_list_select_relative() {
    var current = argument[0];
    var delta = argument[1];
    var choices = argument[2];
    var size = ds_list_size(choices);
    i = ds_list_find_index(choices, current);
    if (i < 0) return undefined;
    i = clamp (i + delta, 0, size - 1);
    var result = ds_list_find_value(choices, i);
    return result;
}

function ds_list_select_relative_wrap() {
    var current = argument[0];
    var delta = argument[1];
    var choices = argument[2];
    var size = ds_list_size(choices);
    i = ds_list_find_index(choices, current);
    if (i < 0) return undefined;
    i = (((i + delta) mod size) + size) mod size;
    var result = ds_list_find_value(choices, i);
    return result;
}

function ds_list_standard_deviation() {
    var n, avg, sum, i;
    n = ds_list_size(argument0);
    avg = 0;
    sum = 0;
 
    for (i=0; i<n; i+=1) avg += ds_list_find_value(argument0, i);
    avg /= n;
    for (i=0; i<n; i+=1) sum += sqr(ds_list_find_value(argument0, i) - avg);
 
    return sqrt(sum/(n - argument1));
}

function ds_list_standard_score() {
    var n, avg, sum, i;
    n = ds_list_size(argument0);
    avg = 0;
    sum = 0;
 
    for (i=0; i<n; i+=1) avg += ds_list_find_value(argument0, i);
    avg /= n;
    for (i=0; i<n; i+=1) sum += sqr(ds_list_find_value(argument0, i) - avg);
 
    return (ds_list_find_value(argument0, argument1) - avg)/sqrt(sum/n);
}

function ds_list_sum() {
    var i,j,k;
    j = 0;
    k = ds_list_size(argument0);
    for (i=0; i<k; i+=1) j += ds_list_find_value(argument0, i);
    return j;
}

function ds_list_sum_squares() {
    var i,j,k;
    j = 0;
    k = ds_list_size(argument0);
    for (i=0; i<k; i+=1) j += sqr(ds_list_find_value(argument0, i));
    return j;
}

function ds_list_variance() {
    var n, avg, sum, i;
    n = ds_list_size(argument0);
    avg = 0;
    sum = 0;
 
    for (i=0; i<n; i+=1) avg += ds_list_find_value(argument0, i);
    avg /= n;
    for (i=0; i<n; i+=1) sum += sqr(ds_list_find_value(argument0, i) - avg);
 
    return sum/(n - argument1);
}

function ds_list_vmr() {
    var n, avg, sum, i;
    n = ds_list_size(argument0);
    avg = 0;
    sum = 0;
 
    for (i=0; i<n; i+=1) avg += ds_list_find_value(argument0, i);
    avg /= n;
    for (i=0; i<n; i+=1) sum += sqr(ds_list_find_value(argument0, i) - avg);
 
    return sum/(n - argument1)/avg;
}
