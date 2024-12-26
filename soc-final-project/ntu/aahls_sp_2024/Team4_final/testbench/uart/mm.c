#include "mm.h"
#include <stdint.h>

int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
    // StartMark
	wb_write(checkbits, 0x00A50000);

	int i=0;
	int j=0;
	// int k;
	// int sum;
	// int kk;
	// unsigned int count = 0;
	for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
			// sum = 0;
			// for(k = 0;k<SIZE;k++)
			// 	sum += A[(i*SIZE) + k] * B[(k*SIZE) + j];
			// result[(i*SIZE) + j] = sum;
            wb_write(reg_mm_data_in, A[(i*SIZE) + j]);
		}
	}
    for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
            wb_write(reg_mm_data_in, B[(i*SIZE) + j]);
		}
	}
    for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
            result[(i*SIZE) + j] = wb_read(reg_mm_data_out);
		}
	}
	// wb_write(checkbits, result[SIZE*SIZE-1] << 24 | 0x005A0000);
}