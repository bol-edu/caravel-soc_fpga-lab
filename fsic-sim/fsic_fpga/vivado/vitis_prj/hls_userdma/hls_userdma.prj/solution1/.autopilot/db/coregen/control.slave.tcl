dict set slaves control {ports {s2m_buf_sts {type o_ap_vld width 1} s2m_sts_clear {type i_ap_none width 1} s2m_len {type i_ap_none width 32} s2m_enb_clrsts {type i_ap_none width 1} s2mbuf {type i_ap_none width 64} s2m_err {type o_ap_vld width 1} Img_width {type i_ap_none width 32} m2sbuf {type i_ap_none width 64} m2s_buf_sts {type o_ap_vld width 1} m2s_sts_clear {type i_ap_none width 1} m2s_len {type i_ap_none width 32} m2s_enb_clrsts {type i_ap_none width 1} ap_start {type ap_ctrl width 1} ap_done {type ap_ctrl width 1} ap_ready {type ap_ctrl width 1} ap_idle {type ap_ctrl width 1}} mems {} has_ctrl 1}
set datawidth 32
set addrwidth 64
set intr_clr_mode COR
