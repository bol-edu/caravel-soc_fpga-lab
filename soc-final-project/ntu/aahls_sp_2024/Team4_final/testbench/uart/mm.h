#ifndef _MATMUL_H
#define _MATMUL_H

#define reg_mm_data_in   0x32000000 // Load X into DataRAM
#define reg_mm_data_out  0x32000010 // Take the output Y

#define checkbits        0x2600000C // MPRJ I/O

#define SIZE 4

int A[SIZE*SIZE] = {
    0, 1, 2, 3,
    0, 1, 2, 3,
    0, 1, 2, 3,
    0, 1, 2, 3,
};
int B[SIZE*SIZE] = {
    1, 2, 3, 4,
    5, 6, 7, 8,
    9, 10, 11, 12,
    13, 14, 15, 16,
};
int result[SIZE*SIZE];

#define wb_write(target, data)   (*(volatile uint32_t*)(target)) = data // wishbone write
#define wb_read(target)   	 (*(volatile uint32_t*)(target))        // wishbone read 

#endif
