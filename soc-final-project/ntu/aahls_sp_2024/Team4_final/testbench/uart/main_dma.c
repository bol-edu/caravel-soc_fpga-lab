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
#include <user_uart.h>
// #ifdef USER_PROJ_IRQ0_EN
// #include <irq_vex.h>
// #endif


// extern void uart_write();
// extern void uart_write_char();
// extern void uart_write_string();
// extern void uart_reset_write_fifo();
// extern int uart_isr();
// extern int uart_read();

// extern int* initfir();
// extern int* fir_excute();

// extern int* matmul();

// extern int* qsort();

// .data definition
// from mm
    // #define reg_mm_data_in   0x32000000 // Load X into DataRAM
    // #define reg_mm_data_out  0x32000010 // Take the output Y

    // #define checkbits        0x2600000C // MPRJ I/O

    #define SIZE_MM 4
    int32_t A[SIZE_MM*SIZE_MM] = {0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3};
    int32_t B[SIZE_MM*SIZE_MM] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    int32_t result[SIZE_MM*SIZE_MM];
// from mm ends

// from qs
    // #define reg_qsort_data_in   0x33000000 // Load X into DataRAM
    // #define reg_qsort_data_out  0x33000010 // Take the output Y

    #define SIZE_Q 10
    int32_t Q[SIZE_Q] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};

    int32_t result_q[SIZE_Q];
// from qs ends


// from fir
    #define reg_fir_ap_ctrl  0x31000000 // ap_control
    // #define reg_fir_len      0x31000010 // data length
    #define reg_fir_coeff    0x31000040 // Load into TapRAM
    // #define reg_fir_x_in     0x31000080 // Load X into DataRAM
    // #define reg_fir_y_out    0x31000084 // Take the output Y

    // #define checkbits        0x2600000C // MPRJ I/O

    // #define N 128
    #define SIZE_FIR 64

    int32_t taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

    int32_t inputbuffer[SIZE_FIR] = {
    0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 
    61, 62, 63};
    int32_t outputsignal[SIZE_FIR];
// from fir ends

#define reg_fir_len      (*(volatile uint32_t*)0x30000010)
#define reg_fir_coeff0   (*(volatile uint32_t*)0x30000020)
#define reg_fir_coeff1   (*(volatile uint32_t*)0x30000024)
#define reg_fir_coeff2   (*(volatile uint32_t*)0x30000028)
#define reg_fir_coeff3   (*(volatile uint32_t*)0x3000002c)
#define reg_fir_coeff4   (*(volatile uint32_t*)0x30000030)
#define reg_fir_coeff5   (*(volatile uint32_t*)0x30000034)
#define reg_fir_coeff6   (*(volatile uint32_t*)0x30000038)
#define reg_fir_coeff7   (*(volatile uint32_t*)0x3000003c)
#define reg_fir_coeff8   (*(volatile uint32_t*)0x30000040)
#define reg_fir_coeff9   (*(volatile uint32_t*)0x30000044)
#define reg_fir_coeff10  (*(volatile uint32_t*)0x30000048)

#define reg_fir_control  (*(volatile uint32_t*)0x30000000)
#define reg_dma_x        (*(volatile uint32_t*)0x30000004)
#define reg_dma_y        (*(volatile uint32_t*)0x30000008)
#define reg_dma_q        (*(volatile uint32_t*)0x30000080)
#define reg_dma_A        (*(volatile uint32_t*)0x30000084)
#define reg_dma_B        (*(volatile uint32_t*)0x30000088)
#define reg_dma_C        (*(volatile uint32_t*)0x3000008c)
#define reg_dma_result_q (*(volatile uint32_t*)0x30000090)

#define checkbits_fir    (*(volatile uint32_t*)0x2600000C)
#define checkbits_mm     (*(volatile uint32_t*)0x2600001C)
#define checkbits_qsort  (*(volatile uint32_t*)0x2600002C)

// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

// void delay(int n);

void __attribute__ ( ( section ( ".mprjram" ) ) ) main()
{
// 在GPIO配置後立即添加
reg_mprj_datal = 0xAB000000;  // 確認GPIO配置完成

#ifdef USER_PROJ_IRQ0_EN
    int mask;
#endif
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

    //reg_spi_enable = 1;
    reg_wb_enable = 1;

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
    reg_mprj_io_4  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_3  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_2  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_1  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_0  = GPIO_MODE_USER_STD_OUTPUT;

    reg_mprj_io_6  = GPIO_MODE_MGMT_STD_OUTPUT;
    // reg_mprj_io_5  = GPIO_MODE_USER_STD_INPUT_NOPULL; why this
    reg_mprj_io_5  = GPIO_MODE_USER_STD_OUTPUT;

// 在GPIO配置後立即添加
reg_mprj_datal = 0xAB100000;  // 確認GPIO配置完成

	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

// 在xfer完成後添加
reg_mprj_datal = 0xAB200000;  // 確認xfer完成

    // Configure LA probes [31:0], [127:64] as inputs to the cpu 
	// Configure LA probes [63:32] as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

// 在最終設置前添加
reg_mprj_datal = 0xAB300000;  // 準備最終設置

	// Set Counter value to zero through LA probes [63:32]
	reg_la1_data = 0x00000000;

	// Flag start of the test 
	reg_mprj_datal = 0xAB400000;



	// Configure LA probes from [63:32] as inputs to disable counter write
	reg_la1_oenb = reg_la1_iena = 0x00000000;    

    // First, load fir coefficients and data length to tapRAM and engine
	reg_fir_len     = 64;
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


    // after basic setup, send DMA information.
	// We need to remember where those data are stored.
	// addr_* means where the data is stored.
	// reg_dma_* are registers store the address of those data.
	int32_t *addr_x=inputbuffer;
    int32_t *addr_y=outputsignal;
    int32_t *addr_A=A;
    int32_t *addr_B=B;
    int32_t *addr_C=result;
    int32_t *addr_q=Q;
    int32_t *addr_result_q=result_q;
    reg_dma_x= (int32_t)addr_x;
    reg_dma_y= (int32_t)addr_y;
    reg_dma_A= (int32_t)addr_A;
    reg_dma_B= (int32_t)addr_B;
    reg_dma_C= (int32_t)addr_C;
    reg_dma_q= (int32_t)addr_q;
    reg_dma_result_q= (int32_t)addr_result_q;
    reg_mprj_datal = 0xAB400000; // checkbits
    reg_fir_control = 1;// let fir start

    // source code is while(1){if(reg_fir_control==4) break;};
    while (1) {
        if (reg_la0_data_in > 0x1F4) {
            reg_mprj_datal = 0xAB410000;
            break;
        }
    }

	reg_mprj_datal = 0xAB510000;	
}

void delay(int n){
	int t1, t2, t3;
	t3 = t2 = t1 = n;
	
	while(t3-->0){
		while(t2-->0){
			while(t1-->0);
		}
	}
}

