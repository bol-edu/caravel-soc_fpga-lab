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


// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void main()
{
	int j = 0;
	int value;

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

	reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;

	reg_mprj_io_36 = GPIO_MODE_USER_STD_INPUT_NOPULL; //IO_CLK (from FPGA)
	reg_mprj_io_35 = GPIO_MODE_USER_STD_OUTPUT; //TXC
	reg_mprj_io_34 = GPIO_MODE_USER_STD_OUTPUT; //TXD[11:0]
	reg_mprj_io_33 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_32 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_31 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_30 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_29 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_28 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_27 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_26 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_25 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_24 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_23 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_22 = GPIO_MODE_USER_STD_OUTPUT;

	reg_mprj_io_21 = GPIO_MODE_USER_STD_INPUT_NOPULL;	//RXC
	reg_mprj_io_20 = GPIO_MODE_USER_STD_INPUT_NOPULL;	//RXD[12:0]
	reg_mprj_io_19 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_18 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_17 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_16 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_15 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_14 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_13 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_12 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_11 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_10 = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_9  = GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_8  = GPIO_MODE_USER_STD_INPUT_NOPULL;

	reg_mprj_io_7  = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
	reg_mprj_io_6  = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
	reg_mprj_io_5  = GPIO_MODE_MGMT_STD_INPUT_NOPULL;
	// reg_mprj_io_4  = GPIO_MODE_MGMT_STD_OUTPUT;
	// reg_mprj_io_3  = GPIO_MODE_MGMT_STD_OUTPUT;
	// reg_mprj_io_2  = GPIO_MODE_MGMT_STD_OUTPUT;
	// reg_mprj_io_1  = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_0  = GPIO_MODE_MGMT_STD_OUTPUT;

	// Now, apply the configuration
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

	reg_mprj_datah = 0x00;

       	// Checking FSIC AS Configuration Path
	value = reg_fsic_as;	
	if (value == 0x00000006) {
		reg_fsic_as = 0x00000006;		
		value = reg_fsic_as;			
		if(value == 0x00000006) {
			j += 0x01;
		}
	}	

	// Checking FSIC IS Configuration Path
	value = reg_fsic_is;	
	if (value == 0x00000000) {
		reg_fsic_is = 0x00000001;
		value = reg_fsic_is;			
		if(value == 0x00000001) {
			j += 0x02;
		}
	}		

	// Checking FSIC CC Configuration Path
	value = reg_fsic_cc;	
	if (value == 0x00000000) {
		reg_fsic_cc = 0x0000001F;		
		value = reg_fsic_cc;			
		if(value == 0x0000001F) {
			j += 0x04;
		}
	}	

	// Checking FSIC LA Configuration Path
	value = reg_fsic_la;	
	if (value == 0x00000000) {
		reg_fsic_la = 0x00000000;
		value = reg_fsic_la;			
		if(value == 0x00000000) {
			j += 0x08;
		}
	}

	while(1) {
		if (j==0xF) {
			reg_mprj_datah = 0x20;
			break;
		}
	}

	while(1) {
		value = reg_fsic_cc;
		switch (value)
		{
		case 5:
			reg_mprj_datah = 0x00;	//set mprj_io[37] to 1'b0 to indicate FW going to waiting fpga MB test
			reg_fsic_aa_mb0 = 0x5a5a5a5a;
			reg_fsic_cc = 0x00000004;
			reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b0 to indicate FW going to waiting fpga MB test
			break;
		case 6:
			reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 first
			reg_fsic_aa_irq_en = 1;
			value = reg_fsic_aa_irq_en;
			if (value==1) {
				reg_mprj_datah = 0x00;	//set mprj_io[37] to 1'b0 to indicate correct data
				reg_fsic_cc = 0x00000004;
			} else {
				reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 to indicate incorrect data
				reg_fsic_cc = 0x00000004;
			}		
			break;
		case 7:
			reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 first
			value = reg_fsic_aa_mb0;
			if (value==0x5555aaaa) {
				reg_mprj_datah = 0x00;	//set mprj_io[37] to 1'b0 to indicate correct data
				reg_fsic_cc = 0x00000004;
			} else {
				reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 to indicate incorrect data
				reg_fsic_cc = 0x00000004;
			}
			break;
		case 8:
			reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 first
			value = reg_fsic_aa_irq_sts;
			if (value==1) {
				reg_fsic_aa_irq_sts = 1;
				value = reg_fsic_aa_irq_sts;
				if (value==0) {
					reg_mprj_datah = 0x00;	//set mprj_io[37] to 1'b0 to indicate correct data
					reg_fsic_cc = 0x00000004;
				} else {
					reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 to indicate incorrect data
					reg_fsic_cc = 0x00000004;
				}
			} else {
				reg_mprj_datah = 0x20;	//set mprj_io[37] to 1'b1 to indicate incorrect data
				reg_fsic_cc = 0x00000004;
			}
			break;
		default:
			break;
		}
	}

}

