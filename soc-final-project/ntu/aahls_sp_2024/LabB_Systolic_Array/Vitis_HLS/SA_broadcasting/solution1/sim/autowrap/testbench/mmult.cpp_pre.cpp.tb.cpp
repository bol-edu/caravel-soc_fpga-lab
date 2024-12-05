// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp"




# 1 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.h" 1




extern "C"{
void mmult(volatile int* a, volatile int* b, volatile int* c, int a_row, int a_col, int b_col);
}
# 6 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp" 2





const unsigned int c_size = 16;

extern "C"{
void mmult(volatile int* a,
           volatile int* b,
           volatile int* c,
           int a_row,
     int a_col,
     int b_col
           ) {

#pragma HLS INTERFACE m_axi port=a offset=slave bundle=gmem0 depth=256
#pragma HLS INTERFACE m_axi port=b offset=slave bundle=gmem1 depth=256
#pragma HLS INTERFACE m_axi port=c offset=slave bundle=gmem2 depth=256


#pragma HLS INTERFACE s_axilite port=a bundle=control
#pragma HLS INTERFACE s_axilite port=b bundle=control
#pragma HLS INTERFACE s_axilite port=c bundle=control
#pragma HLS INTERFACE s_axilite port=a_row bundle=control
#pragma HLS INTERFACE s_axilite port=a_col bundle=control
#pragma HLS INTERFACE s_axilite port=b_col bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control


    int b_row = a_col;
    int c_row = a_row;
    int c_col = b_col;


    int localA[16][16];
#pragma HLS ARRAY_PARTITION variable = localA dim = 1 complete

    int localB[16][16];
#pragma HLS ARRAY_PARTITION variable = localB dim = 2 complete

    int localC[16][16];
#pragma HLS ARRAY_PARTITION variable = localC dim = 0 complete


init:
 for (int i = 0; i < 16; i++){
#pragma HLS PIPELINE
   for (int j = 0; j < 16; j++){
    localC[i][j] = 0;
   }
  }



readA:
    for (int loc = 0, i = 0, j = 0; loc < a_row * a_col; loc++, j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size* c_size max = c_size * c_size
#pragma HLS PIPELINE
        if (j == a_col) {
            i++;
            j = 0;
        }
        localA[i][j] = a[loc];
    }
# 80 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp"
readB:
    for (int loc = 0, i = 0, j = 0; loc < b_row * b_col; loc++, j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size * c_size max = c_size * c_size
#pragma HLS PIPELINE
        if (j == b_col) {
            i++;
            j = 0;
        }
        localB[i][j] = b[loc];
    }
# 99 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp"
systolic1:
    for (int k = 0; k < a_col; k++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
    systolic2:
        for (int i = 0; i < 16; i++) {
#pragma HLS UNROLL
        systolic3:
            for (int j = 0; j < 16; j++) {
#pragma HLS UNROLL

                int last = (k == 0) ? 0 : localC[i][j];



                int a_val = (i < a_row && k < a_col) ? localA[i][k] : 0;
                int b_val = (k < b_row && j < b_col) ? localB[k][j] : 0;
                int result = last + a_val * b_val;


                localC[i][j] = result;
            }
        }
    }



writeC:
    for (int loc = 0, i = 0, j = 0; loc < c_row * c_col; loc++, j++) {

#pragma HLS PIPELINE
        if (j == c_col) {
            i++;
            j = 0;
        }
        c[loc] = localC[i][j];

    }
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_mmult_ir(volatile int *, volatile int *, volatile int *, int, int, int);
#ifdef __cplusplus
extern "C"
#endif
void mmult_hw_stub(volatile int *a, volatile int *b, volatile int *c, int a_row, int a_col, int b_col){
mmult(a, b, c, a_row, a_col, b_col);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void apatb_mmult_sw(volatile int *a, volatile int *b, volatile int *c, int a_row, int a_col, int b_col){
apatb_mmult_ir(a, b, c, a_row, a_col, b_col);
return ;
}
#endif
# 136 "/home/ubuntu/Desktop/2024_Fall_NTU_AAHLS_SP/LabB_Systolic_Array/Vitis_HLS/SA_broadcasting/src/mmult.cpp"

}
