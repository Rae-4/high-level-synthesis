//  Catapult Ultra Synthesis 10.3d/815731 (Production Release) Wed Apr 24 14:54:19 PDT 2019
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2019, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                 PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux student@SoC-courses 4.15.0-128-generic x86_64 aol
//  
//  Package information: SIFLIBS v23.3_4.0, HLS_PKGS v23.3_4.0, 
//                       SIF_TOOLKITS v23.3_4.0, SIF_XILINX v23.3_4.0, 
//                       SIF_ALTERA v23.3_4.0, CCS_LIBS v23.3_4.0, 
//                       CDS_PPRO PowerPro-10.2_4, 
//                       CDS_DesigChecker 10.3b.1902031227, 
//                       CDS_OASYS v18.1_3.19, DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Output/GenerateCycleNetlist false
solution file add ./determinant_tb.cpp -type C++ -exclude true
solution file add ./determinant.h -type CHEADER -exclude true
solution file add ./determinant.cpp -type C++
solution file add ./matrix.h -type CHEADER -exclude true
directive set -DESIGN_GOAL area
directive set -OLD_SCHED false
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -LOGIC_OPT false
directive set -FSM_ENCODING none
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -REGISTER_SHARING_LIMIT 0
directive set -ASSIGN_OVERHEAD 0
directive set -TIMING_CHECKS true
directive set -MUXPATH true
directive set -REALLOC true
directive set -UNROLL no
directive set -IO_MODE super
directive set -CHAN_IO_PROTOCOL standard
directive set -ARRAY_SIZE 1024
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -STALL_FLAG false
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG {}
directive set -READY_FLAG {}
directive set -START_FLAG {}
directive set -BLOCK_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -DATA_SYNC none
directive set -RESET_CLEARS_ALL_REGS true
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS use_library
directive set -CHARACTERIZE_ROM false
directive set -PROTOTYPE_ROM true
directive set -ROM_THRESHOLD 64
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_TYPE combinational
directive set -COMPGRADE fast
directive set -PIPELINE_RAMP_UP true
go new
directive set -DESIGN_HIERARCHY determinant
go compile
solution library add mgc_Xilinx-ARTIX-7-2L_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ARTIX-7 -speed -2L -part xc7a12tcsg325-2L
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 8.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 4.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /determinant/core/main -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/input_mat.Matrix:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/input_mat.Matrix:for -UNROLL 2
directive set /determinant/core/input_mat.Matrix:for:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/input_mat.Matrix:for:for -UNROLL 2
directive set /determinant/core/determinant_helper<3>::do_determinant<ac_int<17,true>>:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<3>::do_determinant<ac_int<17,true>>:for -UNROLL 2
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for -UNROLL 2
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for:for -UNROLL 2
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for:for#1 -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<3>::get_minor<ac_int<17,true>>:for:for#1 -UNROLL 2
directive set /determinant/core/determinant_helper<2>::do_determinant<ac_int<17,true>>:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<2>::do_determinant<ac_int<17,true>>:for -UNROLL 2
directive set /determinant/core/determinant_helper<2>::get_minor<ac_int<17,true>>:for:for -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<2>::get_minor<ac_int<17,true>>:for:for -UNROLL 2
directive set /determinant/core/determinant_helper<2>::get_minor<ac_int<17,true>>:for:for#1 -PIPELINE_INIT_INTERVAL 1
directive set /determinant/core/determinant_helper<2>::get_minor<ac_int<17,true>>:for:for#1 -UNROLL 2
go architect
go extract
