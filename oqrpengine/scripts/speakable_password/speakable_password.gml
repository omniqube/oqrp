function speakable_password(){
//  Returns a random, speakable passowrd of the given length.
    var result,i;
    result = "";
    for (i=0; i<argument0; i+=1) {
        if (i mod 2) result += string_char_at("aeiou",ceil(random(5)));
        else result += string_char_at("bcdfghjklmnprstwyz",ceil(random(18)));
    }
    return result;
}
