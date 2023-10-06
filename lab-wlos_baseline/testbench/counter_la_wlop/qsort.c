#include "qsort.h"

int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
	int pivot = Q[hi];
	int i = low-1,j;
	int temp;
	for(j = low;j<hi;j++){
		if(Q[j] < pivot){
			i = i+1;
			temp = Q[i];
			Q[i] = Q[j];
			Q[j] = temp;
		}
	}
	if(Q[hi] < Q[i+1]){
		temp = Q[i+1];
		Q[i+1] = Q[hi];
		Q[hi] = temp;
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
	return Q;
}
