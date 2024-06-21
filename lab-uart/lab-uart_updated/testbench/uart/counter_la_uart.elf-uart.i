# 0 "../../firmware/uart.c"
# 1 "/home/ubuntu/Lab_UART_V2/testbench/uart//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "../../firmware/uart.c"
# 1 "../../firmware/defs.h" 1
# 21 "../../firmware/defs.h"
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
# 22 "../../firmware/defs.h" 2
# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdbool.h" 1 3 4
# 23 "../../firmware/defs.h" 2

# 1 "../../firmware/csr.h" 1



# 1 "../../firmware/generated/soc.h" 1
# 33 "../../firmware/generated/soc.h"

# 33 "../../firmware/generated/soc.h"
static inline int config_clock_frequency_read(void) {
 return 10000000;
}
static inline int config_cpu_reset_addr_read(void) {
 return 268435456;
}
static inline const char * config_cpu_human_name_read(void) {
 return "VexRiscv_MinDebug";
}
static inline const char * config_cpu_nop_read(void) {
 return "nop";
}
static inline int spiflash_phy_frequency_read(void) {
 return 10000000;
}
static inline const char * spiflash_module_name_read(void) {
 return "W25Q128JV";
}
static inline int spiflash_module_total_size_read(void) {
 return 16777216;
}
static inline int spiflash_module_page_size_read(void) {
 return 256;
}
static inline int config_csr_data_width_read(void) {
 return 32;
}
static inline int config_csr_alignment_read(void) {
 return 32;
}
static inline const char * config_bus_standard_read(void) {
 return "WISHBONE";
}
static inline int config_bus_data_width_read(void) {
 return 32;
}
static inline int config_bus_address_width_read(void) {
 return 32;
}
static inline int timer0_interrupt_read(void) {
 return 0;
}
static inline int uart_interrupt_read(void) {
 return 1;
}
static inline int user_irq_0_interrupt_read(void) {
 return 2;
}
static inline int user_irq_1_interrupt_read(void) {
 return 3;
}
static inline int user_irq_2_interrupt_read(void) {
 return 4;
}
static inline int user_irq_3_interrupt_read(void) {
 return 5;
}
static inline int user_irq_4_interrupt_read(void) {
 return 6;
}
static inline int user_irq_5_interrupt_read(void) {
 return 7;
}
# 5 "../../firmware/csr.h" 2



# 1 "../../firmware/system.h" 1



# 1 "../../firmware/csr-defs.h" 1
# 5 "../../firmware/system.h" 2

# 1 "../../firmware/soc.h" 1
# 7 "../../firmware/system.h" 2







__attribute__((unused)) static void flush_cpu_icache(void)
{
# 26 "../../firmware/system.h"
}

__attribute__((unused)) static void flush_cpu_dcache(void)
{



}

void flush_l2_cache(void);

void busy_wait(unsigned int ms);
void busy_wait_us(unsigned int us);
# 9 "../../firmware/csr.h" 2

# 1 "../../firmware/hw/common.h" 1
# 32 "../../firmware/hw/common.h"
static inline void csr_write_simple(unsigned long v, unsigned long a)
{
 (*((volatile uint32_t *)(a))) = v;
}

static inline unsigned long csr_read_simple(unsigned long a)
{
 return (*((volatile uint32_t *)(a)));
}
# 65 "../../firmware/hw/common.h"
static inline int num_subregs(int csr_bytes)
{
 return (csr_bytes - 1) / (32/8) + 1;
}


static inline uint64_t _csr_rd(unsigned long a, int csr_bytes)
{
 uint64_t r = csr_read_simple(a);
 for (int i = 1; i < num_subregs(csr_bytes); i++) {
  r <<= 32;
  a += 4;
  r |= csr_read_simple(a);
 }
 return r;
}


static inline void _csr_wr(unsigned long a, uint64_t v, int csr_bytes)
{
 int ns = num_subregs(csr_bytes);
 for (int i = 0; i < ns; i++) {
  csr_write_simple(v >> (32 * (ns - 1 - i)), a);
  a += 4;
 }
}



static inline uint8_t csr_rd_uint8(unsigned long a)
{
 return _csr_rd(a, sizeof(uint8_t));
}

static inline void csr_wr_uint8(uint8_t v, unsigned long a)
{
 _csr_wr(a, v, sizeof(uint8_t));
}

static inline uint16_t csr_rd_uint16(unsigned long a)
{
 return _csr_rd(a, sizeof(uint16_t));
}

static inline void csr_wr_uint16(uint16_t v, unsigned long a)
{
 _csr_wr(a, v, sizeof(uint16_t));
}

static inline uint32_t csr_rd_uint32(unsigned long a)
{
 return _csr_rd(a, sizeof(uint32_t));
}

static inline void csr_wr_uint32(uint32_t v, unsigned long a)
{
 _csr_wr(a, v, sizeof(uint32_t));
}

static inline uint64_t csr_rd_uint64(unsigned long a)
{
 return _csr_rd(a, sizeof(uint64_t));
}

static inline void csr_wr_uint64(uint64_t v, unsigned long a)
{
 _csr_wr(a, v, sizeof(uint64_t));
}
# 208 "../../firmware/hw/common.h"
static inline void csr_rd_buf_uint8(unsigned long a, uint8_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t r; if (sizeof(buf[0]) >= (32/8)) { for (i=0; i<cnt; i++) { buf[i] = _csr_rd(a, sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i=0; i<nsubregs; i++) { r = csr_read_simple(a); for (j= nsubelems - 1; j >= 0; j--) { if ((i * nsubelems + j - offset) >= 0) { buf[i * nsubelems + j - offset] = r; r >>= sizeof(buf[0]) * 8; } } a += 4; } } };
}

static inline void csr_wr_buf_uint8(unsigned long a,
     const uint8_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t v; if (sizeof(buf[0]) >= (32/8)) { for (i = 0; i < cnt; i++) { _csr_wr(a, buf[i], sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i = 0; i < nsubregs; i++) { v = 0; for (j= 0; j < nsubelems; j++) { if ((i * nsubelems + j - offset) >= 0) { v <<= sizeof(buf[0]) * 8; v |= buf[i * nsubelems + j - offset]; } } csr_write_simple(v, a); a += 4; } } };
}

static inline void csr_rd_buf_uint16(unsigned long a, uint16_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t r; if (sizeof(buf[0]) >= (32/8)) { for (i=0; i<cnt; i++) { buf[i] = _csr_rd(a, sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i=0; i<nsubregs; i++) { r = csr_read_simple(a); for (j= nsubelems - 1; j >= 0; j--) { if ((i * nsubelems + j - offset) >= 0) { buf[i * nsubelems + j - offset] = r; r >>= sizeof(buf[0]) * 8; } } a += 4; } } };
}

static inline void csr_wr_buf_uint16(unsigned long a,
     const uint16_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t v; if (sizeof(buf[0]) >= (32/8)) { for (i = 0; i < cnt; i++) { _csr_wr(a, buf[i], sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i = 0; i < nsubregs; i++) { v = 0; for (j= 0; j < nsubelems; j++) { if ((i * nsubelems + j - offset) >= 0) { v <<= sizeof(buf[0]) * 8; v |= buf[i * nsubelems + j - offset]; } } csr_write_simple(v, a); a += 4; } } };
}

static inline void csr_rd_buf_uint32(unsigned long a, uint32_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t r; if (sizeof(buf[0]) >= (32/8)) { for (i=0; i<cnt; i++) { buf[i] = _csr_rd(a, sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i=0; i<nsubregs; i++) { r = csr_read_simple(a); for (j= nsubelems - 1; j >= 0; j--) { if ((i * nsubelems + j - offset) >= 0) { buf[i * nsubelems + j - offset] = r; r >>= sizeof(buf[0]) * 8; } } a += 4; } } };
}

static inline void csr_wr_buf_uint32(unsigned long a,
     const uint32_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t v; if (sizeof(buf[0]) >= (32/8)) { for (i = 0; i < cnt; i++) { _csr_wr(a, buf[i], sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i = 0; i < nsubregs; i++) { v = 0; for (j= 0; j < nsubelems; j++) { if ((i * nsubelems + j - offset) >= 0) { v <<= sizeof(buf[0]) * 8; v |= buf[i * nsubelems + j - offset]; } } csr_write_simple(v, a); a += 4; } } };
}



#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wshift-count-overflow"
static inline void csr_rd_buf_uint64(unsigned long a, uint64_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t r; if (sizeof(buf[0]) >= (32/8)) { for (i=0; i<cnt; i++) { buf[i] = _csr_rd(a, sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i=0; i<nsubregs; i++) { r = csr_read_simple(a); for (j= nsubelems - 1; j >= 0; j--) { if ((i * nsubelems + j - offset) >= 0) { buf[i * nsubelems + j - offset] = r; r >>= sizeof(buf[0]) * 8; } } a += 4; } } };
}

static inline void csr_wr_buf_uint64(unsigned long a,
     const uint64_t *buf, int cnt)
{
 { int i, j, offset, nsubregs, nsubelems; uint64_t v; if (sizeof(buf[0]) >= (32/8)) { for (i = 0; i < cnt; i++) { _csr_wr(a, buf[i], sizeof(buf[0])); a += 4 * num_subregs(sizeof(buf[0])); } } else { nsubregs = num_subregs(sizeof(buf[0]) * cnt); nsubelems = (32/8) / sizeof(buf[0]); offset = nsubregs*nsubelems - cnt; for (i = 0; i < nsubregs; i++) { v = 0; for (j= 0; j < nsubelems; j++) { if ((i * nsubelems + j - offset) >= 0) { v <<= sizeof(buf[0]) * 8; v |= buf[i * nsubelems + j - offset]; } } csr_write_simple(v, a); a += 4; } } };
}
#pragma GCC diagnostic pop
# 11 "../../firmware/csr.h" 2
# 20 "../../firmware/csr.h"
static inline uint32_t ctrl_reset_read(void) {
 return csr_read_simple(0xf0000000L + 0x0L);
}
static inline void ctrl_reset_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x0L);
}


static inline uint32_t ctrl_reset_soc_rst_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t ctrl_reset_soc_rst_read(void) {
 uint32_t word = ctrl_reset_read();
 return ctrl_reset_soc_rst_extract(word);
}
static inline uint32_t ctrl_reset_soc_rst_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void ctrl_reset_soc_rst_write(uint32_t plain_value) {
 uint32_t oldword = ctrl_reset_read();
 uint32_t newword = ctrl_reset_soc_rst_replace(oldword, plain_value);
 ctrl_reset_write(newword);
}


static inline uint32_t ctrl_reset_cpu_rst_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 1) & mask );
}
static inline uint32_t ctrl_reset_cpu_rst_read(void) {
 uint32_t word = ctrl_reset_read();
 return ctrl_reset_cpu_rst_extract(word);
}
static inline uint32_t ctrl_reset_cpu_rst_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 1))) | (mask & plain_value)<< 1 ;
}
static inline void ctrl_reset_cpu_rst_write(uint32_t plain_value) {
 uint32_t oldword = ctrl_reset_read();
 uint32_t newword = ctrl_reset_cpu_rst_replace(oldword, plain_value);
 ctrl_reset_write(newword);
}


static inline uint32_t ctrl_scratch_read(void) {
 return csr_read_simple(0xf0000000L + 0x4L);
}
static inline void ctrl_scratch_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4L);
}


static inline uint32_t ctrl_bus_errors_read(void) {
 return csr_read_simple(0xf0000000L + 0x8L);
}





static inline uint32_t debug_mode_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x800L);
}
static inline void debug_mode_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x800L);
}





static inline uint32_t debug_oeb_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x1000L);
}
static inline void debug_oeb_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x1000L);
}





static inline uint32_t flash_core_mmap_dummy_bits_read(void) {
 return csr_read_simple(0xf0000000L + 0x1800L);
}
static inline void flash_core_mmap_dummy_bits_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x1800L);
}


static inline uint32_t flash_core_master_cs_read(void) {
 return csr_read_simple(0xf0000000L + 0x1804L);
}
static inline void flash_core_master_cs_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x1804L);
}


static inline uint32_t flash_core_master_phyconfig_read(void) {
 return csr_read_simple(0xf0000000L + 0x1808L);
}
static inline void flash_core_master_phyconfig_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x1808L);
}


static inline uint32_t flash_core_master_phyconfig_len_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 8)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t flash_core_master_phyconfig_len_read(void) {
 uint32_t word = flash_core_master_phyconfig_read();
 return flash_core_master_phyconfig_len_extract(word);
}
static inline uint32_t flash_core_master_phyconfig_len_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 8)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void flash_core_master_phyconfig_len_write(uint32_t plain_value) {
 uint32_t oldword = flash_core_master_phyconfig_read();
 uint32_t newword = flash_core_master_phyconfig_len_replace(oldword, plain_value);
 flash_core_master_phyconfig_write(newword);
}


static inline uint32_t flash_core_master_phyconfig_width_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 4)-1);
 return ( (oldword >> 8) & mask );
}
static inline uint32_t flash_core_master_phyconfig_width_read(void) {
 uint32_t word = flash_core_master_phyconfig_read();
 return flash_core_master_phyconfig_width_extract(word);
}
static inline uint32_t flash_core_master_phyconfig_width_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 4)-1);
 return (oldword & (~(mask << 8))) | (mask & plain_value)<< 8 ;
}
static inline void flash_core_master_phyconfig_width_write(uint32_t plain_value) {
 uint32_t oldword = flash_core_master_phyconfig_read();
 uint32_t newword = flash_core_master_phyconfig_width_replace(oldword, plain_value);
 flash_core_master_phyconfig_write(newword);
}


static inline uint32_t flash_core_master_phyconfig_mask_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 8)-1);
 return ( (oldword >> 16) & mask );
}
static inline uint32_t flash_core_master_phyconfig_mask_read(void) {
 uint32_t word = flash_core_master_phyconfig_read();
 return flash_core_master_phyconfig_mask_extract(word);
}
static inline uint32_t flash_core_master_phyconfig_mask_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 8)-1);
 return (oldword & (~(mask << 16))) | (mask & plain_value)<< 16 ;
}
static inline void flash_core_master_phyconfig_mask_write(uint32_t plain_value) {
 uint32_t oldword = flash_core_master_phyconfig_read();
 uint32_t newword = flash_core_master_phyconfig_mask_replace(oldword, plain_value);
 flash_core_master_phyconfig_write(newword);
}


static inline uint32_t flash_core_master_rxtx_read(void) {
 return csr_read_simple(0xf0000000L + 0x180cL);
}
static inline void flash_core_master_rxtx_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x180cL);
}


static inline uint32_t flash_core_master_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x1810L);
}


static inline uint32_t flash_core_master_status_tx_ready_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t flash_core_master_status_tx_ready_read(void) {
 uint32_t word = flash_core_master_status_read();
 return flash_core_master_status_tx_ready_extract(word);
}


static inline uint32_t flash_core_master_status_rx_ready_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 1) & mask );
}
static inline uint32_t flash_core_master_status_rx_ready_read(void) {
 uint32_t word = flash_core_master_status_read();
 return flash_core_master_status_rx_ready_extract(word);
}





static inline uint32_t flash_phy_clk_divisor_read(void) {
 return csr_read_simple(0xf0000000L + 0x2000L);
}
static inline void flash_phy_clk_divisor_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x2000L);
}





static inline uint32_t gpio_mode1_read(void) {
 return csr_read_simple(0xf0000000L + 0x2800L);
}
static inline void gpio_mode1_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x2800L);
}


static inline uint32_t gpio_mode0_read(void) {
 return csr_read_simple(0xf0000000L + 0x2804L);
}
static inline void gpio_mode0_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x2804L);
}


static inline uint32_t gpio_ien_read(void) {
 return csr_read_simple(0xf0000000L + 0x2808L);
}
static inline void gpio_ien_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x2808L);
}


static inline uint32_t gpio_oe_read(void) {
 return csr_read_simple(0xf0000000L + 0x280cL);
}
static inline void gpio_oe_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x280cL);
}


static inline uint32_t gpio_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x2810L);
}


static inline uint32_t gpio_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x2814L);
}
static inline void gpio_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x2814L);
}
# 291 "../../firmware/csr.h"
static inline uint32_t mprj_wb_iena_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x3800L);
}
static inline void mprj_wb_iena_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x3800L);
}





static inline uint32_t spi_enabled_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x4000L);
}
static inline void spi_enabled_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4000L);
}





static inline uint32_t spi_master_control_read(void) {
 return csr_read_simple(0xf0000000L + 0x4800L);
}
static inline void spi_master_control_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4800L);
}


static inline uint32_t spi_master_control_start_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t spi_master_control_start_read(void) {
 uint32_t word = spi_master_control_read();
 return spi_master_control_start_extract(word);
}
static inline uint32_t spi_master_control_start_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void spi_master_control_start_write(uint32_t plain_value) {
 uint32_t oldword = spi_master_control_read();
 uint32_t newword = spi_master_control_start_replace(oldword, plain_value);
 spi_master_control_write(newword);
}


static inline uint32_t spi_master_control_length_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 8)-1);
 return ( (oldword >> 8) & mask );
}
static inline uint32_t spi_master_control_length_read(void) {
 uint32_t word = spi_master_control_read();
 return spi_master_control_length_extract(word);
}
static inline uint32_t spi_master_control_length_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 8)-1);
 return (oldword & (~(mask << 8))) | (mask & plain_value)<< 8 ;
}
static inline void spi_master_control_length_write(uint32_t plain_value) {
 uint32_t oldword = spi_master_control_read();
 uint32_t newword = spi_master_control_length_replace(oldword, plain_value);
 spi_master_control_write(newword);
}


static inline uint32_t spi_master_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x4804L);
}


static inline uint32_t spi_master_status_done_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t spi_master_status_done_read(void) {
 uint32_t word = spi_master_status_read();
 return spi_master_status_done_extract(word);
}


static inline uint32_t spi_master_mosi_read(void) {
 return csr_read_simple(0xf0000000L + 0x4808L);
}
static inline void spi_master_mosi_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4808L);
}


static inline uint32_t spi_master_miso_read(void) {
 return csr_read_simple(0xf0000000L + 0x480cL);
}


static inline uint32_t spi_master_cs_read(void) {
 return csr_read_simple(0xf0000000L + 0x4810L);
}
static inline void spi_master_cs_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4810L);
}


static inline uint32_t spi_master_cs_sel_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t spi_master_cs_sel_read(void) {
 uint32_t word = spi_master_cs_read();
 return spi_master_cs_sel_extract(word);
}
static inline uint32_t spi_master_cs_sel_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void spi_master_cs_sel_write(uint32_t plain_value) {
 uint32_t oldword = spi_master_cs_read();
 uint32_t newword = spi_master_cs_sel_replace(oldword, plain_value);
 spi_master_cs_write(newword);
}


static inline uint32_t spi_master_cs_mode_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 16) & mask );
}
static inline uint32_t spi_master_cs_mode_read(void) {
 uint32_t word = spi_master_cs_read();
 return spi_master_cs_mode_extract(word);
}
static inline uint32_t spi_master_cs_mode_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 16))) | (mask & plain_value)<< 16 ;
}
static inline void spi_master_cs_mode_write(uint32_t plain_value) {
 uint32_t oldword = spi_master_cs_read();
 uint32_t newword = spi_master_cs_mode_replace(oldword, plain_value);
 spi_master_cs_write(newword);
}


static inline uint32_t spi_master_loopback_read(void) {
 return csr_read_simple(0xf0000000L + 0x4814L);
}
static inline void spi_master_loopback_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4814L);
}


static inline uint32_t spi_master_loopback_mode_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t spi_master_loopback_mode_read(void) {
 uint32_t word = spi_master_loopback_read();
 return spi_master_loopback_mode_extract(word);
}
static inline uint32_t spi_master_loopback_mode_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void spi_master_loopback_mode_write(uint32_t plain_value) {
 uint32_t oldword = spi_master_loopback_read();
 uint32_t newword = spi_master_loopback_mode_replace(oldword, plain_value);
 spi_master_loopback_write(newword);
}


static inline uint32_t spi_master_clk_divider_read(void) {
 return csr_read_simple(0xf0000000L + 0x4818L);
}
static inline void spi_master_clk_divider_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x4818L);
}





static inline uint32_t timer0_load_read(void) {
 return csr_read_simple(0xf0000000L + 0x5000L);
}
static inline void timer0_load_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5000L);
}


static inline uint32_t timer0_reload_read(void) {
 return csr_read_simple(0xf0000000L + 0x5004L);
}
static inline void timer0_reload_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5004L);
}


static inline uint32_t timer0_en_read(void) {
 return csr_read_simple(0xf0000000L + 0x5008L);
}
static inline void timer0_en_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5008L);
}


static inline uint32_t timer0_update_value_read(void) {
 return csr_read_simple(0xf0000000L + 0x500cL);
}
static inline void timer0_update_value_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x500cL);
}


static inline uint32_t timer0_value_read(void) {
 return csr_read_simple(0xf0000000L + 0x5010L);
}


static inline uint32_t timer0_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x5014L);
}


static inline uint32_t timer0_ev_status_zero_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t timer0_ev_status_zero_read(void) {
 uint32_t word = timer0_ev_status_read();
 return timer0_ev_status_zero_extract(word);
}


static inline uint32_t timer0_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x5018L);
}
static inline void timer0_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5018L);
}


static inline uint32_t timer0_ev_pending_zero_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t timer0_ev_pending_zero_read(void) {
 uint32_t word = timer0_ev_pending_read();
 return timer0_ev_pending_zero_extract(word);
}
static inline uint32_t timer0_ev_pending_zero_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void timer0_ev_pending_zero_write(uint32_t plain_value) {
 uint32_t oldword = timer0_ev_pending_read();
 uint32_t newword = timer0_ev_pending_zero_replace(oldword, plain_value);
 timer0_ev_pending_write(newword);
}


static inline uint32_t timer0_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x501cL);
}
static inline void timer0_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x501cL);
}


static inline uint32_t timer0_ev_enable_zero_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t timer0_ev_enable_zero_read(void) {
 uint32_t word = timer0_ev_enable_read();
 return timer0_ev_enable_zero_extract(word);
}
static inline uint32_t timer0_ev_enable_zero_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void timer0_ev_enable_zero_write(uint32_t plain_value) {
 uint32_t oldword = timer0_ev_enable_read();
 uint32_t newword = timer0_ev_enable_zero_replace(oldword, plain_value);
 timer0_ev_enable_write(newword);
}





static inline uint32_t uart_rxtx_read(void) {
 return csr_read_simple(0xf0000000L + 0x5800L);
}
static inline void uart_rxtx_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5800L);
}


static inline uint32_t uart_txfull_read(void) {
 return csr_read_simple(0xf0000000L + 0x5804L);
}


static inline uint32_t uart_rxempty_read(void) {
 return csr_read_simple(0xf0000000L + 0x5808L);
}


static inline uint32_t uart_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x580cL);
}


static inline uint32_t uart_ev_status_tx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t uart_ev_status_tx_read(void) {
 uint32_t word = uart_ev_status_read();
 return uart_ev_status_tx_extract(word);
}


static inline uint32_t uart_ev_status_rx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 1) & mask );
}
static inline uint32_t uart_ev_status_rx_read(void) {
 uint32_t word = uart_ev_status_read();
 return uart_ev_status_rx_extract(word);
}


static inline uint32_t uart_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x5810L);
}
static inline void uart_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5810L);
}


static inline uint32_t uart_ev_pending_tx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t uart_ev_pending_tx_read(void) {
 uint32_t word = uart_ev_pending_read();
 return uart_ev_pending_tx_extract(word);
}
static inline uint32_t uart_ev_pending_tx_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void uart_ev_pending_tx_write(uint32_t plain_value) {
 uint32_t oldword = uart_ev_pending_read();
 uint32_t newword = uart_ev_pending_tx_replace(oldword, plain_value);
 uart_ev_pending_write(newword);
}


static inline uint32_t uart_ev_pending_rx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 1) & mask );
}
static inline uint32_t uart_ev_pending_rx_read(void) {
 uint32_t word = uart_ev_pending_read();
 return uart_ev_pending_rx_extract(word);
}
static inline uint32_t uart_ev_pending_rx_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 1))) | (mask & plain_value)<< 1 ;
}
static inline void uart_ev_pending_rx_write(uint32_t plain_value) {
 uint32_t oldword = uart_ev_pending_read();
 uint32_t newword = uart_ev_pending_rx_replace(oldword, plain_value);
 uart_ev_pending_write(newword);
}


static inline uint32_t uart_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x5814L);
}
static inline void uart_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x5814L);
}


static inline uint32_t uart_ev_enable_tx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t uart_ev_enable_tx_read(void) {
 uint32_t word = uart_ev_enable_read();
 return uart_ev_enable_tx_extract(word);
}
static inline uint32_t uart_ev_enable_tx_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void uart_ev_enable_tx_write(uint32_t plain_value) {
 uint32_t oldword = uart_ev_enable_read();
 uint32_t newword = uart_ev_enable_tx_replace(oldword, plain_value);
 uart_ev_enable_write(newword);
}


static inline uint32_t uart_ev_enable_rx_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 1) & mask );
}
static inline uint32_t uart_ev_enable_rx_read(void) {
 uint32_t word = uart_ev_enable_read();
 return uart_ev_enable_rx_extract(word);
}
static inline uint32_t uart_ev_enable_rx_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 1))) | (mask & plain_value)<< 1 ;
}
static inline void uart_ev_enable_rx_write(uint32_t plain_value) {
 uint32_t oldword = uart_ev_enable_read();
 uint32_t newword = uart_ev_enable_rx_replace(oldword, plain_value);
 uart_ev_enable_write(newword);
}


static inline uint32_t uart_txempty_read(void) {
 return csr_read_simple(0xf0000000L + 0x5818L);
}


static inline uint32_t uart_rxfull_read(void) {
 return csr_read_simple(0xf0000000L + 0x581cL);
}





static inline uint32_t uart_enabled_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x6000L);
}
static inline void uart_enabled_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x6000L);
}





static inline uint32_t user_irq_0_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x6800L);
}


static inline uint32_t user_irq_0_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x6804L);
}
static inline void user_irq_0_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x6804L);
}


static inline uint32_t user_irq_0_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x6808L);
}
static inline void user_irq_0_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x6808L);
}


static inline uint32_t user_irq_0_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x680cL);
}


static inline uint32_t user_irq_0_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_0_ev_status_i0_read(void) {
 uint32_t word = user_irq_0_ev_status_read();
 return user_irq_0_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_0_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x6810L);
}
static inline void user_irq_0_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x6810L);
}


static inline uint32_t user_irq_0_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_0_ev_pending_i0_read(void) {
 uint32_t word = user_irq_0_ev_pending_read();
 return user_irq_0_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_0_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_0_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_0_ev_pending_read();
 uint32_t newword = user_irq_0_ev_pending_i0_replace(oldword, plain_value);
 user_irq_0_ev_pending_write(newword);
}


static inline uint32_t user_irq_0_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x6814L);
}
static inline void user_irq_0_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x6814L);
}


static inline uint32_t user_irq_0_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_0_ev_enable_i0_read(void) {
 uint32_t word = user_irq_0_ev_enable_read();
 return user_irq_0_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_0_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_0_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_0_ev_enable_read();
 uint32_t newword = user_irq_0_ev_enable_i0_replace(oldword, plain_value);
 user_irq_0_ev_enable_write(newword);
}





static inline uint32_t user_irq_1_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x7000L);
}


static inline uint32_t user_irq_1_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x7004L);
}
static inline void user_irq_1_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7004L);
}


static inline uint32_t user_irq_1_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x7008L);
}
static inline void user_irq_1_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7008L);
}


static inline uint32_t user_irq_1_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x700cL);
}


static inline uint32_t user_irq_1_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_1_ev_status_i0_read(void) {
 uint32_t word = user_irq_1_ev_status_read();
 return user_irq_1_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_1_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x7010L);
}
static inline void user_irq_1_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7010L);
}


static inline uint32_t user_irq_1_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_1_ev_pending_i0_read(void) {
 uint32_t word = user_irq_1_ev_pending_read();
 return user_irq_1_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_1_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_1_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_1_ev_pending_read();
 uint32_t newword = user_irq_1_ev_pending_i0_replace(oldword, plain_value);
 user_irq_1_ev_pending_write(newword);
}


static inline uint32_t user_irq_1_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x7014L);
}
static inline void user_irq_1_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7014L);
}


static inline uint32_t user_irq_1_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_1_ev_enable_i0_read(void) {
 uint32_t word = user_irq_1_ev_enable_read();
 return user_irq_1_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_1_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_1_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_1_ev_enable_read();
 uint32_t newword = user_irq_1_ev_enable_i0_replace(oldword, plain_value);
 user_irq_1_ev_enable_write(newword);
}





static inline uint32_t user_irq_2_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x7800L);
}


static inline uint32_t user_irq_2_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x7804L);
}
static inline void user_irq_2_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7804L);
}


static inline uint32_t user_irq_2_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x7808L);
}
static inline void user_irq_2_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7808L);
}


static inline uint32_t user_irq_2_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x780cL);
}


static inline uint32_t user_irq_2_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_2_ev_status_i0_read(void) {
 uint32_t word = user_irq_2_ev_status_read();
 return user_irq_2_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_2_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x7810L);
}
static inline void user_irq_2_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7810L);
}


static inline uint32_t user_irq_2_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_2_ev_pending_i0_read(void) {
 uint32_t word = user_irq_2_ev_pending_read();
 return user_irq_2_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_2_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_2_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_2_ev_pending_read();
 uint32_t newword = user_irq_2_ev_pending_i0_replace(oldword, plain_value);
 user_irq_2_ev_pending_write(newword);
}


static inline uint32_t user_irq_2_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x7814L);
}
static inline void user_irq_2_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x7814L);
}


static inline uint32_t user_irq_2_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_2_ev_enable_i0_read(void) {
 uint32_t word = user_irq_2_ev_enable_read();
 return user_irq_2_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_2_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_2_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_2_ev_enable_read();
 uint32_t newword = user_irq_2_ev_enable_i0_replace(oldword, plain_value);
 user_irq_2_ev_enable_write(newword);
}





static inline uint32_t user_irq_3_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x8000L);
}


static inline uint32_t user_irq_3_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x8004L);
}
static inline void user_irq_3_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8004L);
}


static inline uint32_t user_irq_3_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x8008L);
}
static inline void user_irq_3_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8008L);
}


static inline uint32_t user_irq_3_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x800cL);
}


static inline uint32_t user_irq_3_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_3_ev_status_i0_read(void) {
 uint32_t word = user_irq_3_ev_status_read();
 return user_irq_3_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_3_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x8010L);
}
static inline void user_irq_3_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8010L);
}


static inline uint32_t user_irq_3_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_3_ev_pending_i0_read(void) {
 uint32_t word = user_irq_3_ev_pending_read();
 return user_irq_3_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_3_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_3_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_3_ev_pending_read();
 uint32_t newword = user_irq_3_ev_pending_i0_replace(oldword, plain_value);
 user_irq_3_ev_pending_write(newword);
}


static inline uint32_t user_irq_3_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x8014L);
}
static inline void user_irq_3_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8014L);
}


static inline uint32_t user_irq_3_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_3_ev_enable_i0_read(void) {
 uint32_t word = user_irq_3_ev_enable_read();
 return user_irq_3_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_3_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_3_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_3_ev_enable_read();
 uint32_t newword = user_irq_3_ev_enable_i0_replace(oldword, plain_value);
 user_irq_3_ev_enable_write(newword);
}





static inline uint32_t user_irq_4_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x8800L);
}


static inline uint32_t user_irq_4_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x8804L);
}
static inline void user_irq_4_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8804L);
}


static inline uint32_t user_irq_4_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x8808L);
}
static inline void user_irq_4_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8808L);
}


static inline uint32_t user_irq_4_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x880cL);
}


static inline uint32_t user_irq_4_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_4_ev_status_i0_read(void) {
 uint32_t word = user_irq_4_ev_status_read();
 return user_irq_4_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_4_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x8810L);
}
static inline void user_irq_4_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8810L);
}


static inline uint32_t user_irq_4_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_4_ev_pending_i0_read(void) {
 uint32_t word = user_irq_4_ev_pending_read();
 return user_irq_4_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_4_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_4_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_4_ev_pending_read();
 uint32_t newword = user_irq_4_ev_pending_i0_replace(oldword, plain_value);
 user_irq_4_ev_pending_write(newword);
}


static inline uint32_t user_irq_4_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x8814L);
}
static inline void user_irq_4_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x8814L);
}


static inline uint32_t user_irq_4_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_4_ev_enable_i0_read(void) {
 uint32_t word = user_irq_4_ev_enable_read();
 return user_irq_4_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_4_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_4_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_4_ev_enable_read();
 uint32_t newword = user_irq_4_ev_enable_i0_replace(oldword, plain_value);
 user_irq_4_ev_enable_write(newword);
}





static inline uint32_t user_irq_5_in_read(void) {
 return csr_read_simple(0xf0000000L + 0x9000L);
}


static inline uint32_t user_irq_5_mode_read(void) {
 return csr_read_simple(0xf0000000L + 0x9004L);
}
static inline void user_irq_5_mode_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x9004L);
}


static inline uint32_t user_irq_5_edge_read(void) {
 return csr_read_simple(0xf0000000L + 0x9008L);
}
static inline void user_irq_5_edge_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x9008L);
}


static inline uint32_t user_irq_5_ev_status_read(void) {
 return csr_read_simple(0xf0000000L + 0x900cL);
}


static inline uint32_t user_irq_5_ev_status_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_5_ev_status_i0_read(void) {
 uint32_t word = user_irq_5_ev_status_read();
 return user_irq_5_ev_status_i0_extract(word);
}


static inline uint32_t user_irq_5_ev_pending_read(void) {
 return csr_read_simple(0xf0000000L + 0x9010L);
}
static inline void user_irq_5_ev_pending_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x9010L);
}


static inline uint32_t user_irq_5_ev_pending_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_5_ev_pending_i0_read(void) {
 uint32_t word = user_irq_5_ev_pending_read();
 return user_irq_5_ev_pending_i0_extract(word);
}
static inline uint32_t user_irq_5_ev_pending_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_5_ev_pending_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_5_ev_pending_read();
 uint32_t newword = user_irq_5_ev_pending_i0_replace(oldword, plain_value);
 user_irq_5_ev_pending_write(newword);
}


static inline uint32_t user_irq_5_ev_enable_read(void) {
 return csr_read_simple(0xf0000000L + 0x9014L);
}
static inline void user_irq_5_ev_enable_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x9014L);
}


static inline uint32_t user_irq_5_ev_enable_i0_extract(uint32_t oldword) {
 uint32_t mask = ((1 << 1)-1);
 return ( (oldword >> 0) & mask );
}
static inline uint32_t user_irq_5_ev_enable_i0_read(void) {
 uint32_t word = user_irq_5_ev_enable_read();
 return user_irq_5_ev_enable_i0_extract(word);
}
static inline uint32_t user_irq_5_ev_enable_i0_replace(uint32_t oldword, uint32_t plain_value) {
 uint32_t mask = ((1 << 1)-1);
 return (oldword & (~(mask << 0))) | (mask & plain_value)<< 0 ;
}
static inline void user_irq_5_ev_enable_i0_write(uint32_t plain_value) {
 uint32_t oldword = user_irq_5_ev_enable_read();
 uint32_t newword = user_irq_5_ev_enable_i0_replace(oldword, plain_value);
 user_irq_5_ev_enable_write(newword);
}





static inline uint32_t user_irq_ena_out_read(void) {
 return csr_read_simple(0xf0000000L + 0x9800L);
}
static inline void user_irq_ena_out_write(uint32_t v) {
 csr_write_simple(v, 0xf0000000L + 0x9800L);
}
# 25 "../../firmware/defs.h" 2
# 1 "../../firmware/caravel.h" 1
# 26 "../../firmware/defs.h" 2



extern uint32_t sram;


extern uint32_t flashio_worker_begin;
extern uint32_t flashio_worker_end;
# 2 "../../firmware/uart.c" 2
# 1 "../../firmware/user_uart.h" 1
# 3 "../../firmware/uart.c" 2
# 1 "../../firmware/irq_vex.h" 1
# 9 "../../firmware/irq_vex.h"
# 1 "../../firmware/csr.h" 1
# 10 "../../firmware/irq_vex.h" 2


static inline unsigned int irq_getie(void)
{
 return (({ unsigned long __tmp; asm volatile ("csrr %0, " "mstatus" : "=r"(__tmp)); __tmp; }) & 0x8) != 0;
}

static inline void irq_setie(unsigned int ie)
{
 if(ie) ({ if (__builtin_constant_p(0x8) && (unsigned long)(0x8) < 32) asm volatile ("csrrs x0, " "mstatus" ", %0" :: "i"(0x8)); else asm volatile ("csrrs x0, " "mstatus" ", %0" :: "r"(0x8)); }); else ({ if (__builtin_constant_p(0x8) && (unsigned long)(0x8) < 32) asm volatile ("csrrc x0, " "mstatus" ", %0" :: "i"(0x8)); else asm volatile ("csrrc x0, " "mstatus" ", %0" :: "r"(0x8)); });
}

static inline unsigned int irq_getmask(void)
{
 unsigned int mask;
 asm volatile ("csrr %0, %1" : "=r"(mask) : "i"(0xBC0));
 return mask;
}

static inline void irq_setmask(unsigned int mask)
{
 asm volatile ("csrw %0, %1" :: "i"(0xBC0), "r"(mask));
}

static inline unsigned int irq_pending(void)
{
 unsigned int pending;
 asm volatile ("csrr %0, %1" : "=r"(pending) : "i"(0xFC0));
 return pending;
}
# 4 "../../firmware/uart.c" 2


void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write(int n)
{
    while((((*(volatile uint32_t*)0x30000008)>>3) & 1));
    (*(volatile uint32_t*)0x30000004) = n;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_char(char c)
{
 if (c == '\n')
  uart_write_char('\r');


    while((((*(volatile uint32_t*)0x30000008)>>3) & 1));
    (*(volatile uint32_t*)0x30000004) = c;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_string(const char *s)
{
    while (*s)
        uart_write_char(*(s++));
}


char* __attribute__ ( ( section ( ".mprj" ) ) ) uart_read_char()
{

}

int __attribute__ ( ( section ( ".mprj" ) ) ) uart_read()
{
    int num;
    if((((*(volatile uint32_t*)0x30000008)>>5) | 0) && (((*(volatile uint32_t*)0x30000008)>>4) | 0))
        num = (*(volatile uint32_t*)0x30000000);

    return num;
}

int __attribute__ ( ( section ( ".mprj" ) ) ) uart_isr()
{
    int num;
    uint32_t irqs = irq_pending() & irq_getmask();

    if ( irqs & (1 << 2)) {
        num = uart_read();
        user_irq_0_ev_pending_write(1);
    }

    return num;
}
