function cambridge_encode() {
    var str, len, num, pos, wordList, i, out, word, c;
    str = argument0;
    len = string_length(str);
    num = 0;
    pos = 0;
    if (len > 2) {
        wordList = ds_list_create();
        // Explode the string to the list
        repeat (string_count(" ",str)) {
            pos = string_pos(" ",str);
            ds_list_add(wordList,string_letters(string_copy(str,1,pos-1)));
            str = string_delete(str,1,pos);
        }
        // Scramble each word
        ds_list_add(wordList,string_letters(str));
        for (i=0; i<ds_list_size(wordList); i+=1) {
            out = "";
            word = ds_list_find_value(wordList,i);
            out += string_char_at(word,1);
            word = string_delete(word,1,1);
            for(c=0; c<string_length(word)-1; c+=1) {
                num = ceil(random(string_length(word)-1));
                out += string_char_at(word,num);
                word = string_delete(word,num,1);
            }
            out += word;
            ds_list_replace(wordList,i,out);
        }
        str = "";
        for (i=0; i<ds_list_size(wordList); i+=1) {
            str += ds_list_find_value(wordList,i);
            str += " ";
        }
        ds_list_destroy(wordList);
    }
    // Add Punctuation
    word = argument0;
    for (i=0; i<len+1; i+=1) {
        c = string_char_at(word,i);
        if (string_count(c,string_letters(word)) == 0 && c != " ") {
            str = string_insert(c,str,i);
        }
     }
     return (str);
}

function rc4() {
var str,key,str_len,key_len,out,s,k,i,j,pos,temp;

str = argument0;
key = argument1;
out = "";

str_len = string_byte_length(str);
key_len = string_byte_length(key);

for (i = 0; i < 256; i++)
{
s[i] = i;
k[i] = string_byte_at(key,i mod key_len);
}

j = 0;
for (i = 0; i < 256; i++)
{
j = (j + s[i] + k[i]) % 256;
temp = s[i];
s[i] = s[j];
s[j] = temp;
}

i = 0;
j = 0;

for (pos = 0; pos < str_len; pos++)
{
i = (i + 1) mod 256;
j = (j + s[i]) mod 256;
temp = s[i];
s[i] = s[j];
s[j] = temp;
t = (s[i] + s[j]) mod 256;
out += ansi_char(string_byte_at(str,pos+1) ^ s[t]);
}
return out;
}

function rot13() {
    var a, b, str, len, val, i;
    a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    b = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm";
    str = string_letters(argument0);
    len = string_length(str);
    val = "";
    for (i=1; i<=len; i+=1)
    val += string_char_at(b,string_pos(string_char_at(str,i),a));
    return val;
}

