function bin_to_dec(bin)
{
    var dec = 0;
 
    var len = string_length(bin);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 1;
        if (string_char_at(bin, pos) == "1") dec |= 1;
    }
 
    return dec;
}

function bin_to_fraction(bin)
{
    var fraction = 0;
 
    var i = 0;
    repeat (string_length(bin)) {
        if (string_char_at(bin, i+1) == "1") fraction += (1 / (2 << i));
        i++;
    } 
 
    return fraction;
}

function bin_to_hex(bin)
{
    var hex = "";
 
    var nib = "0000101100111101000";
    var dig = "0125B6C937FEDA48";
    var len = string_length(bin);
    bin = string_repeat("0", -len & 3) + bin;
    for (var pos=1; pos<=len; pos+=4) {
        hex += string_char_at(dig, string_pos(string_copy(bin, pos, 4), nib));
    }
 
    return hex;
}

function dec_to_bin(dec, len)
{
    len = is_undefined(len) ? 1 : len;
    var bin = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(2, 2*abs(dec))));
    }
 
    while (len-- || dec) {
        bin = ((dec & 1) ? "1" : "0") + bin;
        dec = dec >> 1;
    }
 
    return bin;
}

function dec_to_hex(dec, len)
{
    len = is_undefined(len) ? 1 : len;
    var hex = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(16, 2*abs(dec))));
    }
 
    var dig = "0123456789ABCDEF";
    while (len-- || dec) {
        hex = string_char_at(dig, (dec & $F) + 1) + hex;
        dec = dec >> 4;
    }
 
    return hex;
}

function dec_to_oct(dec, len)
{
    len = is_undefined(len) ? 1 : len;
    var oct = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(8, 2*abs(dec))));
    }
 
    var dig = "01234567";
    while (len-- || dec) {
        oct = string_char_at(dig, (dec & $7) + 1) + oct;
        dec = dec >> 3;
    }
 
    return oct;
}

function dec_to_roman(num)
{
    if ((num < 1) || (num > 4999)) return "";
 
    var roman;
    roman  = string_copy("    M   MM  MMM MMMM", 4*(num div 1000)+1, 4);
    roman += string_copy("    C   CC  CCC CD  D   DC  DCC DCCCCM  ", 4*((num mod 1000) div 100)+1, 4);
    roman += string_copy("    X   XX  XXX XL  L   LX  LXX LXXXXC  ", 4*((num mod 100) div 10)+1, 4);
    roman += string_copy("    I   II  III IV  V   VI  VII VIIIIX  ", 4*(num mod 10)+1, 4);
    roman  = string_replace_all(roman, " ", "");
 
    return roman;
}

function fraction_to_bin(fraction, length)
{
    var bin = "";
 
    var i = 1;
    repeat (length) {
        i /= 2;
        if (fraction >= i) {
            fraction -= i;
            bin += "1";
        } else {
            bin += "0";
        }
    }
    return bin;
}

function hex_to_bin(hex)
{
    hex = string_upper(hex);
    var bin = "";
 
    var nib = "0000101100111101000";
    var dig = "0125B6C937FEDA48";
    var len = string_length(hex);
    for (var pos=1; pos<=len; pos+=1) {
        bin += string_copy(nib, string_pos(string_char_at(hex, pos), dig), 4);
    }
    return bin;
}

function hex_to_dec(hex)
{
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
 
    return dec;
}

function oct_to_dec(oct)
{
    var dec = 0;
 
    var dig = "01234567";
    var len = string_length(oct);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 3 | (string_pos(string_char_at(oct, pos), dig) - 1);
    }
 
    return dec;
}

function roman_to_dec(roman)
{
    var dec = 0;
 
    var tab, val;
    tab = "MDCLXVI";
    val[0] = 0;   val[1] = 1000;  val[2] = 500;  val[3] = 100;
    val[4] = 50;  val[5] = 10;    val[6] = 5;    val[7] = 1;
 
    var v1, v2;
    v2 = val[string_pos(string_char_at(roman, 1), tab)];
    for (var i=1; i<=string_length(roman); i++) {
        v1 = v2;
        v2 = val[string_pos(string_char_at(roman, i+1), tab)];
        if (v2 <= v1) dec += v1; else dec -= v1;
    }
 
    return dec;
}