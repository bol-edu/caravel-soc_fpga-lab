#include "fir.h"
#include <stdint.h>

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	for(int i=0; i<N; i++) {
		inputbuffer[i] = 0;
		outputsignal[i] = 0;
	}
}

int __attribute__ ( ( section ( ".mprjram" ) ) ) firfilter(int inputsample){
	for(int i=N-1; i>0; i--){
		inputbuffer[i] = inputbuffer[i-1];
	}
	inputbuffer[0] = inputsample;
	
	int outputsample = 0;
	for(int i=0; i<11; i++){
		outputsample += taps[i]*inputbuffer[i];
	}
	return outputsample;
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir_excute(){
	// initfir();

	// uint8_t register t = 0;

	for(int i=0; i<N; i++){
		outputsignal[i] = firfilter(i);
		// t = t+1;
	}
	return outputsignal;
}
		
