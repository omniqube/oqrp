// IEEE 754 DOUBLE PRECISION FORMAT CONVERTER

function encode_real_double() {
    var n, str, c, byte, E, M;
    n = argument0;
    if (n == 0) {
        return string_repeat(chr(0),8);
    }
    byte[0] = 0;
    byte[7] = 0;
    if (n < 0) {
        n *= -1;
        byte[7] = byte[7] | $80;
    }
    E = floor(log2(n));
    M = n / power(2,E) - 1;
    E += 1023;
    var i;
    i = 0;
    while (i < 11) {
        if (i < 4) {
            byte[6] = byte[6] | ((E & (1<<i)) << 4);
        } else {
            byte[7] = byte[7] | ((E & (1<<i)) >> 4);
        }
        i += 1;
    }
    i = 51;
    while (i >= 0) {
        M *= 2;
        if (M >= 1) {
            byte[i div 8] = byte[i div 8] | (1<<(i mod 8));
            M -= 1;
        }
        i -= 1;
    }
    str = "";
    for (i = 7; i >= 0; i -= 1) {
        str += chr(byte[i]);
    }
    return str;
}

function decode_real_double() {
    var str, S, E, M, byte, n;
    str = argument0;
    var i;
    for (i = 0; i < 8; i += 1) {
        byte[i] = ord(string_char_at(str,8 - i));
    }
    S = 1 - 2*((byte[7] & $80) > 0);
    i = 0;
    M = 0;
    while (i <= 51) {
        if (byte[i div 8] & (1<<(i mod 8)) > 0) {
            M += 1;
        }
        M /= 2;
        i += 1;
    }
    i = 62;
    E = 0;
    while (i > 51) {
        E *= 2;
        if (byte[i div 8] & (1<<(i mod 8)) > 0) {
            E += 1;
        }
        i -= 1;
    }
    if (E == 0) {
        n = S * M * power(2, -1022);
    }
    else {
        n = S * (M + 1) * power(2, E - 1023);
    }
    return n;
}