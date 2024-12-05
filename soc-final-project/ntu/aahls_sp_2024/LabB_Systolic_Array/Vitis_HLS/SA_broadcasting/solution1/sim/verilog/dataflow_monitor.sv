
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "pp_loop_interface.svh"
`include "pp_loop_monitor.svh"
`include "upc_loop_interface.svh"
`include "upc_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);




    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_mmult.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_mmult.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_mmult.ap_done;
    assign module_intf_1.ap_continue = 1'b1;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;
    nodf_module_intf module_intf_2(clock,reset);
    assign module_intf_2.ap_start = AESL_inst_mmult.grp_mmult_Pipeline_init_fu_3954.ap_start;
    assign module_intf_2.ap_ready = AESL_inst_mmult.grp_mmult_Pipeline_init_fu_3954.ap_ready;
    assign module_intf_2.ap_done = AESL_inst_mmult.grp_mmult_Pipeline_init_fu_3954.ap_done;
    assign module_intf_2.ap_continue = 1'b1;
    assign module_intf_2.finish = finish;
    csv_file_dump mstatus_csv_dumper_2;
    nodf_module_monitor module_monitor_2;
    nodf_module_intf module_intf_3(clock,reset);
    assign module_intf_3.ap_start = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_start;
    assign module_intf_3.ap_ready = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ready;
    assign module_intf_3.ap_done = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_done;
    assign module_intf_3.ap_continue = 1'b1;
    assign module_intf_3.finish = finish;
    csv_file_dump mstatus_csv_dumper_3;
    nodf_module_monitor module_monitor_3;
    nodf_module_intf module_intf_4(clock,reset);
    assign module_intf_4.ap_start = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_start;
    assign module_intf_4.ap_ready = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ready;
    assign module_intf_4.ap_done = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_done;
    assign module_intf_4.ap_continue = 1'b1;
    assign module_intf_4.finish = finish;
    csv_file_dump mstatus_csv_dumper_4;
    nodf_module_monitor module_monitor_4;
    nodf_module_intf module_intf_5(clock,reset);
    assign module_intf_5.ap_start = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_start;
    assign module_intf_5.ap_ready = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_ready;
    assign module_intf_5.ap_done = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_done;
    assign module_intf_5.ap_continue = 1'b1;
    assign module_intf_5.finish = finish;
    csv_file_dump mstatus_csv_dumper_5;
    nodf_module_monitor module_monitor_5;
    nodf_module_intf module_intf_6(clock,reset);
    assign module_intf_6.ap_start = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_start;
    assign module_intf_6.ap_ready = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ready;
    assign module_intf_6.ap_done = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_done;
    assign module_intf_6.ap_continue = 1'b1;
    assign module_intf_6.finish = finish;
    csv_file_dump mstatus_csv_dumper_6;
    nodf_module_monitor module_monitor_6;

    pp_loop_intf #(9) pp_loop_intf_1(clock,reset);
    assign pp_loop_intf_1.pre_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ST_fsm_state7;
    assign pp_loop_intf_1.pre_states_valid = 1'b1;
    assign pp_loop_intf_1.post_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ST_fsm_state11;
    assign pp_loop_intf_1.post_states_valid = 1'b1;
    assign pp_loop_intf_1.iter_start_state = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.iter_start_enable = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_enable_reg_pp0_iter0;
    assign pp_loop_intf_1.iter_start_block = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_1.iter_end_state = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.iter_end_enable = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_enable_reg_pp0_iter2;
    assign pp_loop_intf_1.iter_end_block = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_1.loop_quit_state = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_1.quit_at_end = 1'b1;
    assign pp_loop_intf_1.cur_state = AESL_inst_mmult.grp_mmult_Pipeline_readA_fu_3974.ap_CS_fsm;
    assign pp_loop_intf_1.finish = finish;
    csv_file_dump pp_loop_csv_dumper_1;
    pp_loop_monitor #(9) pp_loop_monitor_1;
    pp_loop_intf #(9) pp_loop_intf_2(clock,reset);
    assign pp_loop_intf_2.pre_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ST_fsm_state7;
    assign pp_loop_intf_2.pre_states_valid = 1'b1;
    assign pp_loop_intf_2.post_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ST_fsm_state11;
    assign pp_loop_intf_2.post_states_valid = 1'b1;
    assign pp_loop_intf_2.iter_start_state = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_2.iter_start_enable = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_enable_reg_pp0_iter0;
    assign pp_loop_intf_2.iter_start_block = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_2.iter_end_state = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_2.iter_end_enable = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_enable_reg_pp0_iter2;
    assign pp_loop_intf_2.iter_end_block = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_2.loop_quit_state = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_2.quit_at_end = 1'b1;
    assign pp_loop_intf_2.cur_state = AESL_inst_mmult.grp_mmult_Pipeline_readB_fu_4000.ap_CS_fsm;
    assign pp_loop_intf_2.finish = finish;
    csv_file_dump pp_loop_csv_dumper_2;
    pp_loop_monitor #(9) pp_loop_monitor_2;
    pp_loop_intf #(7) pp_loop_intf_3(clock,reset);
    assign pp_loop_intf_3.pre_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ST_fsm_state1;
    assign pp_loop_intf_3.pre_states_valid = 1'b1;
    assign pp_loop_intf_3.post_loop_state0 = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ST_fsm_state4;
    assign pp_loop_intf_3.post_states_valid = 1'b1;
    assign pp_loop_intf_3.iter_start_state = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_3.iter_start_enable = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_enable_reg_pp0_iter0;
    assign pp_loop_intf_3.iter_start_block = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_3.iter_end_state = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_3.iter_end_enable = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_enable_reg_pp0_iter1;
    assign pp_loop_intf_3.iter_end_block = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_block_pp0_stage0_subdone;
    assign pp_loop_intf_3.loop_quit_state = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_ST_fsm_pp0_stage0;
    assign pp_loop_intf_3.quit_at_end = 1'b0;
    assign pp_loop_intf_3.cur_state = AESL_inst_mmult.grp_mmult_Pipeline_writeC_fu_4367.ap_CS_fsm;
    assign pp_loop_intf_3.finish = finish;
    csv_file_dump pp_loop_csv_dumper_3;
    pp_loop_monitor #(7) pp_loop_monitor_3;
    upc_loop_intf#(1) upc_loop_intf_1(clock,reset);
    assign upc_loop_intf_1.cur_state = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_CS_fsm;
    assign upc_loop_intf_1.iter_start_state = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_end_state = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.quit_state = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_1.iter_start_block = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_end_block = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.quit_block = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_1.iter_start_enable = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_1.iter_end_enable = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_1.quit_enable = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_1.loop_start = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_start;
    assign upc_loop_intf_1.loop_ready = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_ready;
    assign upc_loop_intf_1.loop_done = AESL_inst_mmult.grp_mmult_Pipeline_systolic1_fu_4026.ap_done_int;
    assign upc_loop_intf_1.loop_continue = 1'b1;
    assign upc_loop_intf_1.quit_at_end = 1'b0;
    assign upc_loop_intf_1.finish = finish;
    csv_file_dump upc_loop_csv_dumper_1;
    upc_loop_monitor #(1) upc_loop_monitor_1;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;



    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);
    mstatus_csv_dumper_2 = new("./module_status2.csv");
    module_monitor_2 = new(module_intf_2,mstatus_csv_dumper_2);
    mstatus_csv_dumper_3 = new("./module_status3.csv");
    module_monitor_3 = new(module_intf_3,mstatus_csv_dumper_3);
    mstatus_csv_dumper_4 = new("./module_status4.csv");
    module_monitor_4 = new(module_intf_4,mstatus_csv_dumper_4);
    mstatus_csv_dumper_5 = new("./module_status5.csv");
    module_monitor_5 = new(module_intf_5,mstatus_csv_dumper_5);
    mstatus_csv_dumper_6 = new("./module_status6.csv");
    module_monitor_6 = new(module_intf_6,mstatus_csv_dumper_6);

    pp_loop_csv_dumper_1 = new("./pp_loop_status1.csv");
    pp_loop_monitor_1 = new(pp_loop_intf_1,pp_loop_csv_dumper_1);
    pp_loop_csv_dumper_2 = new("./pp_loop_status2.csv");
    pp_loop_monitor_2 = new(pp_loop_intf_2,pp_loop_csv_dumper_2);
    pp_loop_csv_dumper_3 = new("./pp_loop_status3.csv");
    pp_loop_monitor_3 = new(pp_loop_intf_3,pp_loop_csv_dumper_3);



    upc_loop_csv_dumper_1 = new("./upc_loop_status1.csv");
    upc_loop_monitor_1 = new(upc_loop_intf_1,upc_loop_csv_dumper_1);

    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(module_monitor_2);
    sample_manager_inst.add_one_monitor(module_monitor_3);
    sample_manager_inst.add_one_monitor(module_monitor_4);
    sample_manager_inst.add_one_monitor(module_monitor_5);
    sample_manager_inst.add_one_monitor(module_monitor_6);
    sample_manager_inst.add_one_monitor(pp_loop_monitor_1);
    sample_manager_inst.add_one_monitor(pp_loop_monitor_2);
    sample_manager_inst.add_one_monitor(pp_loop_monitor_3);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_1);
    
    fork
        sample_manager_inst.start_monitor();
        last_transaction_done;
    join
    disable fork;

    sample_manager_inst.start_dump();
end

    task last_transaction_done();
        wait(reset == 0);
        while(1) begin
            if (finish == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
