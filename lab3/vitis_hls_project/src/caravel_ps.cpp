/*
 * FSIC - Full-Stack IC Development
 *  
 */


//
// Caravel - PS Interface 
//
// This is an HLS implementation of Caravel mprj_io 
// 

#include "ap_int.h"
#define NUM_IO   38

void caravel_ps (

// PS side interace
    ap_uint<NUM_IO>  ps_mprj_in,
	ap_uint<NUM_IO>& ps_mprj_out,
	ap_uint<NUM_IO>& ps_mprj_en,
	
// Caravel flash interface
    
	ap_uint<NUM_IO>& mprj_in,
	ap_uint<NUM_IO>  mprj_out,
	ap_uint<NUM_IO>  mprj_en)  {


#pragma HLS PIPELINE
#pragma HLS INTERFACE s_axilite port=ps_mprj_in
#pragma HLS INTERFACE s_axilite port=ps_mprj_out
#pragma HLS INTERFACE s_axilite port=ps_mprj_en
#pragma HLS INTERFACE ap_ctrl_none port=return


#pragma HLS INTERFACE ap_none port=mprj_in
#pragma HLS INTERFACE ap_none port=mprj_out
#pragma HLS INTERFACE ap_none port=mprj_en

	int i;

	ps_mprj_out = mprj_out;
	ps_mprj_en = mprj_en;


	for(i = 0; i < NUM_IO; i++) {
		#pragma HLS UNROLL
		mprj_in[i] = mprj_en[i] ? mprj_out[i] : ps_mprj_in[i];
	}


}

