# 0 "fir_cpu.c"
# 1 "/home/ubuntu/lab_6_wlos/testbench/uart//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir_cpu.c"
# 1 "fir.h" 1
# 22 "fir.h"
int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

int inputbuffer[10];
int outputsignal[10];
int temp;
# 2 "fir_cpu.c" 2
# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 1 3 4
# 11 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 3 4
# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 1 3 4
# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4

# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4
typedef signed char int8_t;


typedef short int int16_t;


typedef long int int32_t;


typedef long long int int64_t;


typedef unsigned char uint8_t;


typedef short unsigned int uint16_t;


typedef long unsigned int uint32_t;


typedef long long unsigned int uint64_t;




typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef long int int_least32_t;
typedef long long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef short unsigned int uint_least16_t;
typedef long unsigned int uint_least32_t;
typedef long long unsigned int uint_least64_t;



typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef long long unsigned int uint_fast64_t;




typedef int intptr_t;


typedef unsigned int uintptr_t;




typedef long long int intmax_t;
typedef long long unsigned int uintmax_t;
# 12 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 2 3 4
# 3 "fir_cpu.c" 2


# 4 "fir_cpu.c"
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
 for(int i=0; i<10; i++) {
  inputbuffer[i] = 0;
  outputsignal[i] = 0;
 }
}

int __attribute__ ( ( section ( ".mprjram" ) ) ) firfilter(int inputsample){
 for(int i=10 -1; i>0; i--){
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




 for(int i=0; i<10; i++){
  outputsignal[i] = firfilter(i);

 }
 return outputsignal;
}
