#include "userdma.h"

int main() {
  int err = 0;
  ap_uint<32> out_b[BUF_LEN], in_b[BUF_LEN], result[BUF_LEN];
  hls::stream<trans_pkt  > inStream_t, outStream_t;
  trans_pkt   dataStream_t;

  ap_uint<1> s2m_en_clrsts, m2s_en_clrsts;
  ap_uint<32> S2M_LEN;
  ap_uint<32> Real_S2M_LEN;
  ap_uint<5> S2M_upsb;	
  ap_uint<5> M2S_upsb;	

  ap_uint<32> imgwidth = 160;	//width is 640 bytes -> 160 DW for stream 
  ap_uint<32> imgheight = 360;	

  int M2S_LEN;
  int temp=1000;	

  bool	s2m_buf_sts;
  bool	s2m_sts_clear;
  bool	m2s_buf_sts;
  bool	m2s_sts_clear;
  bool	s2m_err; 
  bool  m2s_sof_err=0; 
  bool  m2s_eol_err=0; 

  int	j;

  for (j=0; j<BUF_LEN; j++){
	  out_b[j]=0;
  }

  s2m_en_clrsts = 0;
  m2s_en_clrsts = 0;
  s2m_sts_clear = 0;
  m2s_sts_clear = 0;

  S2M_LEN = BUF_LEN;
  Real_S2M_LEN = imgwidth * imgheight;
  M2S_LEN = BUF_LEN;

  for (j=0; j<BUF_LEN; j++){
	  out_b[j]=0;
  }
  for(int i=0;i<BUF_LEN;i++){
	  in_b[i] = i;
  }

  printf("before-phase s2m_buf_sts is %d\n", s2m_buf_sts);
  printf("Prepare data stream\n");

  for(unsigned int y = 0; y < imgheight; y++){
	    for (unsigned int x = 0; x < imgwidth; x++) {
	    	dataStream_t.data = temp;
	    	dataStream_t.keep = -1;
	    	dataStream_t.user(2,2) = (x==0 && y==0);
	    	dataStream_t.user(3,3) = (x==imgwidth-1);
	    	dataStream_t.last = ((y==imgheight-1)&&(x==imgwidth-1));
	    	inStream_t.write(dataStream_t);
	    	temp++;	//hurry
	    }
  }

  printf("before-phase m2s_buf_sts is %d\n", m2s_buf_sts);

  printf("Call S2MM/MM2S design\n");
  userdma(inStream_t, &s2m_buf_sts, s2m_sts_clear, S2M_LEN, s2m_en_clrsts, out_b, &s2m_err, imgwidth, in_b, &m2s_buf_sts, m2s_sts_clear, M2S_LEN, m2s_en_clrsts, outStream_t);	

  printf("\n");
  printf("after-phase s2m_buf_sts is %d\n", s2m_buf_sts);
  printf("after-phase m2s_buf_sts is %d\n", m2s_buf_sts);
  printf("\n");

  if(s2m_buf_sts == 1){
	  printf("s2m_err: %x", s2m_err);
	  printf("\nS2M data\n");
	  printf("out_b, address: %x", out_b);
	  for (j=0; j<BUF_LEN; j++){
		  if((j%32)==0){printf("\n");}
		  printf("%x ", out_b[j]);
	  }
	  printf("\n");
  }

  if(m2s_buf_sts == 1){
	  printf("\nM2S data\n");
	  for (j=0; j<BUF_LEN; j++){
		  if((j%32)==0){printf("\n");}
		  dataStream_t = outStream_t.read();

		  if(j==0){
			  if(dataStream_t.user(2,2)!=1)
				  m2s_sof_err=1;
		  }
		  if((j%imgwidth)==(imgwidth-1)){
			  if(dataStream_t.user(3,3)!=1)
				  m2s_eol_err=1;
		  }

		  printf("%04d ", dataStream_t.data);
	  }
	  printf("\n");
  }
  printf("\n");
  printf("m2s_sof_err-->%X \n", m2s_sof_err);	
  printf("m2s_sof_err-->%X \n", m2s_eol_err); 

  if((s2m_buf_sts == 1)&&(m2s_buf_sts == 1)){
	  s2m_sts_clear = 1;
	  s2m_en_clrsts = 1;
	  m2s_sts_clear = 1;
	  m2s_en_clrsts = 1;
	  userdma(inStream_t, &s2m_buf_sts, s2m_sts_clear, S2M_LEN, s2m_en_clrsts, out_b, &s2m_err, imgwidth, in_b, &m2s_buf_sts, m2s_sts_clear, M2S_LEN, m2s_en_clrsts, outStream_t);	//hurry
	  printf("clear s2m_buf_sts -> %d\n", s2m_buf_sts);
	  printf("clear m2s_buf_sts -> %d\n", m2s_buf_sts);
	  s2m_en_clrsts = 0;
	  m2s_en_clrsts = 0;
  } else if((s2m_buf_sts == 1)&&(m2s_buf_sts == 0)){
	  s2m_sts_clear = 1;
	  s2m_en_clrsts = 1;
	  m2s_en_clrsts = 0;
	  userdma(inStream_t, &s2m_buf_sts, s2m_sts_clear, S2M_LEN, s2m_en_clrsts, out_b, &s2m_err, imgwidth, in_b, &m2s_buf_sts, m2s_sts_clear, M2S_LEN, m2s_en_clrsts, outStream_t);	//hurry
	  printf("clear s2m_buf_sts -> %d\n", s2m_buf_sts);
	  s2m_en_clrsts = 0;
  } else if((s2m_buf_sts == 0)&&(m2s_buf_sts == 1)){
	  s2m_en_clrsts = 0;
	  m2s_sts_clear = 1;
	  m2s_en_clrsts = 1;
	  userdma(inStream_t, &s2m_buf_sts, s2m_sts_clear, S2M_LEN, s2m_en_clrsts, out_b, &s2m_err, imgwidth, in_b, &m2s_buf_sts, m2s_sts_clear, M2S_LEN, m2s_en_clrsts, outStream_t);	//hurry
	  printf("clear m2s_buf_sts -> %d\n", m2s_buf_sts);
	  m2s_en_clrsts = 0;
  }

  printf("s2m_err: %x", s2m_err);	

  printf("\n");
  printf("\n");

  s2m_sts_clear = 0;
  m2s_sts_clear = 0;

  return err;
}
