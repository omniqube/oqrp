function bit_clear(bitfield, bit) 
{
    return bitfield & ~(1 << bit);
}

function bit_set(bitfield, bit)
{
    return bitfield | (1 << bit);
}

function bit_test(bitfield, bit)
{
    return 1 & (bitfield >> bit);
}

function bit_toggle(bitfield, bit)
{
    return bitfield ^ (1 << bit);
}

function bitwise_reverse16(n)
{
    n = (n & 0x5555) << 1 | (n & 0xAAAA) >> 1;
    n = (n & 0x3333) << 2 | (n & 0xCCCC) >> 2;
    n = (n & 0x0F0F) << 4 | (n & 0xF0F0) >> 4;
    n = (n & 0x00FF) << 8 | (n & 0xFF00) >> 8;
    return n;
}

function bitwise_reverse32(n)
{
    n = (n & 0x55555555) <<  1 | (n & 0xAAAAAAAA) >>  1;
    n = (n & 0x33333333) <<  2 | (n & 0xCCCCCCCC) >>  2;
    n = (n & 0x0F0F0F0F) <<  4 | (n & 0xF0F0F0F0) >>  4;
    n = (n & 0x00FF00FF) <<  8 | (n & 0xFF00FF00) >>  8;
    n = (n & 0x0000FFFF) << 16 | (n & 0xFFFF0000) >> 16;
    return n;
}

function bitwise_reverse8(n)
{
    n = (n & 0x55) << 1 | (n & 0xAA) >> 1;
    n = (n & 0x33) << 2 | (n & 0xCC) >> 2;
    n = (n & 0x0F) << 4 | (n & 0xF0) >> 4;
    return n;
}

function bitwise_rol(n, count, size)
{
    var mask = (1 << size) - 1;
    n &= mask;
    return (n << count) | (n >> (size - count)) & mask;
}

function bitwise_ror(n, count, size)
{
    var mask = (1 << size) - 1;
    n &= mask;
    return (n >> count) | (n << (size - count)) & mask;
}