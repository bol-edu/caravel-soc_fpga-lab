/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

#define SIZE 4
int32_t A[SIZE*SIZE] = {1, 2, 3, 4,
			5, 6, 7, 8,
			9, 10, 11, 12,
			13, 14, 15, 16,
	};
int32_t B[SIZE*SIZE] = {17, 18, 19, 20,
		21, 22, 23, 24,
		25, 26, 27, 28,
		29, 30, 31, 32,
	};
int32_t C[SIZE*SIZE];
int32_t x[64] = {
    0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 
    61, 62, 63,
};

int32_t q[10] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};


int32_t y[64];
// data len = 64
#define reg_fir_len (*(volatile uint32_t*)0x30000010)
// TAP coeff
#define reg_fir_coeff0  (*(volatile uint32_t*)0x30000020)
#define reg_fir_coeff1  (*(volatile uint32_t*)0x30000024)
#define reg_fir_coeff2  (*(volatile uint32_t*)0x30000028)
#define reg_fir_coeff3  (*(volatile uint32_t*)0x3000002c)
#define reg_fir_coeff4  (*(volatile uint32_t*)0x30000030)
#define reg_fir_coeff5  (*(volatile uint32_t*)0x30000034)
#define reg_fir_coeff6  (*(volatile uint32_t*)0x30000038)
#define reg_fir_coeff7  (*(volatile uint32_t*)0x3000003c)
#define reg_fir_coeff8  (*(volatile uint32_t*)0x30000040)
#define reg_fir_coeff9  (*(volatile uint32_t*)0x30000044)
#define reg_fir_coeff10 (*(volatile uint32_t*)0x30000048)

#define reg_fir_control (*(volatile uint32_t*)0x30000000)
#define reg_dma_x       (*(volatile uint32_t*)0x30000004)
#define reg_dma_y       (*(volatile uint32_t*)0x30000008)
#define reg_dma_q       (*(volatile uint32_t*)0x30000080)
#define reg_dma_A       (*(volatile uint32_t*)0x30000084)
#define reg_dma_B       (*(volatile uint32_t*)0x30000088)
#define reg_dma_C       (*(volatile uint32_t*)0x3000008c)


#define reg_check_fir      (*(volatile uint32_t*)0x38002100)
#define reg_check_mm       (*(volatile uint32_t*)0x38002140)
#define reg_check_qsort    (*(volatile uint32_t*)0x380011a4)
// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void __attribute__ ( ( section ( ".mprjram" ) ) ) main()
{
	int j;
	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	// reg_spi_enable = 1;
	// reg_spimaster_cs = 0x00000;

	// reg_spimaster_control = 0x0801;

	// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

	// The upper GPIO pins are configured to be output
	// and accessble to the management SoC.
	// Used to flad the start/end of a test 
	// The lower GPIO pins are configured to be output
	// and accessible to the user project.  They show
	// the project count value, although this test is
	// designed to read the project count through the
	// logic analyzer probes.
	// I/O 6 is configured for the UART Tx line

        reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

        reg_mprj_io_15 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_14 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_13 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_12 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_11 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_10 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_9  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_8  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_7  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_5  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_4  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_3  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_2  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_1  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_0  = GPIO_MODE_USER_STD_OUTPUT;

        reg_mprj_io_6  = GPIO_MODE_MGMT_STD_OUTPUT;

	// Set UART clock to 64 kbaud (enable before I/O configuration)
	// reg_uart_clkdiv = 625;
	reg_uart_enable = 1;
	
	// Now, apply the configuration
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

        // Configure LA probes [31:0], [127:64] as inputs to the cpu 
	// Configure LA probes [63:32] as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]


	// Flag start of the test 
	// Set Counter value to zero through LA probes [63:32]
	reg_la1_data = 0x00000000;

	// Configure LA probes from [63:32] as inputs to disable counter write
	reg_la1_oenb = reg_la1_iena = 0x00000000;   

	// write fir data length
	reg_fir_len = 64;
	// write fir tap coef
	reg_fir_coeff0 	= 0;
	reg_fir_coeff1 	= -10;
	reg_fir_coeff2 	= -9;
	reg_fir_coeff3 	= 23;
	reg_fir_coeff4 	= 56;
	reg_fir_coeff5 	= 63;
	reg_fir_coeff6 	= 56;
	reg_fir_coeff7 	= 23;
	reg_fir_coeff8 	= -9;
	reg_fir_coeff9 	= -10;
	reg_fir_coeff10 = 0;
/*
	while (1) {
		if (reg_la0_data_in > 0x1F4) {
			reg_mprj_datal = 0xAB410000;
			break;
		}
	}
*/	
        //reg_mprj_datal = 0xAB400000;
        int32_t *addr_x=x;
        int32_t *addr_y=y;        
        int32_t *addr_A=A;
        int32_t *addr_B=B;       
        int32_t *addr_C=C;
        int32_t *addr_q=q;
        reg_dma_x= (int32_t)addr_x; // input dma x begin addr
        reg_dma_y= (int32_t)addr_y; // input dma y begin addr
        reg_dma_A= (int32_t)addr_A; // input dma x begin addr
        reg_dma_B= (int32_t)addr_B; // input dma y begin addr
        reg_dma_C= (int32_t)addr_C; // input dma x begin addr
        reg_dma_q= (int32_t)addr_q; // input dma y begin addr
        reg_mprj_datal = 0xAB400000;
    	reg_fir_control = 1;// let fir start

	while(1){if(reg_fir_control==4) break;};
	//print("\n");
	//print("Monitor: Test 1 Passed\n\n");	// Makes simulation very long!
	//reg_mprj_datal = *(tmp+9) << 16;
	//while(y[62]!=10614);
	//while(1){
	//if(reg_check_fir==10614)
	//break;
	//if(reg_check_mm==1528)
	
	//if(reg_check_qsort==9073)
	//};
	
	reg_mprj_datal = 0xAB510000;

}

