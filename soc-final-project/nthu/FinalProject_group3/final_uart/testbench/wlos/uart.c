#include <defs.h>
#include <user_uart.h>
#include <irq_vex.h>

int UART_BUF[FIFO_DEPTH];

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write(int *n)
{
    for (int i = 0; i < FIFO_DEPTH; i++){
        while(((reg_uart_stat>>3) & 1)); // wait until tx_full = 0
        if (*(n+i) != 0)
            reg_tx_data = *(n+i);
        else
            break;
    }
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_char(char c)
{
	if (c == '\n')
		uart_write_char('\r');

    // wait until tx_full = 0
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = c;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_string(const char *s)
{
    while (*s)
        uart_write_char(*(s++));
}


char __attribute__ ( ( section ( ".mprj" ) ) ) uart_read_char()
{
	char num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){ // if error = 0
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}

int* __attribute__ ( ( section ( ".mprj" ) ) ) uart_read()
{
    int j = 0;
    while ((((reg_uart_stat) & 1) == 0) && (j < FIFO_DEPTH)){ // while loop when rx_empty = 0 and j < FIFO_DEPTH
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        UART_BUF[j] = reg_rx_data;
        j++;
    }
    while (j < FIFO_DEPTH){
        UART_BUF[j] = 0;
        j++;
    }

    return UART_BUF;
}
