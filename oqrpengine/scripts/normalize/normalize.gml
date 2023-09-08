///@func normalize(value, a, b, c, d)
///@desc Normalizes a function value between A and B by mapping its values to a range between C and D.
///@param {Real} VALUE Input value in range <A,B>
///@param {Real} A Bottom value for range <A,B>
///@param {Real} B Top value for range <A,B>
///@param {Real} C Bottom value for range <C,D>
///@param {Real} D Top value for range <C,D>
///@return {Real} Resulting mapped value. Returns -1 if parameters are incorrect.
///@pure

function normalize(value, a, b, c, d) {
	
	if ((value < a) || (value > b)) {return -1;}
	return (value - a) * (d - c) / (b - a) + c;
	
}

