#include "ladmatr.h"

int main() {
  int err = 0;
  ap_uint<32> out_b1[BUF_LEN];
  hls::stream<trans_pkt  > inStream_t;
  trans_pkt   dataStream_t;

  ap_uint<32> S2M_LEN;
  ap_uint<32> Real_S2M_LEN;
  ap_uint<32> pattern_in;

  bool	buf_sts1;
  bool	sts_clear_1;

  int	j;

  for (j=0; j<BUF_LEN; j++){
	  out_b1[j]=0;
  }

  pattern_in = 0x88000000;

  printf("Test1 for normal test!!!!!!\n");
  S2M_LEN = BUF_LEN;
  Real_S2M_LEN = 1066;	

  for (j=0; j<BUF_LEN; j++){
	  out_b1[j]=0;
  }

  for(int k=0;k<1;k++){
	  printf("before-phase buf_sts1 is %d\n", buf_sts1);
	  printf("Prepare data stream\n");
	  for(int i=0;i<Real_S2M_LEN;i++){
		dataStream_t.data = k*Real_S2M_LEN + i + 0x33000000;
		dataStream_t.keep = -1;
		if(i<(Real_S2M_LEN-1)){
		  dataStream_t.last = 0;
		} else {
		  dataStream_t.last = 1;
		}
		inStream_t.write(dataStream_t);
	  }

	  printf("Call ladmatr design\n");
	  ladmatr(inStream_t, &buf_sts1, sts_clear_1, S2M_LEN, pattern_in, out_b1);

	  printf("\n");
	  printf("after-phase buf_sts1 is %d\n", buf_sts1);
	  printf("\n");

	  if(buf_sts1 == 1){
		  printf("out_b1, address: %x", out_b1);
		  for (j=0; j<BUF_LEN; j++){
			  if((j%32)==0){printf("\n");}
			  printf("%08x ", out_b1[j]);
		  }
		  printf("\n");
		  sts_clear_1 = 1;
		  ladmatr(inStream_t, &buf_sts1, sts_clear_1, S2M_LEN, pattern_in, out_b1);
		  printf("clear buf_sts1 -> %d\n", buf_sts1);
	  } else {
		  sts_clear_1 = 0;
	  }
	  printf("\n");
	  printf("\n");
  }

  sts_clear_1 = 0;

  for (j=0; j<BUF_LEN; j++){
	  out_b1[j]=0;
  }

  pattern_in = 1022;	

  printf("Test1 for normal test!!!!!!\n");
  S2M_LEN = BUF_LEN;
  Real_S2M_LEN = 1099;	

  for (j=0; j<BUF_LEN; j++){
	  out_b1[j]=0;
  }

  for(int k=0;k<1;k++){
	  printf("before-phase buf_sts1 is %d\n", buf_sts1);
	  printf("Prepare data stream\n");
	  for(int i=0;i<Real_S2M_LEN;i++){
		dataStream_t.data = k*Real_S2M_LEN + i + 993;
		dataStream_t.keep = -1;
		if(i<(Real_S2M_LEN-1)){
		  dataStream_t.last = 0;
		} else {
		  dataStream_t.last = 1;
		}
		inStream_t.write(dataStream_t);
	  }

	  printf("Call ladmatr design\n");
	  ladmatr(inStream_t, &buf_sts1, sts_clear_1, S2M_LEN, pattern_in, out_b1);

	  printf("\n");
	  printf("after-phase buf_sts1 is %d\n", buf_sts1);
	  printf("\n");

	  if(buf_sts1 == 1){
		  printf("out_b1, address: %x", out_b1);
		  for (j=0; j<BUF_LEN; j++){
			  if((j%32)==0){printf("\n");}
			  printf("%04d ", out_b1[j]);
		  }
		  printf("\n");
		  sts_clear_1 = 1;
		  ladmatr(inStream_t, &buf_sts1, sts_clear_1, S2M_LEN, pattern_in, out_b1);
		  printf("clear buf_sts1 -> %d\n", buf_sts1);
	  } else {
		  sts_clear_1 = 0;
	  }
	  printf("\n");
	  printf("\n");
  }

  sts_clear_1 = 0;

  return err;
}
