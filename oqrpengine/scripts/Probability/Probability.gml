function combination() {
//  Returns the number of unique subsets created from all
//  combinations of a number of elements, or (-1) on error. 
    var f,i,j,k,l,m,n;
    n = floor(argument0);
    k = floor(argument1);
    m = n - k;
    if (m < 0) return (-1);
    else {
        f = 1;
        i = 1;
        j = 1;
        for (l=2; l<=n; l+=1) {
            f *= l;
            if (l == k) i = f;
            if (l == m) j = f;
        }
        return (f / (i * j));
    }
}

function permutation() {
//  Returns the number of unique subsets created from all 
//  permutations of a number of elements in which the order 
//  of the chosen elements is significant, or (-1) on error.
    var f,k,l,m,n;
    n = floor(argument0);
    k = floor(argument1);
    m = n - k;
    if (m < 0) return (-1);
    else {
        f = 1;
        for (l=n; l>m; l-=1) f *= l;
        return f;
    }
}

function factorial() {
	if (argument0 <= 1) return 1;
    else return argument0 * factorial(argument0 - 1);
	
//  Note: 21! is the largest factorial GameMaker:Studio can precisely
//  compute. Beyond that, floating-point arithmetic can represent 
//  factorials as large as 170! with decreasing precision.
}
