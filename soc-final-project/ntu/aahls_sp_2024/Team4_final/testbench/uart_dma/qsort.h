#ifndef _QSORT_H
#define _QSORT_H

#define reg_qsort_data_in   0x33000000 // Load X into DataRAM
#define reg_qsort_data_out  0x33000010 // Take the output Y

#define checkbits        0x2600000C // MPRJ I/O

#define SIZE 10
int Q[SIZE] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};

int result_q[SIZE];

#define wb_write(target, data)   (*(volatile uint32_t*)(target)) = data // wishbone write
#define wb_read(target)   	 (*(volatile uint32_t*)(target))        // wishbone read 

#endif
