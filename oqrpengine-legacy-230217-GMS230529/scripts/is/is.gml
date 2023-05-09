function is_even() {
	return !(argument0 & 1);
}

function is_factor() {
    return !(argument1 mod argument0);
}

function is_odd() {
	return (argument0 & 1);
}

function is_power() {
	var value,base;
    value = argument0;
    base = argument1;
    if (argument1 == 0 && argument0 == 0) return -1;
    if (argument1 == 1 || argument0 == 1) return true;
    if (argument0 == 0 || argument1 == 0) return false;
    return ((logn(argument1,argument0) mod 1) == 0);
}