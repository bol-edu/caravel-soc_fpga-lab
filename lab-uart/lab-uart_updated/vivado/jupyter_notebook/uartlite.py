from time import sleep, time
from pynq import MMIO

RX_FIFO = 0x00
TX_FIFO = 0x04

#Status Reg
STAT_REG = 0x08
RX_VALID = 0
RX_FULL = 1
TX_EMPTY = 2
TX_FULL = 3
IS_INTR = 4
OVERRUN_ERR = 5
FRAME_ERR = 6
PARITY_ERR =7

#Ctrl Reg
CTRL_REG = 0x0C
RST_TX = 0
RST_RX = 1
INTR_EN = 4

class UartAXI:
    def __init__(self, address):
        # Setup axi core
        self.uart = MMIO(address,0x10000, debug=False)
        self.address = address

    def getBit(self,num,pos):
        return (num&1<<pos)>>pos

    def setupCtrlReg(self):
        # Reset FIFOs, disable interrupts
        self.uart.write(CTRL_REG, 1<<RST_TX | 1<<RST_RX)
        sleep(1)
        self.uart.write(CTRL_REG,0)
        sleep(1)

    def currentStatus(self):
        """Returns object that specifies current status of axi core"""
        status = self.uart.read(STAT_REG)
        return {'RX_VALID':self.getBit(status,RX_VALID),
            'RX_FULL':self.getBit(status, RX_FULL),
            'TX_EMPTY':self.getBit(status, TX_EMPTY),
            'TX_FULL':self.getBit(status, TX_FULL),
            'IS_INTR':self.getBit(status, IS_INTR),
            'OVERRUN_ERR':self.getBit(status, OVERRUN_ERR),
            'FRAME_ERR':self.getBit(status, FRAME_ERR),
            'PARITY_ERR':self.getBit(status, PARITY_ERR)}

    def read(self, count, timeout = 10):
        # status = currentStatus(uart) bad idea
        buf = ""
        stop_time = time() + timeout
        for i in range(count):
            # Wait till RX fifo has valid data, stop waiting if timeoutpasses
            while (not (self.uart.read(STAT_REG) & 1<<RX_VALID)) and (time()<stop_time):
                pass
            if time()>=stop_time:
                break
            buf += chr(self.uart.read(RX_FIFO))
        return buf

    def write(self, buf, timeout = 10):
        """
        buf: iterable
        
        """
        stop_time = time() + timeout
        wr_count = 0
        for i in buf:
            #Wait while TX FIFO is Full, stop waiting if timeout passes 
            while (self.uart.read(STAT_REG) & 1<<TX_FULL) and (time()<stop_time):
                pass
            # Check timeout
            if time()>stop_time:
                break
            self.uart.write(TX_FIFO, ord(i))
            wr_count += 1
        return wr_count   

    def readLine(self):
        buf = self.read(1)
        if len(buf) ==0:
            return ""
        while '\n' not in buf:
            buf += self.read(1)
        return buf
