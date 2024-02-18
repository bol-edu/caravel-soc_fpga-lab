#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"

#define BUF_LEN 1024

typedef ap_axiu<32, 2, 0, 0> trans_pkt;

void ladmatr(hls::stream<trans_pkt >& inStreamTop,
		bool *out_buf1_sts,
		bool sts1_clear,
		ap_uint<32> S2M_len,
		ap_uint<32> pattern,
		ap_uint<32> outbuf1[BUF_LEN]) ;

// Expects max bandwidth at 64 beats burst (for 64-bit data)
static constexpr int MAX_BURST_LENGTH = 16;
static constexpr int BUFFER_FACTOR = 8;

// Buffer sizes
static constexpr int DATA_DEPTH = MAX_BURST_LENGTH * BUFFER_FACTOR;
static constexpr int COUNT_DEPTH = BUFFER_FACTOR;

struct data {
	ap_int<32> data_filed;
	ap_int<1> last;
};
