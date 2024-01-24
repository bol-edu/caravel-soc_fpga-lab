; ModuleID = '/home/hls05/temporary/caravel_fpga_lite/Caravel_FPGA_0_2/project/vitis_hls_project/hls_caravel_ps/hls_caravel_ps.prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<38>" = type { %"struct.ap_int_base<38, false>" }
%"struct.ap_int_base<38, false>" = type { %"struct.ssdm_int<38, false>" }
%"struct.ssdm_int<38, false>" = type { i38 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_caravel_ps_ir(%"struct.ap_uint<38>"* nocapture readonly %ps_mprj_in, %"struct.ap_uint<38>"* noalias nocapture nonnull dereferenceable(8) %ps_mprj_out, %"struct.ap_uint<38>"* noalias nocapture nonnull dereferenceable(8) %ps_mprj_en, %"struct.ap_uint<38>"* noalias nonnull dereferenceable(8) %mprj_in, %"struct.ap_uint<38>"* nocapture readonly %mprj_out, %"struct.ap_uint<38>"* nocapture readonly %mprj_en) local_unnamed_addr #0 {
entry:
  %ps_mprj_out_copy = alloca %"struct.ap_uint<38>", align 512
  %ps_mprj_en_copy = alloca %"struct.ap_uint<38>", align 512
  %mprj_in_copy = alloca i38, align 512
  call fastcc void @copy_in(%"struct.ap_uint<38>"* nonnull %ps_mprj_out, %"struct.ap_uint<38>"* nonnull align 512 %ps_mprj_out_copy, %"struct.ap_uint<38>"* nonnull %ps_mprj_en, %"struct.ap_uint<38>"* nonnull align 512 %ps_mprj_en_copy, %"struct.ap_uint<38>"* nonnull %mprj_in, i38* nonnull align 512 %mprj_in_copy)
  call void @apatb_caravel_ps_hw(%"struct.ap_uint<38>"* %ps_mprj_in, %"struct.ap_uint<38>"* %ps_mprj_out_copy, %"struct.ap_uint<38>"* %ps_mprj_en_copy, i38* %mprj_in_copy, %"struct.ap_uint<38>"* %mprj_out, %"struct.ap_uint<38>"* %mprj_en)
  call void @copy_back(%"struct.ap_uint<38>"* %ps_mprj_out, %"struct.ap_uint<38>"* %ps_mprj_out_copy, %"struct.ap_uint<38>"* %ps_mprj_en, %"struct.ap_uint<38>"* %ps_mprj_en_copy, %"struct.ap_uint<38>"* %mprj_in, i38* %mprj_in_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%"struct.ap_uint<38>"* noalias readonly, %"struct.ap_uint<38>"* noalias align 512, %"struct.ap_uint<38>"* noalias readonly, %"struct.ap_uint<38>"* noalias align 512, %"struct.ap_uint<38>"* noalias readonly, i38* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* align 512 %1, %"struct.ap_uint<38>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* align 512 %3, %"struct.ap_uint<38>"* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>.9"(i38* align 512 %5, %"struct.ap_uint<38>"* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* noalias align 512, %"struct.ap_uint<38>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<38>"* %0, null
  %3 = icmp eq %"struct.ap_uint<38>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<38>", %"struct.ap_uint<38>"* %1, i32 0, i32 0, i32 0, i32 0
  %.01.0.05 = getelementptr %"struct.ap_uint<38>", %"struct.ap_uint<38>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i38* %.0.0.04 to i40*
  %6 = load i40, i40* %5
  %7 = trunc i40 %6 to i38
  store i38 %7, i38* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%"struct.ap_uint<38>"* noalias, %"struct.ap_uint<38>"* noalias readonly align 512, %"struct.ap_uint<38>"* noalias, %"struct.ap_uint<38>"* noalias readonly align 512, %"struct.ap_uint<38>"* noalias, i38* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* %0, %"struct.ap_uint<38>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* %2, %"struct.ap_uint<38>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>.4"(%"struct.ap_uint<38>"* %4, i38* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>.4"(%"struct.ap_uint<38>"* noalias, i38* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<38>"* %0, null
  %3 = icmp eq i38* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<38>", %"struct.ap_uint<38>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i38* %1 to i40*
  %6 = load i40, i40* %5
  %7 = trunc i40 %6 to i38
  store i38 %7, i38* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>.9"(i38* noalias align 512, %"struct.ap_uint<38>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i38* %0, null
  %3 = icmp eq %"struct.ap_uint<38>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<38>", %"struct.ap_uint<38>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i38* %.0.0.04 to i40*
  %6 = load i40, i40* %5
  %7 = trunc i40 %6 to i38
  store i38 %7, i38* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_caravel_ps_hw(%"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, i38*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%"struct.ap_uint<38>"* noalias, %"struct.ap_uint<38>"* noalias readonly align 512, %"struct.ap_uint<38>"* noalias, %"struct.ap_uint<38>"* noalias readonly align 512, %"struct.ap_uint<38>"* noalias, i38* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* %0, %"struct.ap_uint<38>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>"(%"struct.ap_uint<38>"* %2, %"struct.ap_uint<38>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<38>.4"(%"struct.ap_uint<38>"* %4, i38* align 512 %5)
  ret void
}

define void @caravel_ps_hw_stub_wrapper(%"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, i38*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*) #4 {
entry:
  %6 = alloca %"struct.ap_uint<38>"
  call void @copy_out(%"struct.ap_uint<38>"* null, %"struct.ap_uint<38>"* %1, %"struct.ap_uint<38>"* null, %"struct.ap_uint<38>"* %2, %"struct.ap_uint<38>"* %6, i38* %3)
  call void @caravel_ps_hw_stub(%"struct.ap_uint<38>"* %0, %"struct.ap_uint<38>"* %1, %"struct.ap_uint<38>"* %2, %"struct.ap_uint<38>"* %6, %"struct.ap_uint<38>"* %4, %"struct.ap_uint<38>"* %5)
  call void @copy_in(%"struct.ap_uint<38>"* null, %"struct.ap_uint<38>"* %1, %"struct.ap_uint<38>"* null, %"struct.ap_uint<38>"* %2, %"struct.ap_uint<38>"* %6, i38* %3)
  ret void
}

declare void @caravel_ps_hw_stub(%"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*, %"struct.ap_uint<38>"*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
