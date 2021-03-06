

// Some constant which is big enough to not fit into register
__constant unsigned int_constant[] = {0x42, 0x17, 0x12345678, 0x12348765, 0x87654321, 0x13245678, 0x98765432, 0x1, 0x2,
    0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};

__constant unsigned short short_constant[] = {0x42, 0x17, 0x5678, 0x8765, 0x4321, 0x5678, 0x9432, 0x1, 0x2, 0x3, 0x4,
    0x5, 0x6, 0x7, 0x8, 0x9, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};

__constant unsigned char char_constant[] = {0x42, 0x17, 0x78, 0x65, 0x21, 0x78, 0x32, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
    0x8, 0x9, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};

__kernel void test_constant_load(__global uint* out0, __global ushort* out1, __global uchar* out2, unsigned index)
{
    // simple memory copy via VPM
    out0[0] = int_constant[index];
    out1[0] = short_constant[index];
    out2[0] = char_constant[index];

    // load via TMU, since constant input and local modification
    out0[1] = int_constant[index + 1] + 42;
    out1[1] = short_constant[index + 1] + 42;
    out2[1] = char_constant[index + 1] + 42;
}