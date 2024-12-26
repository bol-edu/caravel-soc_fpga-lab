# 0 "qsort_cpu.c"
# 1 "/home/ubuntu/lab_6_wlos/testbench/uart//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "qsort_cpu.c"
# 1 "qsort.h" 1
# 10 "qsort.h"
int Q[10] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};

int result_q[10];
# 2 "qsort_cpu.c" 2

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
 sort(0,10 -1);
 return Q;
}
