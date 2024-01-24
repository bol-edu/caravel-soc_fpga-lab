set SynModuleInfo {
  {SRCNAME read_romcode_Pipeline_VITIS_LOOP_31_1 MODELNAME read_romcode_Pipeline_VITIS_LOOP_31_1 RTLNAME read_romcode_read_romcode_Pipeline_VITIS_LOOP_31_1
    SUBMODULES {
      {MODELNAME read_romcode_flow_control_loop_pipe_sequential_init RTLNAME read_romcode_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME read_romcode_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME read_romcode MODELNAME read_romcode RTLNAME read_romcode IS_TOP 1
    SUBMODULES {
      {MODELNAME read_romcode_BUS0_m_axi RTLNAME read_romcode_BUS0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME read_romcode_control_s_axi RTLNAME read_romcode_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
