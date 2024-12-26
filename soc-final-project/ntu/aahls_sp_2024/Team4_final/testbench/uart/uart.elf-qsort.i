# 0 "qsort.c"
# 1 "/home/ubuntu/lab_6_wlos/testbench/uart//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "qsort.c"
# 1 "qsort.h" 1
# 10 "qsort.h"
int Q[10] = {893, 40, 3233, 4267, 2669, 2541, 9073, 6023, 5681, 4622};

int result_q[10];
# 2 "qsort.c" 2
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
# 3 "qsort.c" 2


# 4 "qsort.c"
int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){

 (*(volatile uint32_t*)(0x2600000C)) = 0x00A50000;

 int i=0;

 for (i=0; i<10; i++){
        (*(volatile uint32_t*)(0x33000000)) = Q[i];
 }

    for (i=0; i<10; i++){
        result_q[i] = (*(volatile uint32_t*)(0x33000010));
 }
}
