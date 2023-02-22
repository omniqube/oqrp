// Parametric Functions

function bias() {
	//  Returns the given value with a bias function applied to it.
//  If x varies over the [0,1] interval, then the result also
//  varies over that interval. The 0 and 1 endpoints of the
//  interval are mapped onto themselves. Other values are shifted
//  upward toward 1 if b is greater than 0.5, and shifted 
//  downward toward 0 if b is less than 0.5.
    return argument1 / ((1 / argument0 - 2) * (1 - argument1) + 1);
}

function boxstep() {
//  Returns 0 when (x <= a), 1 when (x >= b), a linear transition
//  from 0 to 1 when (a < x < b), or (-1) on error (a == b). 
    var p;
    if (argument0 == argument1) return (-1);
    p = (argument2 - argument0) / (argument1 - argument0);
    if (p <= 0) return 0;
    if (p >= 1) return 1;
    return p;
}

function gain() {
	//  Returns the given value with a gain function applied to it.
//  If x varies over the [0,1] interval, then the result also
//  varies over that interval. The 0 and 1 endpoints of the
//  interval are mapped onto themselves. Regardless of the value
//  of g, all gain functions return 0.5 when x is 0.5. Above
//  and below 0.5 the gain function consists of two scaled-down
//  bias curves forming an S-shaped curve.
    var p;
    p = (1 / argument0 - 2) * (1 - 2 * argument1);
    if (argument1 < 0.5) return argument1 / (p + 1);
    else return (p - argument1) / (p - 1);
}

function gammacorrect() {
	//  Returns the given value with gamma correction applied to it.
//  If x varies over the [0,1] interval, then the result also
//  varies over that interval. The 0 and 1 endpoints of the 
//  interval are mapped onto themselves. Other values are 
//  shifted upward toward 1 if gamma is greater than 1 and 
//  shifted downward toward 0 if gamma is less than 1.
    return power(argument1, 1 / argument0);
}

function pulse() {
//  Returns 1 when (a <= x <= b), 0 otherwise.
    return ((argument0 <= argument2) && (argument2 <= argument1));
}

function step() {
//  Returns 0 when (x < a), 1 otherwise.
    return (argument1 >= argument0);
}

function smoothstep() {
//  Returns 0 when (x < a), 1 when (x >= b), a smooth transition
//  from 0 to 1 otherwise, or (-1) on error (a == b).
    var p;
    if (argument2 < argument0) return 0;
    if (argument2 >= argument1) return 1;
    if (argument0 == argument1) return -1;
    p = (argument2 - argument0) / (argument1 - argument0);
    return (p * p * (3 - 2 * p));
}

function spline() {
	//  Returns the Catmull-Rom interpolation of the given
	//  knot values at the given parameter position.
//  If (t) is 0, returns knot[2], if (t) is 1, returns knot[N-1],
//  (where 1 is the first knot and N is the last knot). For other
//  values of (t), interpolates smoothly from knot[2] to knot[N-1].
//  The first and last knots determine the derivatives of the spline
//  end points. Because the spline is a cubic polynomial, there must
//  be at least four knots.
	var t, knotlist, nknots, nspans, span, k, c3, c2, c1, c0;
    t = argument0;
    knotlist = argument1;
    nknots = ds_list_size(knotlist);
    nspans = nknots - 3;
    if (nspans < 1) return 0; // ERROR: too few knots
    t = clamp(t, 0, 1) * nspans;
    span = floor(t);
    if (span >= nknots - 3) span = nknots - 3;
    t -= span;
    k[0] = ds_list_find_value(knotlist,span);
    k[1] = ds_list_find_value(knotlist,span+1);
    k[2] = ds_list_find_value(knotlist,span+2);
    k[3] = ds_list_find_value(knotlist,span+3);
    c3 = -0.5 * k[0] + 1.5 * k[1] - 1.5 * k[2] + 0.5 * k[3];
    c2 = k[0] - 2.5 * k[1] + 2 * k[2] - 0.5 * k[3];
    c1 = -0.5 * k[0] + 0.5 * k[2];
    c0 = k[1];
    return ((c3 * t + c2) * t + c1) * t + c0;
}

function spline4() {
	//  Returns the Catmull-Rom interpolation of the given 
	//  knot values at the given parameter position. 
//  This is an optimized version of spline() for the special
//  case of four knots. See spline() for more details.
    var k0, k3, c3, c2, c1, c0;
    if (argument0 <= 0) return argument2;
    if (argument0 >= 1) return argument3;
    k0 = -0.5 * argument1;
    k3 = 0.5 * argument4;
    c3 = k0 + 1.5 * argument2 - 1.5 * argument3 + k3;
    c2 = argument1 - 2.5 * argument2 + 2 * argument3 - k3;
    c1 = k0 + 0.5 * argument3;
    c0 = argument2;
    return ((c3 * argument0 + c2) * argument0 + c1) * argument0 + c0;
}