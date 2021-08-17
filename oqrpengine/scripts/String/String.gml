function string_add_spaces() {
//  Returns the given string with spaces inserted between each character.
	var str, len;
    str = argument0;
    len = string_length(str);
    for (j=len; j>0; j-=1) {str = string_insert(" ", str, j);}
    return str;
}

function string_escape() {
//  Returns the given string with all escape sequences parsed.
	var str,out,pos,tmp,ref,val;
    str = argument0;
    out = "";
    ref = "0123456789abcdef";
    while (str != "") {
        pos = string_pos("\\",str);
        out += string_copy(str,1,pos-1);
        str = string_delete(str,1,pos);
        if (pos > 0) {
            tmp = string_copy(str,1,1);
            str = string_delete(str,1,1);
        }
        else {
            out += str;
            str = "";
            tmp = "";
        }
        switch (tmp) {
            case "\\":
            out += "\\";
            break;
            case "r":
            out += chr(13);
            break;
            case "n":
            out += chr(10);
            break;
            case "t":
            out += chr(9);
            break;
            case "x":
            val = string_pos(string_copy(str,2,1),ref)-1;
            if (val < 0) {
                break;
            }
            val += 16*(string_pos(string_copy(str,1,1),ref)-1);
            if (val >= 0) {
                out += chr(val);
                str = string_delete(str,1,2);
            }
            break;
            case "0":
            case "1":
            case "2":
            case "3":
            if (string_copy(str,1,2) == string_digits(string_copy(str,1,2))) {
                val = 64 * (string_pos(tmp,ref)-1);
                val += 8 * (string_pos(string_copy(str,1,1),ref)-1);
                val += string_pos(string_copy(str,2,1),ref)-1;
                out += chr(val)
                str = string_delete(str,1,2);
            }
            else if (tmp == "0") {
                out += chr(0);
            }
            break;
        }
    }
    return out;

//      Escape Sequence  |  Meaning
//      -----------------+--------------------------------
//      \\               |  Literal backslash
//      \n               |  ASCII linefeed (LF)
//      \r               |  ASCII carriage return (CR)
//      \t               |  ASCII horizontal tab (TAB)
//      \0               |  ASCII null character (NUL)
//      \ooo             |  Character with octal value ooo
//      \xhh             |  Character with hex value hh
}

function string_extract() {
//  Returns the element at the given index within a string of elements.
//  eg. string_extract("cat,dog,mouse", "," ,1) == "dog"
	var str,sep,ind,len;
    str = argument0;
    sep = argument1;
    ind = argument2;
    len = string_length(sep)-1;
    repeat (ind) str = string_delete(str,1,string_pos(sep,str)+len);
    str = string_delete(str,string_pos(sep,str),string_length(str));
    return str;
}

function string_left() {
//  Returns a number of characters from the start of a string.
//  If the number of characters given is negative,
//  the string will be shortened by that amount.
    if (argument1 < 0)
        return string_copy(argument0, 1, string_length(argument0) + argument1);
    else
        return string_copy(argument0, 1, argument1);	
}

function string_limit() {
//  Returns a given string, truncated if it exceeds a certain length.
//  If truncated, an extension (such as an ellipsis) can be appended.
    var str,ext,wid;
    str = argument0;
    ext = argument2;
    wid = max(argument1, string_length(ext));
    if (string_length(str) <= wid) return str;
    while (string_length(str + ext) > wid) {
        str = string_delete(str, string_length(str), 1);
    } 
    return str + ext;
}

function string_lpad() {
//  Returns a string padded to a certain length 
//  by inserting another string to its left.
//  eg. string_lpad("1234", 7, "0") == "0001234"
    var str,len,pad,padsize,padding,out;
    str = argument0;
    len = argument1;
    pad = argument2;
    padsize = string_length(pad);
    padding = max(0,len - string_length(str));
    out  = string_repeat(pad,padding div padsize);
    out += string_copy(pad,1,padding mod padsize);
    out += str;
    out  = string_copy(out,1,len);
    return out;
}

function string_ltrim() {
//  Returns the given string with whitespace stripped from its start.
//  Whitespace is defined as SPACE, HT, LF, VT, FF, CR.
    var str,l,r,o;
    str = argument0;
    l = 1;
    r = string_length(str);
    repeat (r) {
        o = ord(string_char_at(str,l));
        if ((o > 8) && (o < 14) || (o == 32)) l += 1;
        else break;
    }
    return string_copy(str,l,r-l+1);
}

function string_nato() {
//  Returns a given string as expressed by the NATO phonetic alphabet.
//  Phonetic words will be separarted by spaces. Non-alphanumeric 
//  characters are removed.
    var in = string_upper(argument0);
    var len = string_length(in);
    var out = "";
 
    var nato = ds_map_create();
    nato[? "A"] = "Alfa";     nato[? "B"] = "Bravo";     nato[? "C"] = "Charlie";
    nato[? "D"] = "Delta";    nato[? "E"] = "Echo";      nato[? "F"] = "Foxtrot";
    nato[? "G"] = "Golf";     nato[? "H"] = "Hotel";     nato[? "I"] = "India";
    nato[? "J"] = "Juliett";  nato[? "K"] = "Kilo";      nato[? "L"] = "Lima";
    nato[? "M"] = "Mike";     nato[? "N"] = "November";  nato[? "O"] = "Oscar";
    nato[? "P"] = "Papa";     nato[? "Q"] = "Quebec";    nato[? "R"] = "Romeo";
    nato[? "S"] = "Sierra";   nato[? "T"] = "Tango";     nato[? "U"] = "Uniform";
    nato[? "V"] = "Victor";   nato[? "W"] = "Whiskey";   nato[? "X"] = "X-ray";
    nato[? "Y"] = "Yankee";   nato[? "Z"] = "Zulu";      nato[? "0"] = "Zero";
    nato[? "1"] = "One";      nato[? "2"] = "Two";       nato[? "3"] = "Three";
    nato[? "4"] = "Four";     nato[? "5"] = "Five";      nato[? "6"] = "Six";
    nato[? "7"] = "Seven";    nato[? "8"] = "Eight";     nato[? "9"] = "Niner";
 
    for (var i=1; i<len; i++) {
        var c = string_char_at(in ,i);
        if (!ds_map_exists(nato, c)) continue;
        if (i > 1) out += " ";
        out += nato[? c];
    }
 
    ds_map_destroy(nato);
    return out;
}

function string_parse() {
//  Returns a ds_list containing all substring elements within
//  a given string which are separated by a given token.
//  eg. string_parse("cat|dog|house|bee", "|", true)
//      returns a ds_list { "cat", "dog", "house", "bee" }
    var str,token,ignore,list,tlen,temp;
    str = argument0;
    token = argument1;
    ignore = argument2;
    list = ds_list_create();
    tlen = string_length( token);
    while (string_length(str) != 0) {
        temp = string_pos(token,str);
        if (temp) {
            if (temp != 1 || !ignore) ds_list_add(list,string_copy(str,1,temp-1));
            str = string_copy(str,temp+tlen,string_length(str));
        } else {
            ds_list_add(list,str);
            str = "";
        }
    }
    return list;
}

function string_parse_number() {
//  Returns the number of substring elements within
//  a given string and separated by a given token.
//  eg. string_parse("cat|dog|house|bee", "|", true) == 4
    var str,substr,token,ignore,tlen,temp,i;
    str = argument0;
    token = argument1;
    ignore = argument2;
    tlen = string_length(token);
    substr = "";
    i = 0;
    while (string_length(str) != 0) {
        temp = string_pos(token,str);
        if (temp) {
            if (temp != 1 || !ignore) {
                substr = string_copy(str,1,temp-1);
                i += 1;
            }
            str = string_copy(str,temp+tlen,string_length(str));
        } else {
            substr = str;
            i += 1;
            str = "";
        }
    }
    return i;
}

function string_parse_single() {
//  Returns the nth substring from a string of elements separated by
//  a given token, or the separator token if an error occurred.
//  eg. string_parse_single("cat|dog|house|bee", "|", 2, true) == "dog"
    var str, token, substr, ignore, N, tlen, temp, i;
 
    str = argument0;
    token = argument1;
    N = argument2;
    ignore = argument3;
 
    tlen = string_length( token);
 
    substr = "";
    i = 0;
    while( string_length( str) != 0 && i < N) {
        temp = string_pos( token, str);
        if( temp) {
            if( temp != 1 || !ignore) {
                substr = string_copy(str, 1, temp - 1);
                i += 1;
            }
            str = string_copy( str, temp + tlen, string_length( str));
        }
        else {
            substr = str;
            i += 1;
            str = "";
        }
    }
 
    if( i != N)
        return "";
    else
        return substr;
}

function string_random() {
//  Returns a string of a given length composed of characters 
//  randomly selected from a given set. If the set is empty, 
//  all 256 possible characters will be used.
    var str,cnt,out,len;
    str = argument0;
    cnt = argument1;
    out = "";
    len = string_length(str);
    if (len > 0) {
        repeat (cnt) out += string_char_at(str,floor(random(len))+1);
    } else {
        repeat (cnt) out += chr(floor(random(256)));
    }
    return out;
}

function string_remove_whitespace() {
//  Consolidates and removes all whitespace from a string,
//  optionally replacing it with a character or string.
//  Whitespace is defined as SPACE, HT, LF, VT, FF, CR.
    var str, sub="", wsp, len, i, o, out="";
 
    str = argument[0];
    if (argument_count > 1) sub = argument[1];
 
    wsp = false;
    len = string_length(str);
 
    for (i=1; i<=len; i+=1) 
    {
        o = string_ord_at(str, i);
        if ((o > 8) && (o < 14) || (o == 32)) 
        {
            wsp = true;
            continue;
        }
        if (wsp) 
        {
            out += sub;
            wsp = false;
        }
        out += chr(o);
    }
    if (wsp) out += sub;
 
    return out;
}

function string_reverse() {
//  Returns a given string with the characters in reverse order.
    var out,i;
    out = "";
    for(i=string_length(argument0); i>0; i-=1) {
        out += string_char_at(argument0,i);
    }
    return out;
}

function string_right() {
//  Returns a number of characters from the end of a string.
//  If the number of characters given is negative,
//  the string will be shortened by that amount.
    if (argument1 < 0)
        return string_copy(argument0, 1 - argument1, string_length(argument0) + argument1);
    else
        return string_copy(argument0, 1 + string_length(argument0) - argument1, argument1);
}

function string_rpad() {
//  Returns a string padded to a certain length 
//  by adding another string to its right.
//  eg. string_rpad("1234", 7, "0") == "1234000"
    var str,len,pad,padsize,padding,out;
    str = argument0;
    len = argument1;
    pad = argument2;
    padsize = string_length(pad);
    padding = max(0,len - string_length(str));
    out  = str;
    out += string_repeat(pad,padding div padsize);
    out += string_copy(pad,1,padding mod padsize);
    out  = string_copy(out,1,len);
    return out;
}

function string_rpos() {
//  Returns the right-most position of a substring within a string.
    var sub,str,pos,ind;
    sub = argument0;
    str = argument1;
    pos = 0;
    ind = 0;
    do {
        pos += ind;
        ind = string_pos(sub,str);
        str = string_delete(str,1,ind);
    } until (ind == 0);
    return pos;
}

function string_rtrim() {
//  Returns the given string with whitespace stripped from its end.
//  Whitespace is defined as SPACE, HT, LF, VT, FF, CR.
    var str,r,o;
    str = argument0;
    r = string_length(str);
    repeat (r) {
        o = ord(string_char_at(str,r));
        if ((o > 8) && (o < 14) || (o == 32)) r -= 1;
        else break;
    }
    return string_copy(str,1,r);
}

function string_shuffle() {
//  Returns a given string with charactars shuffled.
    var str,out,len,i;
    str = argument0;
    out = "";
    do {
        len = string_length(str);
        i = floor(random(len))+1;
        out += string_char_at(str,i);
        str = string_delete(str,i,1);
    } until (len <= 1);
    return out;
}

function string_split() {
//  Returns a string with break characters inserted at a given interval.
    var str,num,brk,len,i;
    str = argument0;
    num = argument1;
    brk = argument2;
    if (num < 1) num = 76;
    if (is_real(brk)) brk = "#";
    len = string_length(str);
    for (i=len-((len-1) mod num); i>num; i-=num) {
        str = string_insert(brk,str,i);
    }
    return str;
}

function string_stagger_case() {
//  Returns a string with the letters in staggered case,
//  such as: "hElLo! hOw ArE yOu ToDaY?"
    var n,iii,len,old,j;
    n = argument0;
    iii = argument2;
    len = string_length(n);
    old = ""; 
    for (j=1; j<=len; j+=1) {
        if (string_char_at(n,j) == " " && argument1 == false) continue;
        if (iii) old = string_upper(string_char_at(n,j)); 
        else     old = string_lower(string_char_at(n,j)); 
        n = string_delete(n,j,1); 
        n = string_insert(old,n,j); 
        iii = !iii;
    }
    return n;
}

function string_trim() {
//  Returns the given string with whitespace stripped from its start 
//  and end. Whitespace is defined as SPACE, HT, LF, VT, FF, CR.
    var str,l,r,o;
    str = argument0;
    l = 1;
    r = string_length(str);
    repeat (r) {
        o = ord(string_char_at(str,l));
        if ((o > 8) && (o < 14) || (o == 32)) l += 1;
        else break;
    }
    repeat (r-l) {
        o = ord(string_char_at(str,r));
        if ((o > 8) && (o < 14) || (o == 32)) r -= 1;
        else break;
    }
    return string_copy(str,l,r-l+1);
}

function string_ucfirst() {
//  Returns a string with the first character capitalized.
    var str,out;
    str = argument0;
    out = string_upper(string_char_at(str,1));
    out += string_copy(str,2,string_length(str)-1);
    return out;
}

function string_ucwords() {
//  Returns a string with each word capitalized.
    var str,out,w,i,c,o;
    str = argument0;
    out = "";
    w = true;
    i = 1;
    repeat (string_length(str)) {
        c = string_char_at(str,i);
        o = ord(c);
        if ((o > 8) && (o < 14) || (o == 32)) {
            w = true;
        }else{
            if (w == true) c = string_upper(c);
            w = false;
        }
        out += c;
        i += 1;
    }
    return out;
}

function string_wordwrap() {
//  Returns a string with break characters inserted 
//  between words at a given character interval.
    var str,num,brk,cut,out,i,j;
    str = argument0;
    num = argument1;
    brk = argument2;
    cut = argument3;
    out = "";
    while (string_length(str)) {
        while (string_pos(brk,str) <= num + 1) && (string_pos(brk,str) > 0) {
            out += string_copy(str,1,string_pos(brk,str)+string_length(brk));
            str = string_delete(str,1,string_pos(brk,str)+string_length(brk));
        }
        i = string_length(str) + 1;
        if (i > num + 1) {
            for (i = num + 1; i > 0; i -= 1) {
                if (string_char_at(str,i) == " ") break;
            }
        }
        if (i == 0) {
            if (cut) {
                j = num;
                i = j;
            } else {
                i = string_pos(" ",str);
                if (i == 0) {
                    j = string_length(str);
                    i = j;
                } else {
                    j = i;
                    i -= 1;
                }
            }
        } else {
            j = i;
            i -= 1;
        }
        out += string_copy(str,1,i) + brk;
        str = string_delete(str,1,j);
    }
    out = string_copy(out,1,string_length(out) - string_length(brk));
    return out;
}