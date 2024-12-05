# 0 "fir.c"
# 1 "/home/ubuntu/lab_4_2_optim/lab-caravel_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1
# 18 "fir.h"
int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

int outputsignal[64];
# 2 "fir.c" 2
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
# 3 "fir.c" 2


# 4 "fir.c"
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {


 (*(volatile uint32_t*)(0x30000010)) = 64;


 for (uint32_t i = 0; i < 11; i++) {
  (*(volatile uint32_t*)((0x30000040 + 4*i))) = taps[i];
 }

}

void __attribute__ ( ( section ( ".mprjram" ) ) ) fir_excute() {

 (*(volatile uint32_t*)(0x2600000C)) = 0x00A50000;


 (*(volatile uint32_t*)(0x30000000)) = 1;

 uint8_t register t = 0;

 (*(volatile uint32_t*)(0x30000080)) = t;

 t = t + 1;

 (*(volatile uint32_t*)(0x30000080)) = t;

 while (t < 64 -1) {
  outputsignal[t] = (*(volatile uint32_t*)(0x30000084));

  t = t + 1;

  (*(volatile uint32_t*)(0x30000080)) = t;
    }

 outputsignal[64 -1] = (*(volatile uint32_t*)(0x30000084));





 (*(volatile uint32_t*)(0x30000000));
 (*(volatile uint32_t*)(0x2600000C)) = outputsignal[64 -1] << 24 | 0x005A0000;
}
