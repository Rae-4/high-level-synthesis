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
directive set -PIPELINE_RAMP_UP true
directive set -COMPGRADE fast
directive set -CLUSTER_TYPE combinational
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -ROM_THRESHOLD 64
directive set -PROTOTYPE_ROM true
directive set -CHARACTERIZE_ROM false
directive set -OPT_CONST_MULTS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -RESET_CLEARS_ALL_REGS true
directive set -DATA_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -BLOCK_SYNC none
directive set -START_FLAG {}
directive set -READY_FLAG {}
directive set -DONE_FLAG {}
directive set -TRANSACTION_DONE_SIGNAL true
directive set -STALL_FLAG false
directive set -IDLE_SIGNAL {}
directive set -REGISTER_IDLE_SIGNAL false
directive set -ARRAY_SIZE 1024
directive set -CHAN_IO_PROTOCOL standard
directive set -IO_MODE super
directive set -UNROLL no
directive set -REALLOC true
directive set -MUXPATH true
directive set -TIMING_CHECKS true
directive set -ASSIGN_OVERHEAD 0
directive set -REGISTER_SHARING_LIMIT 0
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -SAFE_FSM false
directive set -NO_X_ASSIGNMENTS true
directive set -REG_MAX_FANOUT 0
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -FSM_ENCODING none
directive set -LOGIC_OPT false
directive set -MEM_MAP_THRESHOLD 32
directive set -REGISTER_THRESHOLD 256
directive set -MERGEABLE true
directive set -SPECULATE true
directive set -OLD_SCHED false
directive set -DESIGN_GOAL area
go new
directive set -DESIGN_HIERARCHY determinant
go compile
solution library add mgc_Xilinx-ARTIX-7-2L_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ARTIX-7 -speed -2L -part xc7a12tcsg325-2L
go compile
