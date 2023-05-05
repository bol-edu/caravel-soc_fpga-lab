
/*
 * FSIC - Full-Stack IC Development
 * v1: let PS can write rom code to BRAM and read back
 * date: 20230422
 * author: Allen
 */
//
// read_romcode
//	perform axi-m to read rom code from system memory, and store in BRAM
//  romcode size is set at 4KB
//
#define CODE_SIZE   1024*4		

void read_romcode(
// PS side interace
    int romcode[CODE_SIZE/sizeof(int)],
	int internal_bram[CODE_SIZE/sizeof(int)],
	int romcode_to_PS[CODE_SIZE/sizeof(int)],
	int cmd  //0: load program.hex from romcode to BRAM
			 //1: read program back from BRAM to romcode_to_PS

)
{
// AXI master BUS0, load rom code from PS
#pragma HLS INTERFACE m_axi port=romcode offset=slave max_read_burst_length=64 bundle=BUS0
#pragma HLS INTERFACE s_axilite port=romcode bundle=control

// AXI master BUS1, write rom code back to PS
#pragma HLS INTERFACE m_axi port=romcode_to_PS offset=slave max_read_burst_length=64 bundle=BUS1
#pragma HLS INTERFACE s_axilite port=romcode_to_PS bundle=control

#pragma HLS INTERFACE s_axilite port=cmd bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control  //let axi lite bus control this IP

#pragma HLS INTERFACE mode=bram depth=1024 port=internal_bram

int i;
	if(cmd==0){
		// load ROMCODE
		for(i=0; i < CODE_SIZE/sizeof(int); i++) {
			#pragma HLS PIPELINE
			internal_bram[i] = romcode[i];
		}
	}else if(cmd==1){
		// read back ROMCODE to PS
		for(i=0; i < CODE_SIZE/sizeof(int); i++) {
			#pragma HLS PIPELINE
			romcode_to_PS[i] = internal_bram[i];
		}
	}
	return;

}
