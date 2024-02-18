#include "ladmatr.h"

// Reads from in_stream and in_counts, Write to out_memory
void streamtoparallelwithburst(hls::stream<data> &in_stream, hls::stream<int> &in_counts,
	bool &buf_sts, bool sts_clear, ap_uint<32> in_s2m_len, ap_uint<32> *out_memory) {
  data  in_val;

  int count;
  static bool out_sts=0;
  static ap_uint<32> final_s2m_len=0;

  while(final_s2m_len < in_s2m_len){
	  count = in_counts.read();

	  for (int i = 0; i < count; ++i) {
	#pragma HLS PIPELINE
		  in_val = in_stream.read();
		  out_memory[i] = in_val.data_filed;
	  }
	  out_memory += count;
	  final_s2m_len += count;
  };

  if(final_s2m_len >= in_s2m_len){
	  out_sts = 1;
  }

  if(sts_clear == 1) {
	  out_sts = 0;
	  out_memory -= final_s2m_len;
	  final_s2m_len = 0;
  }

  buf_sts = out_sts;
}

void getinstream(hls::stream<trans_pkt >& in_stream, bool sts_clear, ap_uint<32> in_s2m_len, ap_uint<32> in_pattern, hls::stream<data > &out_stream,
	        hls::stream<int>& out_counts)
{
      int count = 0;
      static ap_uint<32> in_len;
      static bool matched=0;
      trans_pkt in_val;
   	  do {
			#pragma HLS PIPELINE
			  in_val = in_stream.read();
			  if((matched == 0) && (in_len<in_s2m_len) && ((in_val.data & 0x00FFFFFF) == (in_pattern & 0x00FFFFFF))){
				  matched = 1;
			  }
			  if(matched == 1){
				  data out_val = {in_val.data, in_val.last};
				  out_stream.write(out_val);
				  count++;
				  in_len++;
			  }
			  if (count >= MAX_BURST_LENGTH) {
				  out_counts.write(count);
				  count = 0;
			  }
	  } while(in_len < in_s2m_len);
      if(in_len >= in_s2m_len){
    	  matched=0;
    	  in_val = in_stream.read();
          if(sts_clear){
        	  in_len=0;
          }
      }
}

void ladmatr(hls::stream<trans_pkt >& inStreamTop,
		bool *out_buf_sts,
		bool sts_clear,
		ap_uint<32> s2m_len,
		ap_uint<32> pattern,
		ap_uint<32> outbuf[BUF_LEN]) {
#pragma HLS INTERFACE axis register_mode=both register port=inStreamTop
#pragma HLS INTERFACE m_axi max_write_burst_length=64 latency=10 depth=1024 bundle=gmem0 port=outbuf offset = slave
#pragma HLS INTERFACE s_axilite port = out_buf_sts bundle = control
#pragma HLS INTERFACE s_axilite port = sts_clear bundle = control
#pragma HLS INTERFACE s_axilite port = s2m_len bundle = control
#pragma HLS INTERFACE s_axilite port = pattern bundle = control
#pragma HLS INTERFACE s_axilite port = outbuf bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

#pragma HLS DATAFLOW

  hls::stream<data,DATA_DEPTH > buf;
  hls::stream<int,COUNT_DEPTH> count;
  
  getinstream(inStreamTop, sts_clear, s2m_len, pattern, buf, count);
  streamtoparallelwithburst(buf, count, *out_buf_sts, sts_clear, s2m_len, outbuf);
}
