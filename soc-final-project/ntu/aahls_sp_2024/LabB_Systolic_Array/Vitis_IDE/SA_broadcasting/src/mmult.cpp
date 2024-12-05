
//#include <iostream>
//#include "ap_axi_sdata.h"
//#include "ap_int.h"
//#include "mmult.h"

// Maximum Array Size
#define MAX_SIZE 16

// TRIPCOUNT identifier
const unsigned int c_size = MAX_SIZE;

extern "C"{
void mmult(volatile int* a, // Read-Only Matrix A
           volatile int* b, // Read-Only Matrix B
           volatile int* c, // Output Result
           int a_row,    // Matrix A Row Size
		   int a_col,    // Matrix A Col Size
		   int b_col     // Matrix B Col Size
           ) {
    // AXI4 Master's depth must be a constant and should be adjusted according to MAX_SIZE * MAX_SIZE
    #pragma HLS INTERFACE m_axi port=a offset=slave bundle=gmem0 depth=256
    #pragma HLS INTERFACE m_axi port=b offset=slave bundle=gmem1 depth=256
    #pragma HLS INTERFACE m_axi port=c offset=slave bundle=gmem2 depth=256

	// AXI4 Lite's port must use the same bundle
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

    // Local memory to store input and output matrices
    int localA[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable = localA dim = 1 complete

    int localB[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable = localB dim = 2 complete

    int localC[MAX_SIZE][MAX_SIZE];
    #pragma HLS ARRAY_PARTITION variable = localC dim = 0 complete

// Initialization
init:
	for (int i = 0; i < MAX_SIZE; i++){
		#pragma HLS PIPELINE
		for (int j = 0; j < MAX_SIZE; j++){
			localC[i][j] = 0;
		}
	}

// Burst reads on input matrices from global memory
// Read Input A
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

// Read Input B
readB:
    for (int loc = 0, i = 0, j = 0; loc < b_row * b_col; loc++, j++) {
        #pragma HLS LOOP_TRIPCOUNT min = c_size* c_size max = c_size * c_size
        #pragma HLS PIPELINE
        if (j == b_col) {
            i++;
            j = 0;
        }
        localB[i][j] = b[loc];
    }

// Perform systolic matrix multiply
systolic1:
    for (int k = 0; k < a_col; k++) {
        #pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
    systolic2:
        for (int i = 0; i < MAX_SIZE; i++) {
            #pragma HLS UNROLL
        systolic3:
            for (int j = 0; j < MAX_SIZE; j++) {
                #pragma HLS UNROLL
                // Get previous sum
                int last = (k == 0) ? 0 : localC[i][j];

                // Update current sum
                // Handle boundary conditions
                int a_val = (i < a_row && k < a_col) ? localA[i][k] : 0;
                int b_val = (k < b_row && j < b_col) ? localB[k][j] : 0;
                int result = last + a_val * b_val;

                // Write back results
                localC[i][j] = result;
            }
        }
    }

// Burst write from output matrices to global memory
// Burst write from matrix C
writeC:
    for (int loc = 0, i = 0, j = 0; loc < c_row * c_col; loc++, j++) {
        #pragma HLS LOOP_TRIPCOUNT min = c_size* c_size max = c_size * c_size
        #pragma HLS PIPELINE
        if (j == c_col) {
            i++;
            j = 0;
        }
        c[loc] = localC[i][j];
    }
}
}
