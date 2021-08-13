// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vigenere_ascii() {
    var in, key, mode, out;
    in = argument0;
    key = argument1;
    mode = argument2;
    out = "";
    var inLen, keyLen, pos, inChar, keyChar, outChar;
    var inVal, keyVal, outVal, loVal, hiVal, span;
    inLen = string_length(in);
    keyLen = string_length(key);
    loVal = 32;
    hiVal = 126;
    span = (hiVal - loVal) + 1;
    for (pos=0; pos<inLen; pos+=1) {
        inChar = string_char_at(in, pos+1);
        keyChar = string_char_at(key, (pos mod keyLen)+1);
        inVal = min(max(loVal, ord(inChar)), hiVal) - loVal;
        keyVal = min(max(loVal, ord(keyChar)), hiVal) - loVal;
        if (mode) {
            outVal = ((inVal + keyVal) mod span) + loVal;
        }else{
            outVal = ((span + inVal - keyVal) mod span) + loVal;
        }
        outChar = chr(outVal);
        out = out + outChar;
    }
    return out;
}

function vigenere_cipher() {
    var in, key, mode, out;
    in = argument0;
    key = argument1;
    mode = argument2;
    out = "";
    var inLen, keyLen, pos, inChar, keyChar, outChar;
    var inVal, keyVal, outVal;
    inLen = string_length(in);
    keyLen = string_length(key);
    for (pos=0; pos<inLen; pos+=1) {
        inChar = string_char_at(in, pos+1);
        keyChar = string_char_at(key, (pos mod keyLen)+1);
        inVal = ord(inChar);
        keyVal = ord(keyChar);
        if (mode) {
            outVal = (inVal + keyVal) mod 256;
        }else{
            outVal = (256 + inVal - keyVal) mod 256;
        }
        outChar = chr(outVal);
        out = out + outChar;
    }
    return out;
}