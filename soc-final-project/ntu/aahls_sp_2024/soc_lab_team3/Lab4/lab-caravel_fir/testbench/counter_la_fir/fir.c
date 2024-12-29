#include "fir.h"
#include <stdint.h>

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	
	// program data length
	wb_write(reg_fir_len, data_length);

	// program coefficient
	for (uint32_t i = 0; i < 11; i++) {
		wb_write(adr_ofst(reg_fir_coeff, 4*i), taps[i]);
	}

	// program data
	for (uint32_t i = 0; i < N; i++) {
		x_data_array[i] = i;
	}
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) fir_excute() {
	// StartMark
	wb_write(checkbits, 0x00A50000);

	// ap_start
	wb_write(reg_fir_ap_ctrl, 1);

	uint8_t register t = 0;

	wb_write(reg_fir_x_in, t);

	for (uint8_t t = 1; t < N; t++) {
		temp = wb_read(reg_fir_y_out);  
		wb_write(reg_fir_x_in, t);      
		outputsignal[t - 1] = temp;    
	}
	
	temp = wb_read(reg_fir_y_out);
	outputsignal[t] = temp;	
	// let TB check the final Y by using MPRJ[31:24]
	// and send the EndMark 5A signal at MPRJ[23:16]
	// check ap_done
	wb_read(reg_fir_ap_ctrl);
	wb_write(checkbits, outputsignal[N-1] << 24 | 0x005A0000);
}

	
