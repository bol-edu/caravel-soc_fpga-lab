; ModuleID = '/home/hls05/temporary/caravel_fpga_lite/Caravel_FPGA_0_2/project/vitis_hls_project/hls_read_romcode/hls_read_romcode.prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_read_romcode_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2048" %romcode, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="2048" %internal_bram, i32 %length) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 8192)
  %romcode_copy = bitcast i8* %malloccall to [2048 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 8192)
  %internal_bram_copy = bitcast i8* %malloccall1 to [2048 x i32]*
  %0 = bitcast i32* %romcode to [2048 x i32]*
  %1 = bitcast i32* %internal_bram to [2048 x i32]*
  call fastcc void @copy_in([2048 x i32]* nonnull %0, [2048 x i32]* %romcode_copy, [2048 x i32]* nonnull %1, [2048 x i32]* %internal_bram_copy)
  %2 = getelementptr inbounds [2048 x i32], [2048 x i32]* %romcode_copy, i32 0, i32 0
  %3 = getelementptr inbounds [2048 x i32], [2048 x i32]* %internal_bram_copy, i32 0, i32 0
  call void @apatb_read_romcode_hw(i32* %2, i32* %3, i32 %length)
  call void @copy_back([2048 x i32]* %0, [2048 x i32]* %romcode_copy, [2048 x i32]* %1, [2048 x i32]* %internal_bram_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([2048 x i32]* noalias readonly, [2048 x i32]* noalias, [2048 x i32]* noalias readonly, [2048 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* %1, [2048 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* %3, [2048 x i32]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* noalias, [2048 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2048 x i32]* %0, null
  %3 = icmp eq [2048 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2048 x i32], [2048 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [2048 x i32], [2048 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2048
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([2048 x i32]* noalias, [2048 x i32]* noalias readonly, [2048 x i32]* noalias, [2048 x i32]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* %0, [2048 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* %2, [2048 x i32]* %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_read_romcode_hw(i32*, i32*, i32)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([2048 x i32]* noalias, [2048 x i32]* noalias readonly, [2048 x i32]* noalias, [2048 x i32]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2048i32([2048 x i32]* %2, [2048 x i32]* %3)
  ret void
}

define void @read_romcode_hw_stub_wrapper(i32*, i32*, i32) #4 {
entry:
  %3 = bitcast i32* %0 to [2048 x i32]*
  %4 = bitcast i32* %1 to [2048 x i32]*
  call void @copy_out([2048 x i32]* null, [2048 x i32]* %3, [2048 x i32]* null, [2048 x i32]* %4)
  %5 = bitcast [2048 x i32]* %3 to i32*
  %6 = bitcast [2048 x i32]* %4 to i32*
  call void @read_romcode_hw_stub(i32* %5, i32* %6, i32 %2)
  call void @copy_in([2048 x i32]* null, [2048 x i32]* %3, [2048 x i32]* null, [2048 x i32]* %4)
  ret void
}

declare void @read_romcode_hw_stub(i32*, i32*, i32)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
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
