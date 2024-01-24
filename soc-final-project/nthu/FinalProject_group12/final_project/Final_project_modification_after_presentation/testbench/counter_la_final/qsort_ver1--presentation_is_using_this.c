#include "qsort.h"
#include "fir.h"
#include "matmul.h"
#include <defs.h>

///// Modified by us by changing "A" array to "Target_array" array /////
int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
	int pivot = Target_array[hi];
	int i = low-1,j;
	int temp;

	// 記得要給DMA各data存放的base address !!!!!!!!!!!!
	for(j = low;j<hi;j++){
		if(Target_array[j] < pivot){
			i = i+1;
			temp = Target_array[i];
			Target_array[i] = Target_array[j];
			Target_array[j] = temp;
		}
	}
	if(Target_array[hi] < Target_array[i+1]){
		temp = Target_array[i+1];
		Target_array[i+1] = Target_array[hi];
		Target_array[hi] = temp;
	}
	return i+1;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) sort(int low, int hi){
	if(low < hi){
		int p = partition(low, hi);
		sort(low,p-1);
		sort(p+1,hi);
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
	sort(0,SIZE-1);
	return Target_array;
}


///////////////////////////////// Added /////////////////////////////////
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial fir
	for (int n = 0; n < DATA_LENGTH; n++) {
		x[n] = n;
	}
	/////for (int i = 0; i < N; i++) {
	/////	outputsignal[i] = 0; // the same meaning as "y[i]=0"
	/////}
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) hardware_accelerator_initialization(){
	
	//------------------------------- (FIR part) -------------------------------//
	initfir();

	int WB_return_data;
	int i;
	
	// check idle
	WB_return_data = *((int*)FIR_BASE_ADDRESS); //WB_read((int*)FIR_BASE_ADDRESS);
	while (((WB_return_data>>2)&1)==0){ // which means "ap_idle_done_start[2]==0"
		WB_return_data = *((int*)FIR_BASE_ADDRESS); //WB_read((int*)FIR_BASE_ADDRESS);
	}

	// Program length, and tap parameters
	*((int*)(FIR_BASE_ADDRESS+0x10))=DATA_LENGTH; //WB_write((int*)(FIR_BASE_ADDRESS+0x10), DATA_LENGTH);
	for(i=0; i<N; i=i+1){ // Here "N" means the number of taps, which is "11" in lab3
		*((int*)(FIR_BASE_ADDRESS+0x20+4*i))=taps[i]; //WB_write((int*)(FIR_BASE_ADDRESS+0x20+4*i), taps[i]);
	}

	// Provide the base address of x[n] array to DMA_FIR (base address configuration address map as 8'h88)
	*((int*)(FIR_BASE_ADDRESS+0x88))=(int)(&x); //WB_write((int*)(FIR_BASE_ADDRESS+0x88), &x);
	//reg_mprj_datal =(((int)(&x))<<16);
	//reg_mprj_datal = 0x00A50000;


	//------------------------------- (MM part) -------------------------------//

	// check idle
	WB_return_data = *((int*)MM_BASE_ADDRESS);
	while (((WB_return_data>>2)&1)==0){
		WB_return_data = *((int*)MM_BASE_ADDRESS);
	}

	// Provide the base address of A matrix (base address configuration address map as 8'h04) & B matrix (base address configuration address map as 8'h08) to DMA_MM
	*((int*)(MM_BASE_ADDRESS+0x04))=(int)(&A);
	*((int*)(MM_BASE_ADDRESS+0x08))=(int)(&B);


	//------------------------------- (FIR part) -------------------------------//
	// Program ap_start
	*((int*)(FIR_BASE_ADDRESS))=1; //WB_write((int*)(FIR_BASE_ADDRESS), 1); // which means "ap_idle_done_start==1"
	/////reg_mprj_datal = 0x00A50000; // start mark on mprj[23:16]


	//------------------------------- (MM part) -------------------------------//
	// Program ap_start
	*((int*)(MM_BASE_ADDRESS))=1;
	

}


int* __attribute__ ( ( section ( ".mprjram" ) ) ) hardware_accelerator_check_result_FIR(){

	//------------------------------- (FIR part) -------------------------------//
	/*int outputsignal[N];
	int i;
	for(i=0; i<N; i=i+1){
		outputsignal[i]=*((int*)FIR_BASE_ADDRESS+0x8C+4*i); //WB_read((int*)FIR_BASE_ADDRESS+0x8C+4*i);
	}
	return outputsignal[10];*/
	//outputsignal[0]=*((int*)(FIR_BASE_ADDRESS+0xB4));
	return (int*)(FIR_BASE_ADDRESS+0xB4);
}


int* __attribute__ ( ( section ( ".mprjram" ) ) ) hardware_accelerator_check_result_MM(){

	//------------------------------- (MM part) -------------------------------//
	return (int*)(MM_BASE_ADDRESS+0x48);
}
