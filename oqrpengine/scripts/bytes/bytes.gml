// B64 RFC 3548

function b64_to_bytes() {
    var b64, len, pad, tab, str, i, bin;
    b64 = argument0;
    len = string_length(b64);
    pad = "=";
    tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    str = "";
    while (string_length(b64) mod 4) b64 += pad;
    for(i=0; i<len; i+=4) {
        bin[0] = string_pos(string_char_at(b64,i+1),tab)-1;
        bin[1] = string_pos(string_char_at(b64,i+2),tab)-1;
        bin[2] = string_pos(string_char_at(b64,i+3),tab)-1;
        bin[3] = string_pos(string_char_at(b64,i+4),tab)-1;
        str += chr(255&(bin[0]<<2)|(bin[1]>>4));
        if (bin[2] >= 0) str += chr(255&(bin[1]<<4)|(bin[2]>>2));
        if (bin[3] >= 0) str += chr(255&(bin[2]<<6)|(bin[3]));
    }
    return str;
}

function bytes_to_b64() {
    var str, len, pad, tab, b64, i, bin;
    str = argument0;
    len = string_length(str);
    pad = "=";
    tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    b64 = "";
    for (i=0; i<len; i+=3) {
        bin[0] = ord(string_char_at(str,i+1));
        bin[1] = ord(string_char_at(str,i+2));
        bin[2] = ord(string_char_at(str,i+3));
        b64 += string_char_at(tab,1+(bin[0]>>2));
        b64 += string_char_at(tab,1+(((bin[0]&3)<<4)|(bin[1]>>4)));
        if (i+1 >= len) b64 += pad;
        else b64 += string_char_at(tab,1+(((bin[1]&15)<<2)|(bin[2]>>6)));
        if (i+2 >= len) b64 += pad;
        else b64 += string_char_at(tab,1+(bin[2]&63));
    }
    return b64;
}

function bin_to_bytes() { // WARNING: STRING NULL TERMINATED
    var bin, str, p, byte;
    bin = argument0;
    str = "";
    p = string_length(bin);
    repeat (ceil(p / 8)) {
        byte = 0;
        repeat (8) {
            byte = byte >> 1;
            if (p) if (string_char_at(bin, p) == "1") byte = byte | 128;
            p -= 1;
        }
        str = chr(byte) + str;
    }
    return str;
}

function bytes_to_bin() {
    var str, bin, p, byte;
    str = argument0;
    bin = "";
    p = string_length(str);
    repeat (p) {
        byte = ord(string_char_at(str,p));
        repeat (8) {
            if (byte & 1) bin = "1" + bin else bin = "0" + bin;
            byte = byte >> 1;
        }
        p -= 1;
    }
    return bin;
}

function bytes_to_hex() {
    var str, hex, h, l, p, byte;
    str = argument0;
    hex = "";
    h = "0123456789ABCDEF";
    l = string_length(str);
    for (p=1; p<=l; p+=1) {
        byte = ord(string_copy(str, p, 1));
        hex += string_copy(h,byte div 16 + 1, 1);
        hex += string_copy(h,byte mod 16 + 1, 1);
    }
    return hex;
}

function hex_to_bytes() {
    var hex, str, h, l, p, hi, lo;
    hex = string_upper(argument0);
    str = "";
    h = "0123456789ABCDEF";
    l = string_length(hex);
    if (l mod 2) hex = "0" + hex;
    for (p=1; p<=l; p+=2) {
        hi = string_pos(string_char_at(hex, p) ,h) - 1;
        lo = string_pos(string_char_at(hex, p+1) ,h) - 1;
        str += chr(hi << 4 | lo);
    }
    return str;
}

function word_max_value() {
    return (1 << (argument0 * argument1)) - 1;
}

function value_min_bits() {
    return ceil(floor(logn(2, argument0) + 1) / argument1);
}


