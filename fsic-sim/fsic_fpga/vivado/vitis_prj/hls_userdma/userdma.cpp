#include "userdma.h"

/// Reads from in_stream and in_counts, Write to out_memory
void streamtoparallelwithburst(hls::stream<data> &in_stream, hls::stream<int> &in_counts, ap_uint<1> in_en_clrsts,
	bool &buf_sts, bool sts_clear, ap_uint<32> in_s2m_len, ap_uint<32> *out_memory) {
  data  in_val;

  int count;
  static bool out_sts=0;
  static ap_uint<32> final_s2m_len=0;

  if(in_en_clrsts) {
	  if(sts_clear == 1) {
		  out_sts = 0;
		  out_memory -= final_s2m_len;
		  final_s2m_len = 0;
	  }
	  buf_sts = out_sts;
  } else {
	  do {
		  count = in_counts.read();

		  for (int i = 0; i < count; ++i) {
		#pragma HLS PIPELINE
			  in_val = in_stream.read();
			  out_memory[i] = in_val.data_filed;
		  }
		  out_memory += count;
		  final_s2m_len += count;

		  if(final_s2m_len == in_s2m_len){
			  out_sts = 1;
		  }

		  buf_sts = out_sts;
	  } while(final_s2m_len < BUF_LEN);
  }
}

void getinstream(hls::stream<trans_pkt >& in_stream, ap_uint<1> in_en_clrsts, ap_uint<32> in_s2m_len, bool &s2m_err, ap_uint<32> in_Img_width,
			hls::stream<data > &out_stream, hls::stream<int>& out_counts)	
{
      int count = 0;
      static ap_uint<32> in_len = 0;
      trans_pkt in_val;
      static int width_count = 0;	
      if(!in_en_clrsts){
    	  do {
			#pragma HLS PIPELINE
			  in_val = in_stream.read();
			  data out_val = {in_val.data, in_val.last};
			  out_stream.write(out_val);

			  s2m_err=0;

			  if((in_len==0)&&(in_val.user(2,2)!=1))
				s2m_err=1;
			  if((in_len!=0)&&(in_val.user(2,2)==1))
				s2m_err=1;					  

			  if((width_count==in_Img_width-1)&&(in_val.user(3,3)!=1))
				s2m_err=1;
			 
			  if(width_count==in_Img_width-1)			  
			 	width_count = 0; 
  		 	  else
			  	width_count++;

			  count++;
			  in_len++;
			  if (count >= MAX_BURST_LENGTH) {
				  out_counts.write(count);
				  count = 0;
			  }
		  } while(in_len < in_s2m_len);
      } else {
    	  in_len=0;
    	  s2m_err=0;	
      }
}

//Read MM
void paralleltostreamwithburst(ap_uint<32> *in_memory, ap_uint<1> in_en_clrsts, ap_uint<32>	in_Img_width,
	int in_m2s_len, hls::stream<out_data> &out_stream, hls::stream<int> &out_counts) {	//hurry
  out_data  out_val;	
  int count;
  static bool out_sts=0;
  static int m2s_len=0;
  static bool first = 1;
  static int Img_width_count=0;


  if(!in_en_clrsts){
	  if(first) {
		  m2s_len = in_m2s_len;
		  first = 0;
	  }
	  do {
  		  if(m2s_len > MAX_BURST_LENGTH){	
			  count = MAX_BURST_LENGTH;
		  }else{
			  count = m2s_len;
			  first = 1;
		  }

		  for (int i = 0; i < count; ++i) {
			#pragma HLS PIPELINE
			  out_val.data_filed = in_memory[i];
			  out_val.upsb = 0;	
			  if((m2s_len <= MAX_BURST_LENGTH) && (i==(count-1)))
				  out_val.last = 1;
			  else
				  out_val.last = 0;

			  if(m2s_len == in_m2s_len)
				  out_val.upsb(2,2) = 1;

			  if(Img_width_count == in_Img_width-1){
				  out_val.upsb(3,3) = 1;
				  Img_width_count=0; 
			  }else{
				  Img_width_count++;
			  }

			  out_stream.write(out_val);
			  m2s_len--;	
		  }
		  out_counts.write(count);
		  in_memory += count;

	  } while(m2s_len != 0);
  }
}

//output stream 
void sendoutstream(hls::stream<out_data> &in_stream, hls::stream<int> &in_counts, ap_uint<1> in_en_clrsts,
		bool &buf_sts, bool sts_clear, hls::stream<trans_pkt >& out_stream)	//hurry
{
      int count = 0;
      trans_pkt out_val;

      if(in_en_clrsts){
    	  if(sts_clear)
    		  buf_sts = 0;

      } else {
		  do {
			  count = in_counts.read();
			  for (int i = 0; i < count; ++i) {
			#pragma HLS PIPELINE
				  out_data in_data = in_stream.read();	
				  out_val.data = in_data.data_filed;
				  out_val.user = in_data.upsb;	
				  out_val.last = in_data.last;
				  out_stream.write(out_val);
			  }
		  } while(!out_val.last);
		  if(out_val.last == 1){
			  buf_sts = 1;
		  }
      }
}

void userdma(hls::stream<trans_pkt >& inStreamTop,
		bool *s2m_buf_sts,
		bool s2m_sts_clear,
		ap_uint<32> s2m_len,
		ap_uint<1> s2m_enb_clrsts,
		ap_uint<32> s2mbuf[BUF_LEN],
		bool *s2m_err,	
		ap_uint<32>	Img_width,	
		ap_uint<32> m2sbuf[BUF_LEN],
		bool *m2s_buf_sts,
		bool m2s_sts_clear,
		int m2s_len,
		ap_uint<1> m2s_enb_clrsts,
		hls::stream<trans_pkt >& outStreamTop) {
#pragma HLS INTERFACE axis register_mode=both register port=inStreamTop
#pragma HLS INTERFACE m_axi max_write_burst_length=64 latency=10 depth=1024 bundle=gmem0 port=s2mbuf offset = slave
#pragma HLS INTERFACE s_axilite port = s2m_buf_sts bundle = control
#pragma HLS INTERFACE s_axilite port = s2m_sts_clear bundle = control
#pragma HLS INTERFACE s_axilite port = s2m_len bundle = control
#pragma HLS INTERFACE s_axilite port = s2m_enb_clrsts bundle = control
#pragma HLS INTERFACE s_axilite port = s2mbuf bundle = control
#pragma HLS INTERFACE s_axilite port = s2m_err bundle = control	
#pragma HLS INTERFACE s_axilite port = Img_width bundle = control	
#pragma HLS INTERFACE axis register_mode=both register port=outStreamTop
#pragma HLS INTERFACE m_axi max_write_burst_length=64 latency=10 depth=1024 bundle=gmem1 port=m2sbuf offset = slave
#pragma HLS INTERFACE s_axilite port = m2s_buf_sts bundle = control
#pragma HLS INTERFACE s_axilite port = m2s_sts_clear bundle = control
#pragma HLS INTERFACE s_axilite port = m2s_len bundle = control
#pragma HLS INTERFACE s_axilite port = m2s_enb_clrsts bundle = control
#pragma HLS INTERFACE s_axilite port = m2sbuf bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

#pragma HLS DATAFLOW

  hls::stream<data,DATA_DEPTH > inbuf;
  hls::stream<int,COUNT_DEPTH> incount;
  hls::stream<out_data,DATA_DEPTH > outbuf;	
  hls::stream<int,COUNT_DEPTH> outcount;
  
  getinstream(inStreamTop, s2m_enb_clrsts, s2m_len, *s2m_err, Img_width, inbuf, incount);	
  streamtoparallelwithburst(inbuf, incount, s2m_enb_clrsts, *s2m_buf_sts, s2m_sts_clear, s2m_len, s2mbuf);
  paralleltostreamwithburst(m2sbuf, m2s_enb_clrsts, Img_width, m2s_len, outbuf, outcount);	
  sendoutstream(outbuf, outcount, m2s_enb_clrsts, *m2s_buf_sts, m2s_sts_clear, outStreamTop);

}
