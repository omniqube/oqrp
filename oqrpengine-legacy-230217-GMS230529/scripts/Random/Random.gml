function gauss() {
//  Returns a pseudo-random number with an exact Gaussian distribution.
    var x1, x2, w;
 
    do {
        x1 = random(2) - 1;
        x2 = random(2) - 1;
        w = x1*x1 + x2*x2;
    } until (0 < w && w < 1);
 
    w = sqrt(-2 * ln(w)/w);
    return argument0 + argument1 * x1 * w;
}

function exp_dist() {
//  Returns a random number with exponential distribution.
    return -argument0 * ln(1-random(1));
}

function random_weighted() {
//  Returns a randomly selected index based on their
//  given relative probabilities. Any number of index
//  probabilities can be supplied, expressed by any
//  positive numerical value including percentages.
	var sum = 0;
    for (var i=0; i<argument_count; i++) {
        sum += argument[i];
    }
    var rnd = random(sum);
    for (var i=0; i<argument_count; i++) {
        if (rnd < argument[i]) return i;
        rnd -= argument[i];
    }	
	
//  Example:
//      random_weighted(1,2,3) == 0: 1/6 of the time
//                             or 1: 1/3 of the time
//                             or 2: 1/2 of the time
}

function roll_dice() {
//  Returns the sum of a number of die rolls using dice with a given
//  number of sides. For example, roll_dice(3,6) will produce a range
//  of values from 3 to 18 with a mean value of 10.5.
    var sum = 0;
    repeat (argument0) sum += floor(random(argument1))+1;
    return sum;
}