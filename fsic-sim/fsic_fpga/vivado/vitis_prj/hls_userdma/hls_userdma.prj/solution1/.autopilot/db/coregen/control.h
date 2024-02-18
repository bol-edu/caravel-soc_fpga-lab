// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/COR)
//        bit 0 - ap_done (Read/COR)
//        bit 1 - ap_ready (Read/COR)
//        others - reserved
// 0x10 : Data signal of s2m_buf_sts
//        bit 0  - s2m_buf_sts[0] (Read)
//        others - reserved
// 0x14 : Control signal of s2m_buf_sts
//        bit 0  - s2m_buf_sts_ap_vld (Read/COR)
//        others - reserved
// 0x20 : Data signal of s2m_sts_clear
//        bit 0  - s2m_sts_clear[0] (Read/Write)
//        others - reserved
// 0x24 : reserved
// 0x28 : Data signal of s2m_len
//        bit 31~0 - s2m_len[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of s2m_enb_clrsts
//        bit 0  - s2m_enb_clrsts[0] (Read/Write)
//        others - reserved
// 0x34 : reserved
// 0x38 : Data signal of s2mbuf
//        bit 31~0 - s2mbuf[31:0] (Read/Write)
// 0x3c : Data signal of s2mbuf
//        bit 31~0 - s2mbuf[63:32] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of s2m_err
//        bit 0  - s2m_err[0] (Read)
//        others - reserved
// 0x48 : Control signal of s2m_err
//        bit 0  - s2m_err_ap_vld (Read/COR)
//        others - reserved
// 0x54 : Data signal of Img_width
//        bit 31~0 - Img_width[31:0] (Read/Write)
// 0x58 : reserved
// 0x5c : Data signal of m2sbuf
//        bit 31~0 - m2sbuf[31:0] (Read/Write)
// 0x60 : Data signal of m2sbuf
//        bit 31~0 - m2sbuf[63:32] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of m2s_buf_sts
//        bit 0  - m2s_buf_sts[0] (Read)
//        others - reserved
// 0x6c : Control signal of m2s_buf_sts
//        bit 0  - m2s_buf_sts_ap_vld (Read/COR)
//        others - reserved
// 0x78 : Data signal of m2s_sts_clear
//        bit 0  - m2s_sts_clear[0] (Read/Write)
//        others - reserved
// 0x7c : reserved
// 0x80 : Data signal of m2s_len
//        bit 31~0 - m2s_len[31:0] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of m2s_enb_clrsts
//        bit 0  - m2s_enb_clrsts[0] (Read/Write)
//        others - reserved
// 0x8c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL             0x00
#define CONTROL_ADDR_GIE                 0x04
#define CONTROL_ADDR_IER                 0x08
#define CONTROL_ADDR_ISR                 0x0c
#define CONTROL_ADDR_S2M_BUF_STS_DATA    0x10
#define CONTROL_BITS_S2M_BUF_STS_DATA    1
#define CONTROL_ADDR_S2M_BUF_STS_CTRL    0x14
#define CONTROL_ADDR_S2M_STS_CLEAR_DATA  0x20
#define CONTROL_BITS_S2M_STS_CLEAR_DATA  1
#define CONTROL_ADDR_S2M_LEN_DATA        0x28
#define CONTROL_BITS_S2M_LEN_DATA        32
#define CONTROL_ADDR_S2M_ENB_CLRSTS_DATA 0x30
#define CONTROL_BITS_S2M_ENB_CLRSTS_DATA 1
#define CONTROL_ADDR_S2MBUF_DATA         0x38
#define CONTROL_BITS_S2MBUF_DATA         64
#define CONTROL_ADDR_S2M_ERR_DATA        0x44
#define CONTROL_BITS_S2M_ERR_DATA        1
#define CONTROL_ADDR_S2M_ERR_CTRL        0x48
#define CONTROL_ADDR_IMG_WIDTH_DATA      0x54
#define CONTROL_BITS_IMG_WIDTH_DATA      32
#define CONTROL_ADDR_M2SBUF_DATA         0x5c
#define CONTROL_BITS_M2SBUF_DATA         64
#define CONTROL_ADDR_M2S_BUF_STS_DATA    0x68
#define CONTROL_BITS_M2S_BUF_STS_DATA    1
#define CONTROL_ADDR_M2S_BUF_STS_CTRL    0x6c
#define CONTROL_ADDR_M2S_STS_CLEAR_DATA  0x78
#define CONTROL_BITS_M2S_STS_CLEAR_DATA  1
#define CONTROL_ADDR_M2S_LEN_DATA        0x80
#define CONTROL_BITS_M2S_LEN_DATA        32
#define CONTROL_ADDR_M2S_ENB_CLRSTS_DATA 0x88
#define CONTROL_BITS_M2S_ENB_CLRSTS_DATA 1
