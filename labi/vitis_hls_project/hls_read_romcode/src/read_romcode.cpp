
/*
 * FSIC - Full-Stack IC Development
 *  
 */
//
//  read_romcode
//	perform axi-m to read rom code from system memory, and store in BRAM
//  romcode size is set at 8KB
//
#define CODE_SIZE   2048*4

void read_romcode(
// PS side interace
    int romcode[CODE_SIZE/sizeof(int)],
	int internal_bram[CODE_SIZE/sizeof(int)],
	int length)
{
	#pragma HLS INTERFACE s_axilite port=return

	#pragma HLS INTERFACE m_axi port=romcode offset=slave max_read_burst_length=64 bundle=BUS0
	#pragma HLS INTERFACE bram port=internal_bram
	#pragma HLS INTERFACE s_axilite port=length

	// Check length parameter can't over than CODE_SIZE/4
	if(length > (CODE_SIZE/sizeof(int)))
		length = CODE_SIZE/sizeof(int);

	int i;
	// load ROMCODE
	for(i = 0; i < length; i++) {
		#pragma HLS PIPELINE
		internal_bram[i] = romcode[i];
	}

	return;
}
