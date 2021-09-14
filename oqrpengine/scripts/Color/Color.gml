function color_mix() {
    return (argument0 & $fefefe) + (argument1 & $fefefe) >> 1;
}

function color_multiply() {
    var c1,c2,t;
    c1 = argument0;
    c2 = argument1;
    t = ((c1 & 255) * (c2 & 255)) >> 8;
    c1 = c1 >> 8;
    c2 = c2 >> 8;
    t |= ((c1 & 255) * (c2 & 255)) & 65280;
    c1 = c1 & 65280;
    c2 = c2 >> 8;
    t |= ((c1 * c2) & 16711680);
    return t;
}

function color_scale() {
    var c,v,t;
    c = argument0;
    v = argument1 * 65336;
    t = c & 65280;
    c = c ^ t;
    t *= v;
    t = t >> 24;
    t = t << 8;
    v = v >> 8;
    c *= v;
    c = c >> 8;
    c = c & 16711935;
    return c | t;
}

function color_to_cmyk() {
    var C,M,Y,K,cmyk;
    C = 1 - color_get_red(argument0) / 255;
    M = 1 - color_get_green(argument0) / 255;
    Y = 1 - color_get_blue(argument0) / 255;
    K = min(C,M,Y,1);
    if (K == 1) {
        C = 0;
        M = 0;
        Y = 0;
    }else{
        C = (C - K) / (1 - K);
        M = (M - K) / (1 - K);
        Y = (Y - K) / (1 - K);
    }
    switch (argument1) {
        case "C": return C;
        case "M": return M;
        case "Y": return Y;
        case "K": return K;
    }
    cmyk = ds_list_create();
    ds_list_add(cmyk, C);
    ds_list_add(cmyk, M);
    ds_list_add(cmyk, Y);
    ds_list_add(cmyk, K);
    return cmyk;
}

function color_to_hex() {
    var color,dec;
    color = argument0;
    dec = (color & 16711680) >> 16 | (color & 65280) | (color & 255) << 16;
    return dec_to_hex(dec);
}

function color_to_wavelength() {
    var hue;
    hue = color_get_hue(argument0);
    return (650 - 2.25*hue + 0.0072*hue*hue);
}

function hex_to_color() {
    var hex,dec,col;
    hex = argument0;
    dec = hex_to_dec(hex);
    col = (dec & 16711680) >> 16 | (dec & 65280) | (dec & 255) << 16;
    return col;
}

function hex_to_rgb() {
    var color,rgb;
    color = hex_to_dec(argument0);
    rgb = ds_list_create();
    ds_list_add(rgb, (color & 255));
    ds_list_add(rgb, (color & 65280) >> 8);
    ds_list_add(rgb, (color & 16711680) >> 16);
    return rgb;
}

function make_color_random() {
    return floor(random(16777216));
}

function merge_color_squared() {
    var amount = clamp(argument2, 0, 1);
 
    var r = sqrt(lerp(sqr(color_get_red(argument0)),
                      sqr(color_get_red(argument1)),
                      amount));
 
    var g = sqrt(lerp(sqr(color_get_green(argument0)),
                      sqr(color_get_green(argument1)),
                      amount));
 
    var b = sqrt(lerp(sqr(color_get_blue(argument0)),
                      sqr(color_get_blue(argument1)),
                      amount));
 
    return make_color_rgb(r,g,b);
}

function merge_colors() {
    var colors = argument_count-1;
    var amount = clamp(argument[colors], 0, 1);
    var n = amount * (colors-1);
    var col1 = floor(n);
    var col2 = col1 + 1;
    return merge_color(argument[col1], argument[col2], frac(n));
}

function rgb_to_cmyk() {
    var C,M,Y,K,cmyk;
    C = 1 - argument0 / 255;
    M = 1 - argument1 / 255;
    Y = 1 - argument2 / 255;
    K = min(C,M,Y,1);
    if (K == 1) {
        C = 0;
        M = 0;
        Y = 0;
    }else{
        C = (C - K) / (1 - K);
        M = (M - K) / (1 - K);
        Y = (Y - K) / (1 - K);
    }
    switch (argument3) {
        case "C": return C;
        case "M": return M;
        case "Y": return Y;
        case "K": return K;
    }
    cmyk = ds_list_create();
    ds_list_add(cmyk, C);
    ds_list_add(cmyk, M);
    ds_list_add(cmyk, Y);
    ds_list_add(cmyk, K);
    return cmyk;
}

function rgb_to_hex() {
    var r,g,b;
    r = argument0 & 255;
    g = argument1 & 255;
    b = argument2 & 255;
    return dec_to_hex(r << 16 | g << 8 | b);
}

function wavelength_to_hue() {
    return (sqrt((argument0 - 650) / 0.0072) + 156.75);
}