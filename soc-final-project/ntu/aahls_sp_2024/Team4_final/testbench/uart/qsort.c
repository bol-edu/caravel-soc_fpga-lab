#include "qsort.h"
#include <stdint.h>

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
	// StartMark
	wb_write(checkbits, 0x00A50000);

	int i=0;

	for (i=0; i<SIZE; i++){
        wb_write(reg_qsort_data_in, Q[i]);
	}

    for (i=0; i<SIZE; i++){
        result_q[i] = wb_read(reg_qsort_data_out);
	}
}
