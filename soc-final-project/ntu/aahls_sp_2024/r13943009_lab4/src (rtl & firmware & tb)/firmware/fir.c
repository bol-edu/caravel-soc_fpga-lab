#include "fir.h"
#include <stdint.h>

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	
	// program data length
	wb_write(reg_fir_len, data_length);

	// program coefficient
	for (uint32_t i = 0; i < 11; i++) {
		wb_write(adr_ofst(reg_fir_coeff, 4*i), taps[i]);
	}

}

void __attribute__ ( ( section ( ".mprjram" ) ) ) fir_excute() {
	// StartMark
	wb_write(checkbits, 0x00A50000);

	// ap_start
	wb_write(reg_fir_ap_ctrl, 1);

	uint8_t register t = 0;
	uint8_t register t_save = 0;

	wb_write(reg_fir_x_in, t);
	// write from 1 to N
	t = t + 1;

	// wb_read(reg_fir_y_out);

	wb_write(reg_fir_x_in, t);

	// while (t < N-1) {		
	// 	outputsignal[t] = wb_read(reg_fir_y_out);  // read Y from fir
	// 	t = t + 1;	
	// 	wb_write(reg_fir_x_in, t);
    // }	

	while (t < N-1) {		
		temp = wb_read(reg_fir_y_out);  // read Y from fir
		wb_write(reg_fir_x_in, t+1);
		outputsignal[t_save] = temp;
		t = t + 1;	
		t_save = t_save + 1;
    }	
		
	outputsignal[N-2] = wb_read(reg_fir_y_out);
	outputsignal[N-1] = wb_read(reg_fir_y_out);	

	// let TB check the final Y by using MPRJ[31:24]
	// and send the EndMark 5A signal at MPRJ[23:16]
	// check ap_done
	wb_read(reg_fir_ap_ctrl);
	wb_write(checkbits, outputsignal[N-1] << 24 | 0x005A0000);
}

	
