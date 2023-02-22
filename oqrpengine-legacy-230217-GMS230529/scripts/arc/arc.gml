function acos() {
//  Returns the arccosine of a given angle for the nth repetition.
    var a,n,p2;
    a = arccos(argument0);
    n = argument1;
    p2 = 2*pi;
    return a - 2 * n * a + p2 * n + floor(n / 2) * (4 * a - p2);	
}

function asin() {
//  Returns the arcsine of a given angle for the nth repetition.
	var a,n;
    a = arcsin(argument0);
    n = argument1;
    return a - 2 * n * a + pi * n + floor(n / 2) * 4 * a;
}
