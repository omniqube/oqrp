function gcd() {
//  Returns the greatest common divisor of the given integers.
    var a,b,r;
    a = max(argument0,argument1);
    b = min(argument0,argument1);
    while (b != 0) {
        r = a mod b;
        a = b;
        b = r;
    }
    return a;
}

function lcm() {
//  Returns the least common multiple of the given integers.
    var a,b,c,r;
    a = max(argument0,argument1);
    b = min(argument0,argument1);
    c = a * b;
    while (b != 0) {
        r = a mod b;
        a = b;
        b = r;
    }
    return (c / a);	
}