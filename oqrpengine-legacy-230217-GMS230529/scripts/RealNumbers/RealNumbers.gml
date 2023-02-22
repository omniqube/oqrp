function fibonacci() {
//  Returns the nth number of the Fibonacci sequence.
    return round(power((1+sqrt(5))/2,argument0)/sqrt(5));
}

function next_pow2() {
//  Returns the next power-of-two greater than or equal to a given value.
    return 1 << ceil(log2(argument0));	
}

function round_fixed() {
//  Returns the given number rounded to the a number of places.
    return round(argument0*power(10,argument1))/power(10,argument1);
}

function sum_interval() {
//  Returns the sum of positive integers between m and n, inclusive.
    var m,n;
    m = floor(min(argument0,argument1));
    n = floor(max(argument0,argument1));
    return (n*n+n)/2 - (m*m+m)/2 + m;
}