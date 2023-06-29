



void output_pin(
		bool outpin_ctrl,
		bool& outpin)
{
	#pragma HLS INTERFACE s_axilite port=outpin_ctrl
	#pragma HLS INTERFACE ap_none port=outpin
	#pragma HLS INTERFACE ap_ctrl_none port=return

	outpin = outpin_ctrl;

	return;
}
