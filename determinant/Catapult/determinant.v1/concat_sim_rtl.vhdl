
--------> /opt/catapult/Catapult_Synthesis_10.3d-815731/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> /opt/catapult/Catapult_Synthesis_10.3d-815731/Mgc_home/pkgs/siflibs/ccs_out_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_pkg_v1 IS

COMPONENT ccs_out_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    idat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_out_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    idat  : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_out_v1;

ARCHITECTURE beh OF ccs_out_v1 IS
BEGIN

  dat <= idat;

END beh;


--------> /opt/catapult/Catapult_Synthesis_10.3d-815731/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.3d/815731 Production Release
--  HLS Date:       Wed Apr 24 14:54:19 PDT 2019
-- 
--  Generated by:   student@SoC-courses
--  Generated date: Sat Mar 19 19:12:32 2022
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    determinant_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY determinant_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (152 DOWNTO 0);
    input_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    result_rsc_triosy_lz : OUT STD_LOGIC
  );
END determinant_core;

ARCHITECTURE v1 OF determinant_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (152 DOWNTO 0);
  SIGNAL result_rsci_idat : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL result_rsc_triosy_obj_ld : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_1_tmp
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_5_tmp : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_1_for_acc_tmp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL and_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_1 : STD_LOGIC;
  SIGNAL and_dcpl_9 : STD_LOGIC;
  SIGNAL and_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_12 : STD_LOGIC;
  SIGNAL and_dcpl_14 : STD_LOGIC;
  SIGNAL and_dcpl_15 : STD_LOGIC;
  SIGNAL and_dcpl_17 : STD_LOGIC;
  SIGNAL and_dcpl_20 : STD_LOGIC;
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_22 : STD_LOGIC;
  SIGNAL or_dcpl_4 : STD_LOGIC;
  SIGNAL nor_tmp : STD_LOGIC;
  SIGNAL and_dcpl_26 : STD_LOGIC;
  SIGNAL and_dcpl_29 : STD_LOGIC;
  SIGNAL and_dcpl_32 : STD_LOGIC;
  SIGNAL and_dcpl_36 : STD_LOGIC;
  SIGNAL and_dcpl_48 : STD_LOGIC;
  SIGNAL and_dcpl_51 : STD_LOGIC;
  SIGNAL or_dcpl_10 : STD_LOGIC;
  SIGNAL and_dcpl_68 : STD_LOGIC;
  SIGNAL and_dcpl_69 : STD_LOGIC;
  SIGNAL and_dcpl_73 : STD_LOGIC;
  SIGNAL or_tmp_41 : STD_LOGIC;
  SIGNAL or_tmp_44 : STD_LOGIC;
  SIGNAL and_dcpl_89 : STD_LOGIC;
  SIGNAL and_dcpl_95 : STD_LOGIC;
  SIGNAL or_dcpl_41 : STD_LOGIC;
  SIGNAL or_dcpl_42 : STD_LOGIC;
  SIGNAL and_dcpl_109 : STD_LOGIC;
  SIGNAL or_dcpl_57 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_unequal_tmp_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_j_1_1_1_lpi_1 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1 :
      STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_m1c_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_28_cse_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_19_m1c_1 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_2 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0_1
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_47_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_26_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_27_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_25_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_25_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_44_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_1_psp_mx0 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_equal_tmp_2 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_equal_tmp_3 : STD_LOGIC;
  SIGNAL exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_4
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_14_ssc_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_15_ssc_1 : STD_LOGIC;
  SIGNAL exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_equal_tmp_2 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_i_1_1_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_or_m1c_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_1_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_0_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_asn_sft_lpi_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_and_ssc_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_and_6_ssc_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_or_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_cse_1
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_cse_1
      : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_i_1_1_lpi_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_mx0 :
      STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_27_cse_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_2_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1 :
      STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1 : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_input_mat_Matrix_for_for_nor_3_cse_1 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0
      : STD_LOGIC;
  SIGNAL lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_3
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_1_0
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3
      : STD_LOGIC;
  SIGNAL exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_3
      : STD_LOGIC;
  SIGNAL lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_2 : STD_LOGIC;
  SIGNAL main_stage_0_3 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva :
      STD_LOGIC;
  SIGNAL main_stage_0_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_2 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_2
      : STD_LOGIC;
  SIGNAL exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_1
      : STD_LOGIC;
  SIGNAL exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_1
      : STD_LOGIC;
  SIGNAL sfi_exit_input_mat_Matrix_for_lpi_1 : STD_LOGIC;
  SIGNAL exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_0
      : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_1
      : STD_LOGIC;
  SIGNAL main_stage_0_5 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_20_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_11_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_21_itm_1 : STD_LOGIC;
  SIGNAL lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_dfm_4
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_41_itm_1 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1
      : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_8_rgt : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_13_rgt : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_32_m1c : STD_LOGIC;
  SIGNAL nor_11_cse : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_33_cse : STD_LOGIC;
  SIGNAL and_124_cse : STD_LOGIC;
  SIGNAL or_122_cse : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_or_1_cse : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse : STD_LOGIC;
  SIGNAL or_125_cse : STD_LOGIC;
  SIGNAL and_123_cse : STD_LOGIC;
  SIGNAL mux_15_cse : STD_LOGIC;
  SIGNAL or_62_cse : STD_LOGIC;
  SIGNAL or_22_cse : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_28_itm_1 : STD_LOGIC;
  SIGNAL input_mat_data_1_2_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_0_lpi_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_2_0_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_2_1_lpi_1_mx0 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL and_128_tmp : STD_LOGIC;
  SIGNAL or_127_tmp : STD_LOGIC;
  SIGNAL mux_31_itm : STD_LOGIC;
  SIGNAL and_dcpl_121 : STD_LOGIC;
  SIGNAL z_out_1 : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (30 DOWNTO 0);
  SIGNAL input_mat_data_1_1_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_1_0_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_0_2_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_0_1_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_2_1_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_0_0_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_data_2_2_lpi_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1 :
      STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1
      : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_lpi_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_dfm_6_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_dfm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_2
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_3
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_determinant_helper_2_do_determinant_ac_int_17_true_for_acc_1_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_mul_1_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_acc_2_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_mul_2_itm_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_acc_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_2_itm_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_40_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_2 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_2 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_2 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_3 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_4 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4 : STD_LOGIC;
  SIGNAL lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_1
      : STD_LOGIC;
  SIGNAL result_rsci_idat_mx0c1 : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_sva_1 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_mx0
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_mx0 :
      STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1_mx0
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_2 : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1_mx0
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_36_cse_mx0w0 : STD_LOGIC;
  SIGNAL input_mat_data_2_2_lpi_1_mx0 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1_1
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_29_cse_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_30_cse_1 : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_or_tmp_1 : STD_LOGIC;
  SIGNAL reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1_dfm_1_reg
      : STD_LOGIC;
  SIGNAL reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_1_dfm_1_reg
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_and_cse : STD_LOGIC;
  SIGNAL input_mat_data_and_3_cse : STD_LOGIC;
  SIGNAL nor_tmp_10 : STD_LOGIC;
  SIGNAL nor_tmp_15 : STD_LOGIC;
  SIGNAL not_tmp_119 : STD_LOGIC;
  SIGNAL or_tmp_77 : STD_LOGIC;
  SIGNAL nor_85_cse : STD_LOGIC;
  SIGNAL nand_21_cse : STD_LOGIC;
  SIGNAL nand_8_cse : STD_LOGIC;
  SIGNAL nor_72_cse : STD_LOGIC;
  SIGNAL and_182_cse : STD_LOGIC;
  SIGNAL or_177_cse : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_itm_2
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_itm_2
      : STD_LOGIC;

  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL nor_43_nl : STD_LOGIC;
  SIGNAL nor_44_nl : STD_LOGIC;
  SIGNAL mux_3_nl : STD_LOGIC;
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL nor_41_nl : STD_LOGIC;
  SIGNAL nor_42_nl : STD_LOGIC;
  SIGNAL mux_5_nl : STD_LOGIC;
  SIGNAL mux_4_nl : STD_LOGIC;
  SIGNAL nor_39_nl : STD_LOGIC;
  SIGNAL nor_40_nl : STD_LOGIC;
  SIGNAL and_95_nl : STD_LOGIC;
  SIGNAL and_97_nl : STD_LOGIC;
  SIGNAL mux_6_nl : STD_LOGIC;
  SIGNAL or_9_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_input_mat_Matrix_for_and_8_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_or_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_and_nl
      : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_not_4_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_6_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_mux_4_nl : STD_LOGIC;
  SIGNAL mux_44_nl : STD_LOGIC;
  SIGNAL mux_43_nl : STD_LOGIC;
  SIGNAL or_130_nl : STD_LOGIC;
  SIGNAL and_187_nl : STD_LOGIC;
  SIGNAL or_129_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_9_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_1_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_12_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_2_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_28_nl : STD_LOGIC_VECTOR
      (1 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_nor_1_nl : STD_LOGIC;
  SIGNAL mux_10_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC;
  SIGNAL mux_8_nl : STD_LOGIC;
  SIGNAL and_120_nl : STD_LOGIC;
  SIGNAL and_121_nl : STD_LOGIC;
  SIGNAL or_17_nl : STD_LOGIC;
  SIGNAL mux_7_nl : STD_LOGIC;
  SIGNAL or_15_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_mux_4_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_nor_1_nl
      : STD_LOGIC;
  SIGNAL mux_46_nl : STD_LOGIC;
  SIGNAL nand_20_nl : STD_LOGIC;
  SIGNAL mux_45_nl : STD_LOGIC;
  SIGNAL nor_79_nl : STD_LOGIC;
  SIGNAL or_178_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_not_17_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_input_mat_Matrix_for_for_mux_22_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_2_do_determinant_ac_int_17_true_for_mux_6_nl : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_2_do_determinant_ac_int_17_true_for_mux_7_nl : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL and_100_nl : STD_LOGIC;
  SIGNAL and_101_nl : STD_LOGIC;
  SIGNAL mux_47_nl : STD_LOGIC;
  SIGNAL nor_73_nl : STD_LOGIC;
  SIGNAL nor_74_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_52_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_26_nl : STD_LOGIC;
  SIGNAL mux_51_nl : STD_LOGIC;
  SIGNAL or_153_nl : STD_LOGIC;
  SIGNAL mux_50_nl : STD_LOGIC;
  SIGNAL mux_49_nl : STD_LOGIC;
  SIGNAL mux_48_nl : STD_LOGIC;
  SIGNAL and_184_nl : STD_LOGIC;
  SIGNAL or_150_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_1_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_45_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_25_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_48_nl : STD_LOGIC;
  SIGNAL mux_58_nl : STD_LOGIC;
  SIGNAL nand_13_nl : STD_LOGIC;
  SIGNAL mux_57_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL or_161_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL mux_54_nl : STD_LOGIC;
  SIGNAL or_160_nl : STD_LOGIC;
  SIGNAL mux_53_nl : STD_LOGIC;
  SIGNAL or_159_nl : STD_LOGIC;
  SIGNAL or_158_nl : STD_LOGIC;
  SIGNAL mux_52_nl : STD_LOGIC;
  SIGNAL and_183_nl : STD_LOGIC;
  SIGNAL or_155_nl : STD_LOGIC;
  SIGNAL or_154_nl : STD_LOGIC;
  SIGNAL mux1h_nl : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_33_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_56_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_and_57_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_35_nl : STD_LOGIC;
  SIGNAL not_235_nl : STD_LOGIC;
  SIGNAL mux_65_nl : STD_LOGIC;
  SIGNAL or_179_nl : STD_LOGIC;
  SIGNAL or_180_nl : STD_LOGIC;
  SIGNAL mux_64_nl : STD_LOGIC;
  SIGNAL mux_63_nl : STD_LOGIC;
  SIGNAL nor_82_nl : STD_LOGIC;
  SIGNAL mux_62_nl : STD_LOGIC;
  SIGNAL nor_83_nl : STD_LOGIC;
  SIGNAL or_169_nl : STD_LOGIC;
  SIGNAL mux_61_nl : STD_LOGIC;
  SIGNAL mux_60_nl : STD_LOGIC;
  SIGNAL or_168_nl : STD_LOGIC;
  SIGNAL or_167_nl : STD_LOGIC;
  SIGNAL mux_59_nl : STD_LOGIC;
  SIGNAL nand_23_nl : STD_LOGIC;
  SIGNAL or_166_nl : STD_LOGIC;
  SIGNAL mux_32_nl : STD_LOGIC;
  SIGNAL mux_35_nl : STD_LOGIC;
  SIGNAL mux_34_nl : STD_LOGIC;
  SIGNAL mux_33_nl : STD_LOGIC;
  SIGNAL or_73_nl : STD_LOGIC;
  SIGNAL or_71_nl : STD_LOGIC;
  SIGNAL mux_38_nl : STD_LOGIC;
  SIGNAL mux_37_nl : STD_LOGIC;
  SIGNAL nor_15_nl : STD_LOGIC;
  SIGNAL mux_36_nl : STD_LOGIC;
  SIGNAL nor_16_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_2_acc_1_nl : STD_LOGIC_VECTOR
      (16 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_or_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_nl :
      STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_1_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_nl
      : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_nl
      : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_nl
      : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_29_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_and_30_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_or_30_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_2_nl
      : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_not_30_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_mux_5_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_mux_20_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_input_mat_Matrix_for_nor_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_nl
      : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_nl
      : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_2_nl : STD_LOGIC;
  SIGNAL mux_20_nl : STD_LOGIC;
  SIGNAL nor_23_nl : STD_LOGIC;
  SIGNAL mux_19_nl : STD_LOGIC;
  SIGNAL mux_18_nl : STD_LOGIC;
  SIGNAL or_47_nl : STD_LOGIC;
  SIGNAL or_46_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_8_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_4_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL nor_48_nl : STD_LOGIC;
  SIGNAL and_134_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_6_nl
      : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL asn_input_mat_data_2_1_lpi_1_nand_nl : STD_LOGIC;
  SIGNAL asn_input_mat_data_2_2_lpi_1_nand_nl : STD_LOGIC;
  SIGNAL or_108_nl : STD_LOGIC;
  SIGNAL mux_13_nl : STD_LOGIC;
  SIGNAL nor_27_nl : STD_LOGIC;
  SIGNAL nor_28_nl : STD_LOGIC;
  SIGNAL mux_14_nl : STD_LOGIC;
  SIGNAL nor_25_nl : STD_LOGIC;
  SIGNAL nor_26_nl : STD_LOGIC;
  SIGNAL or_31_nl : STD_LOGIC;
  SIGNAL mux_16_nl : STD_LOGIC;
  SIGNAL or_29_nl : STD_LOGIC;
  SIGNAL mux_12_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC;
  SIGNAL nor_29_nl : STD_LOGIC;
  SIGNAL nor_86_nl : STD_LOGIC;
  SIGNAL mux_30_nl : STD_LOGIC;
  SIGNAL nor_19_nl : STD_LOGIC;
  SIGNAL determinant_helper_3_do_determinant_ac_int_17_true_for_mux_15_nl : STD_LOGIC_VECTOR
      (30 DOWNTO 0);
  SIGNAL input_mat_Matrix_for_for_mux_25_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_input_mat_Matrix_for_for_or_6_nl : STD_LOGIC;
  SIGNAL input_mat_Matrix_for_for_mux_26_nl : STD_LOGIC;
  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (152 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (152 DOWNTO 0);

  SIGNAL result_rsci_idat_1 : STD_LOGIC_VECTOR (16 DOWNTO 0);
  SIGNAL result_rsci_dat : STD_LOGIC_VECTOR (16 DOWNTO 0);

  FUNCTION CONV_SL_1_1(input:BOOLEAN)
  RETURN STD_LOGIC IS
  BEGIN
    IF input THEN RETURN '1';ELSE RETURN '0';END IF;
  END;

  FUNCTION MUX1HOT_s_1_3_2(input_2 : STD_LOGIC;
  input_1 : STD_LOGIC;
  input_0 : STD_LOGIC;
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      tmp := sel(0);
      result := input_0 and tmp;
      tmp := sel(1);
      result := result or ( input_1 and tmp);
      tmp := sel(2);
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_17_3_2(input_2 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_17_4_2(input_3 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_17_5_2(input_4 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(4 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
      tmp := (OTHERS=>sel( 4));
      result := result or ( input_4 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_3_2(input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_2_4_2(input_3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_17_2_2(input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_17_4_2x1x2(input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(1 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "00" =>
          result := input_0;
        WHEN others =>
          result := input_3;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_17_5_2(input_0 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_3 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  input_4 : STD_LOGIC_VECTOR(16 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(16 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN "000" =>
          result := input_0;
        WHEN "001" =>
          result := input_1;
        WHEN "010" =>
          result := input_2;
        WHEN "011" =>
          result := input_3;
        WHEN others =>
          result := input_4;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_2_2_2(input_0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_30_2_2(input_0 : STD_LOGIC_VECTOR(29 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(29 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(29 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_31_2_2(input_0 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(30 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(30 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  input_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 1,
      width => 153
      )
    PORT MAP(
      dat => input_rsci_dat,
      idat => input_rsci_idat_1
    );
  input_rsci_dat <= input_rsc_dat;
  input_rsci_idat <= input_rsci_idat_1;

  result_rsci : work.ccs_out_pkg_v1.ccs_out_v1
    GENERIC MAP(
      rscid => 2,
      width => 17
      )
    PORT MAP(
      idat => result_rsci_idat_1,
      dat => result_rsci_dat
    );
  result_rsci_idat_1 <= result_rsci_idat;
  result_rsc_dat <= result_rsci_dat;

  input_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => input_rsc_triosy_obj_ld,
      lz => input_rsc_triosy_lz
    );
  result_rsc_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => result_rsc_triosy_obj_ld,
      lz => result_rsc_triosy_lz
    );
  nor_11_cse <= NOT(CONV_SL_1_1(determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp/=STD_LOGIC_VECTOR'("00")));
  nor_85_cse <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_and_cse <= or_dcpl_4
      AND (NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR or_dcpl));
  nand_21_cse <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)));
  determinant_helper_3_get_minor_ac_int_17_true_for_or_33_cse <= (mux_15_cse AND
      lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))
      OR and_dcpl_109;
  nor_72_cse <= NOT(and_124_cse OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  or_177_cse <= nor_72_cse OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva;
  nand_8_cse <= NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1);
  and_182_cse <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_or_32_m1c <= determinant_helper_3_get_minor_ac_int_17_true_for_and_36_cse_mx0w0
      OR ((NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2)))
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1);
  or_125_cse <= CONV_SL_1_1(determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp/=STD_LOGIC_VECTOR'("00"));
  and_128_tmp <= (NOT((NOT((NOT((NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2)
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1))
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1)) AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3))
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  and_124_cse <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  or_62_cse <= CONV_SL_1_1(input_mat_Matrix_for_1_for_acc_tmp(2 DOWNTO 1)/=STD_LOGIC_VECTOR'("00"));
  or_122_cse <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 OR input_mat_Matrix_for_for_j_1_1_1_lpi_1;
  or_73_nl <= (NOT(lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 OR input_mat_Matrix_for_i_1_1_lpi_1))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1;
  mux_33_nl <= MUX_s_1_2_2(or_73_nl, or_tmp_41, lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0);
  or_71_nl <= and_123_cse OR (NOT input_mat_Matrix_for_i_1_1_lpi_1) OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1;
  mux_34_nl <= MUX_s_1_2_2(mux_33_nl, or_71_nl, input_mat_Matrix_for_asn_sft_lpi_1);
  mux_35_nl <= MUX_s_1_2_2((NOT mux_31_itm), mux_34_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  input_mat_data_and_3_cse <= (NOT(mux_35_nl OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva))
      AND (NOT(or_dcpl_57 OR (NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      AND sfi_exit_input_mat_Matrix_for_lpi_1))));
  determinant_helper_3_do_determinant_ac_int_17_true_determinant_sva_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1)
      + SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_mul_2_itm_1),
      17));
  determinant_helper_3_do_determinant_ac_int_17_true_for_2_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_determinant_lpi_1)
      + SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_mul_2_itm_1),
      17));
  determinant_helper_3_do_determinant_ac_int_17_true_determinant_or_nl <= (NOT main_stage_0_5)
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_4;
  determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_4
      AND main_stage_0_5;
  determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_1_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4
      AND main_stage_0_5;
  determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_mx0 <= MUX1HOT_v_17_3_2(determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1,
      determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_dfm_1,
      STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_2_acc_1_nl),
      17)), STD_LOGIC_VECTOR'( determinant_helper_3_do_determinant_ac_int_17_true_determinant_or_nl
      & determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_nl & determinant_helper_3_do_determinant_ac_int_17_true_determinant_and_1_nl));
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_2;
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1
      <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0,
      determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_2);
  exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2 <= input_mat_Matrix_for_i_1_1_lpi_1_dfm_1
      AND input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1 AND input_mat_Matrix_for_for_or_m1c_1;
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
      AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1
      <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1 <= input_mat_Matrix_for_for_j_1_1_1_lpi_1
      AND input_mat_Matrix_for_unequal_tmp_1;
  lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1
      AND input_mat_Matrix_for_unequal_tmp_1;
  lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0
      AND input_mat_Matrix_for_unequal_tmp_1;
  input_mat_Matrix_for_unequal_tmp_1 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1=STD_LOGIC_VECTOR'("00"));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( '1' & (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      & '1') + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED'( determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1
      & '0'), 2), 3) + SIGNED'( "001"), 3));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_nl(2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_2;
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1
      & determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1 &
      '1') + SIGNED'( "11111111111111111111111111111101"), 32));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_nl(31);
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( '1' & (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      & '1') + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED'( determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1
      & '0'), 2), 3) + SIGNED'( "001"), 3));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_nl(2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_13_rgt <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5;
  determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_2 <= CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1/=STD_LOGIC_VECTOR'("00"));
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_29_nl <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1)
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_25_ssc_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_30_nl <= determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_25_ssc_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_1_tmp
      <= MUX1HOT_v_2_4_2(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0,
      STD_LOGIC_VECTOR'( "01"), STD_LOGIC_VECTOR'( "10"), lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1,
      STD_LOGIC_VECTOR'( determinant_helper_3_do_determinant_ac_int_17_true_for_or_47_ssc_1
      & determinant_helper_3_do_determinant_ac_int_17_true_for_and_29_nl & determinant_helper_3_do_determinant_ac_int_17_true_for_and_30_nl
      & determinant_helper_3_do_determinant_ac_int_17_true_for_and_26_ssc_1));
  determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2, 1),2)), lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_dfm_4,
      determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2);
  exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_4 <= determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3 AND
      determinant_helper_3_get_minor_ac_int_17_true_for_or_m1c_1 AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3;
  determinant_helper_3_get_minor_ac_int_17_true_for_or_m1c_1 <= (CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1=STD_LOGIC_VECTOR'("01")))
      OR (NOT(CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1/=STD_LOGIC_VECTOR'("00"))));
  determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3 <= CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_dfm_4/=STD_LOGIC_VECTOR'("00"));
  determinant_helper_3_get_minor_ac_int_17_true_for_or_30_nl <= ((NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_or_m1c_1) OR determinant_helper_3_get_minor_ac_int_17_true_for_and_28_cse_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_2_nl
      <= CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1=STD_LOGIC_VECTOR'("11"));
  determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp <= MUX1HOT_v_2_3_2(STD_LOGIC_VECTOR'(
      "01"), STD_LOGIC_VECTOR'( "10"), lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1,
      STD_LOGIC_VECTOR'( determinant_helper_3_get_minor_ac_int_17_true_for_or_30_nl
      & determinant_helper_3_get_minor_ac_int_17_true_for_and_27_cse_1 & determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_2_nl));
  determinant_helper_3_get_minor_ac_int_17_true_for_not_30_nl <= NOT determinant_helper_3_get_minor_ac_int_17_true_for_equal_tmp_2;
  lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_dfm_4
      <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"), determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp,
      determinant_helper_3_get_minor_ac_int_17_true_for_not_30_nl);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_28_cse_1 <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_19_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_27_cse_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_19_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_equal_tmp_2 <= CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1=STD_LOGIC_VECTOR'("10"));
  determinant_helper_3_get_minor_ac_int_17_true_for_and_19_m1c_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_do_determinant_ac_int_17_true_for_mux_5_nl <= MUX_s_1_2_2((NOT
      exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_4), lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1,
      determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3);
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1_1
      <= (determinant_helper_3_do_determinant_ac_int_17_true_for_mux_5_nl AND (NOT
      determinant_helper_3_do_determinant_ac_int_17_true_for_and_14_ssc_1)) OR determinant_helper_3_do_determinant_ac_int_17_true_for_and_15_ssc_1;
  lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0_1
      <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1
      AND (NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_and_15_ssc_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2))) OR
      determinant_helper_3_do_determinant_ac_int_17_true_for_and_14_ssc_1;
  input_mat_Matrix_for_for_input_mat_Matrix_for_nor_nl <= NOT((NOT sfi_exit_input_mat_Matrix_for_lpi_1)
      OR input_mat_Matrix_for_asn_sft_lpi_1);
  input_mat_Matrix_for_for_mux_20_nl <= MUX_s_1_2_2(input_mat_Matrix_for_for_input_mat_Matrix_for_nor_nl,
      lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1, input_mat_Matrix_for_for_equal_tmp_3);
  lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_1_1 <= (input_mat_Matrix_for_for_mux_20_nl
      AND (NOT input_mat_Matrix_for_for_and_ssc_1)) OR input_mat_Matrix_for_for_and_6_ssc_1;
  lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_0_1 <= (lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1
      AND (NOT(input_mat_Matrix_for_for_and_6_ssc_1 OR input_mat_Matrix_for_for_equal_tmp_2)))
      OR input_mat_Matrix_for_for_and_ssc_1;
  input_mat_Matrix_for_i_1_1_lpi_1_dfm_1 <= input_mat_Matrix_for_i_1_1_lpi_1 AND
      (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  input_mat_Matrix_for_for_equal_tmp_2 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1
      AND (NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1);
  input_mat_Matrix_for_for_equal_tmp_3 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1
      AND lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1 <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1))
      OR (NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1));
  determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1);
  determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_or_47_ssc_1 <= (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2)
      OR determinant_helper_3_get_minor_ac_int_17_true_for_or_1_psp_mx0;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_26_ssc_1 <= ((determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1) OR (determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1
      AND (NOT determinant_helper_3_get_minor_ac_int_17_true_for_or_1_psp_mx0)) OR
      determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1) AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_27_ssc_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_19_m1c_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_25_ssc_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_25_ssc_1 <= (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1 AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_44_ssc_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1 AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1 <= NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_itm_2
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1 <= NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_itm_2
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1 <= NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_cse_1
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_cse_1
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4 OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3);
  determinant_helper_3_get_minor_ac_int_17_true_for_or_1_psp_mx0 <= MUX_s_1_2_2((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)),
      determinant_helper_3_get_minor_ac_int_17_true_for_and_40_itm_1, or_dcpl_41);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_or_tmp_1
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( '1' & (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      & '1') + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED'( determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1
      & '1'), 2), 3) + SIGNED'( "001"), 3));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_itm_2
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_nl(2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4 <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1(1))
      AND (NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1(0))));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5 <= CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1=STD_LOGIC_VECTOR'("11"))
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_8_rgt <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_or_tmp_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_cse_1
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_cse_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( '1' & (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      & '1') + CONV_SIGNED(CONV_UNSIGNED(UNSIGNED'( determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1
      & '1'), 2), 3) + SIGNED'( "001"), 3));
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_itm_2
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_nl(2);
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_5_tmp <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_equal_tmp_2)
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_equal_tmp_2
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  input_mat_Matrix_for_for_input_mat_Matrix_for_for_nor_3_cse_1 <= NOT(input_mat_Matrix_for_for_equal_tmp_2
      OR input_mat_Matrix_for_for_equal_tmp_3);
  input_mat_Matrix_for_for_or_m1c_1 <= (lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1
      AND (NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1)) OR (NOT(lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_1_1
      OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_0_1));
  input_mat_Matrix_for_for_and_ssc_1 <= (NOT input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1)
      AND input_mat_Matrix_for_for_or_m1c_1;
  input_mat_Matrix_for_for_and_6_ssc_1 <= input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1
      AND input_mat_Matrix_for_for_or_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_cse_1
      <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1(0))
      AND (NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1(1))));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_cse_1
      <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1/=STD_LOGIC_VECTOR'("00")));
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_14_ssc_1 <= (NOT exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2)
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1;
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_15_ssc_1 <= exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1;
  determinant_helper_3_get_minor_ac_int_17_true_minor_data_or_1_cse <= (NOT main_stage_0_2)
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1;
  determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse <= determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1
      AND main_stage_0_2;
  determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_2_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1
      AND main_stage_0_2;
  determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_mx0 <= MUX1HOT_v_17_3_2(determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1,
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_1_dfm_1_reg,
      1),17)), determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_dfm_6_1,
      STD_LOGIC_VECTOR'( determinant_helper_3_get_minor_ac_int_17_true_minor_data_or_1_cse
      & determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_2_nl & determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse));
  or_127_tmp <= (determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_or_28_itm_1 AND determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse)
      OR determinant_helper_3_get_minor_ac_int_17_true_minor_data_or_1_cse;
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_4_nl
      <= MUX1HOT_v_17_3_2(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1,
      input_mat_data_2_1_lpi_1, input_mat_data_2_2_lpi_1, STD_LOGIC_VECTOR'( determinant_helper_3_get_minor_ac_int_17_true_for_and_40_itm_1
      & determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1_1 & determinant_helper_3_get_minor_ac_int_17_true_for_and_41_itm_1));
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_8_nl
      <= MUX_v_17_2_2(STD_LOGIC_VECTOR'("00000000000000000"), determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_4_nl,
      determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1);
  nor_48_nl <= NOT(determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse
      OR or_127_tmp);
  and_134_nl <= determinant_helper_3_get_minor_ac_int_17_true_minor_data_and_3_cse
      AND (NOT or_127_tmp);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1_mx0 <= MUX1HOT_v_17_3_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1_dfm_1_reg,
      1),17)), determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_8_nl,
      determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1, STD_LOGIC_VECTOR'(
      nor_48_nl & and_134_nl & or_127_tmp));
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_6_nl
      <= MUX_v_17_2_2(STD_LOGIC_VECTOR'("00000000000000000"), determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_2_itm_1,
      determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1);
  determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_2 <= MUX_v_17_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_1_dfm_1_reg,
      1),17)), determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_and_6_nl,
      determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1);
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1_mx0
      <= MUX_v_17_2_2(input_mat_data_1_0_lpi_1, input_mat_data_1_2_lpi_1, z_out_3(0));
  determinant_helper_3_get_minor_ac_int_17_true_for_and_36_cse_mx0w0 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_2_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1;
  asn_input_mat_data_2_1_lpi_1_nand_nl <= NOT(main_stage_0_2 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_11_itm_1);
  input_mat_data_2_1_lpi_1_mx0 <= MUX_v_17_2_2(input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1,
      input_mat_data_2_1_lpi_1, asn_input_mat_data_2_1_lpi_1_nand_nl);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1 <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1;
  asn_input_mat_data_2_2_lpi_1_nand_nl <= NOT(main_stage_0_2 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_21_itm_1);
  input_mat_data_2_2_lpi_1_mx0 <= MUX_v_17_2_2(input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1,
      input_mat_data_2_2_lpi_1, asn_input_mat_data_2_2_lpi_1_nand_nl);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3;
  or_108_nl <= or_dcpl OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_mx0 <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_1,
      determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp, or_108_nl);
  input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1_1
      <= MUX_v_17_5_2((input_rsci_idat(16 DOWNTO 0)), (input_rsci_idat(50 DOWNTO
      34)), (input_rsci_idat(84 DOWNTO 68)), (input_rsci_idat(118 DOWNTO 102)), (input_rsci_idat(152
      DOWNTO 136)), input_mat_Matrix_for_1_for_acc_tmp);
  input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1_1
      <= MUX_v_17_4_2x1x2((input_rsci_idat(33 DOWNTO 17)), (input_rsci_idat(135 DOWNTO
      119)), STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(input_mat_Matrix_for_i_1_1_lpi_1_dfm_1,
      1),2)));
  input_mat_Matrix_for_1_for_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(
      input_mat_Matrix_for_i_1_1_lpi_1_dfm_1 & '0'), 2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(input_mat_Matrix_for_i_1_1_lpi_1_dfm_1,
      1), 1), 3) + CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1,
      1), 1), 3), 3));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_2_tmp_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_29_cse_1 <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_tmp_1)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_30_cse_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_or_tmp_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_tmp_1 <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1)
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31;
  and_dcpl <= main_stage_0_4 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_1;
  and_dcpl_1 <= and_dcpl AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0);
  and_dcpl_9 <= main_stage_0_3 AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0);
  and_dcpl_10 <= and_dcpl_9 AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2(1)))
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1;
  and_dcpl_12 <= and_dcpl_9 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1;
  and_dcpl_14 <= main_stage_0_2 AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0);
  and_dcpl_15 <= and_dcpl_14 AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1)))
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1;
  and_dcpl_17 <= and_dcpl_14 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1;
  and_dcpl_20 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND nor_85_cse;
  or_dcpl <= exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  and_dcpl_22 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  and_123_cse <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 AND lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0;
  or_dcpl_4 <= (NOT(and_123_cse OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1))
      OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva OR
      (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  nor_tmp <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 AND lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  or_22_cse <= nor_11_cse OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1) OR
      CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"));
  nor_27_nl <= NOT((NOT determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_2)
      OR CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2/=STD_LOGIC_VECTOR'("10")));
  nor_28_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2(1))
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0(0)));
  mux_13_nl <= MUX_s_1_2_2(nor_27_nl, nor_28_nl, determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_2);
  and_dcpl_26 <= mux_13_nl AND and_dcpl_12;
  nor_25_nl <= NOT((NOT determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_1)
      OR CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1/=STD_LOGIC_VECTOR'("10")));
  nor_26_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1))
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0(0)));
  mux_14_nl <= MUX_s_1_2_2(nor_25_nl, nor_26_nl, determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_1);
  and_dcpl_29 <= mux_14_nl AND and_dcpl_17;
  or_31_nl <= (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)));
  mux_15_cse <= MUX_s_1_2_2(or_31_nl, (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  or_29_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)));
  mux_16_nl <= MUX_s_1_2_2(mux_15_cse, or_29_nl, determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1);
  and_dcpl_32 <= (NOT mux_16_nl) AND and_dcpl_22;
  and_dcpl_36 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
      AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  and_dcpl_48 <= NOT(nor_72_cse OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  and_dcpl_51 <= determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_5_tmp;
  or_dcpl_10 <= CONV_SL_1_1(determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp/=STD_LOGIC_VECTOR'("10"));
  and_dcpl_68 <= NOT(exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  and_dcpl_69 <= and_dcpl_68 AND input_mat_Matrix_for_i_1_1_lpi_1;
  nor_29_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1));
  mux_11_nl <= MUX_s_1_2_2(nor_29_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1,
      or_22_cse);
  nor_86_nl <= NOT((NOT input_mat_Matrix_for_for_j_1_1_1_lpi_1) OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1
      OR (NOT input_mat_Matrix_for_i_1_1_lpi_1) OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  mux_12_nl <= MUX_s_1_2_2(mux_11_nl, nor_86_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  and_dcpl_73 <= mux_12_nl AND or_dcpl_10 AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  or_tmp_41 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 OR (NOT input_mat_Matrix_for_i_1_1_lpi_1)
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1;
  or_tmp_44 <= input_mat_Matrix_for_i_1_1_lpi_1 OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1;
  nor_19_nl <= NOT((NOT input_mat_Matrix_for_i_1_1_lpi_1) OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  mux_30_nl <= MUX_s_1_2_2(or_tmp_44, nor_19_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  mux_31_itm <= MUX_s_1_2_2(mux_30_nl, or_tmp_44, or_22_cse);
  and_dcpl_89 <= main_stage_0_5 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_1
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_0);
  and_dcpl_95 <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
      AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  or_dcpl_41 <= or_dcpl OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  or_dcpl_42 <= NOT(main_stage_0_2 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_20_itm_1);
  and_dcpl_109 <= and_dcpl_95 AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0=STD_LOGIC_VECTOR'("00"))
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)))
      AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  or_dcpl_57 <= (NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1) OR input_mat_Matrix_for_asn_sft_lpi_1;
  result_rsci_idat_mx0c1 <= and_dcpl_89 AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4
      AND (NOT determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_4);
  and_dcpl_121 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  nor_tmp_10 <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_itm_2;
  nor_tmp_15 <= determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1;
  not_tmp_119 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1
      AND nor_tmp_15;
  or_tmp_77 <= (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        result_rsc_triosy_obj_ld <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_1
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_0
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_1
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0
            <= '0';
        input_rsc_triosy_obj_ld <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
            <= '0';
        exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva <=
            '1';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
            <= '0';
        main_stage_0_2 <= '0';
        main_stage_0_3 <= '0';
        main_stage_0_4 <= '0';
        main_stage_0_5 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_4 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_4 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_4 <= '0';
        input_mat_Matrix_for_i_1_1_lpi_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_3 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_3 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_3 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_3 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_2 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_2 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_2 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_2 <= '0';
        determinant_helper_3_get_minor_ac_int_17_true_for_or_28_itm_1 <= '0';
        determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_21_itm_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_20_itm_1 <= '0';
      ELSE
        result_rsc_triosy_obj_ld <= main_stage_0_5 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_1
            AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_0)
            AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_1
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_1;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_4_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_1
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_0_1;
        input_rsc_triosy_obj_ld <= NOT((NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1)
            OR (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))
            OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
            OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
            OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
            OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
            OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva
            OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
            OR nor_11_cse OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1_1;
        exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva <=
            NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1_1
            OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0_1);
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0_1;
        main_stage_0_2 <= '1';
        main_stage_0_3 <= main_stage_0_2;
        main_stage_0_4 <= main_stage_0_3;
        main_stage_0_5 <= main_stage_0_4;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_4 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_3;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_4 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_3;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_3;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_4 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_3;
        input_mat_Matrix_for_i_1_1_lpi_1 <= MUX_s_1_2_2(input_mat_Matrix_for_i_1_1_lpi_1_dfm_1,
            input_mat_Matrix_for_for_input_mat_Matrix_for_for_mux_22_nl, or_dcpl);
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_3 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_3 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_3 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_3 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_2 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_2 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_2 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_2 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
        determinant_helper_3_get_minor_ac_int_17_true_for_or_28_itm_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_or_tmp_1
            OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1
            OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
            OR ((NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_2_tmp_1)
            AND determinant_helper_3_get_minor_ac_int_17_true_for_and_10_m1c_1) OR
            determinant_helper_3_get_minor_ac_int_17_true_for_and_27_cse_1 OR (determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1
            AND determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1);
        determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_54_itm_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1 <= determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_1 <= (NOT
            determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1)
            AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_1 <= determinant_helper_3_do_determinant_ac_int_17_true_for_and_5_tmp
            OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3
            OR (determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1
            AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1);
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_mx0
            AND (NOT determinant_helper_3_get_minor_ac_int_17_true_for_or_1_psp_mx0)
            AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_21_itm_1 <= (input_mat_Matrix_for_1_for_acc_tmp(2))
            AND input_mat_Matrix_for_for_input_mat_Matrix_for_for_nor_3_cse_1 AND
            determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1;
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_20_itm_1 <= (input_mat_Matrix_for_1_for_acc_tmp(1))
            AND input_mat_Matrix_for_for_input_mat_Matrix_for_for_nor_3_cse_1 AND
            determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        result_rsci_idat <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((and_dcpl_89 AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4
          AND determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_4) OR
          result_rsci_idat_mx0c1) = '1' ) THEN
        result_rsci_idat <= MUX_v_17_2_2(determinant_helper_3_do_determinant_ac_int_17_true_determinant_sva_1,
            determinant_helper_3_do_determinant_ac_int_17_true_determinant_lpi_1,
            result_rsci_idat_mx0c1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1 <=
            STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4
          OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_4) AND
          main_stage_0_5) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1 <=
            determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_mul_2_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( (mux_nl AND and_dcpl_1) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_mul_2_itm_1 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'(
            SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_3)
            * SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_acc_2_itm_1)),
            17));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_lpi_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( (main_stage_0_5 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_itm_4)
          = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_lpi_1 <= determinant_helper_3_do_determinant_ac_int_17_true_determinant_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_4 <= '0';
      ELSIF ( (and_dcpl AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_3_0)
          AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_3)
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_4 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4
            <= '0';
      ELSIF ( and_dcpl_1 = '1' ) THEN
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_4
            <= exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_2
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_1_0
            <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_dcpl_10 = '1' ) THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_2
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_1_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3
            <= '0';
      ELSIF ( (mux_3_nl AND main_stage_0_3) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3
            <= determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_3
            <= STD_LOGIC_VECTOR'( "00");
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_3
            <= '0';
      ELSIF ( and_dcpl_12 = '1' ) THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_3
            <= lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2;
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_3
            <= exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0
            <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_dcpl_15 = '1' ) THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_2
            <= '0';
      ELSIF ( (mux_5_nl AND main_stage_0_2) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_2
            <= determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2
            <= STD_LOGIC_VECTOR'( "00");
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_2
            <= '0';
      ELSIF ( and_dcpl_17 = '1' ) THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2
            <= lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1;
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_2
            <= exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2
            <= '0';
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0
            <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( and_dcpl_20 = '1' ) THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1;
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0
            <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_1_0_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_1
            <= '0';
      ELSIF ( ((NOT(mux_6_nl OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))
          OR or_dcpl) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_1
            <= MUX1HOT_s_1_3_2(determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1,
            determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1,
            exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2, STD_LOGIC_VECTOR'( and_95_nl
            & and_97_nl & or_dcpl));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1
            <= STD_LOGIC_VECTOR'( "00");
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_1
            <= '0';
      ELSIF ( and_dcpl_22 = '1' ) THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1
            <= lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1;
        exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_1
            <= exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_4;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_Matrix_for_asn_sft_lpi_1 <= '0';
      ELSIF ( (NOT(input_mat_Matrix_for_for_equal_tmp_2 OR input_mat_Matrix_for_for_equal_tmp_3
          OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1))
          = '1' ) THEN
        input_mat_Matrix_for_asn_sft_lpi_1 <= z_out_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 <= '0';
      ELSIF ( lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
          = '0' ) THEN
        lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0 <= '0';
      ELSIF ( lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
          = '0' ) THEN
        lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0 <= lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_0_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_Matrix_for_for_j_1_1_1_lpi_1 <= '0';
      ELSIF ( lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1
          = '0' ) THEN
        input_mat_Matrix_for_for_j_1_1_1_lpi_1 <= (input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1
            OR input_mat_Matrix_for_for_input_mat_Matrix_for_for_nor_3_cse_1) AND
            (lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_1_1 OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_dfm_3_0_1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 <= '0';
      ELSIF ( (or_dcpl_4 AND (determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1
          OR determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1))
          = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 <= MUX_s_1_2_2(input_mat_Matrix_for_input_mat_Matrix_for_and_8_nl,
            determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_or_nl,
            determinant_helper_3_do_determinant_ac_int_17_true_for_and_6_m1c_1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1
            <= STD_LOGIC_VECTOR'( "000000000000000000000000000000");
      ELSIF ( ((NOT mux_44_nl) AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
          AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND nor_85_cse) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1
            <= MUX_v_30_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_and_nl,
            (z_out_3(30 DOWNTO 1)), determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_6_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1 <=
            '0';
      ELSIF ( (NOT((NOT((determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1
          AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_or_tmp_1) OR
          determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_8_rgt)) OR
          (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
          OR or_dcpl_41)) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1 <=
            MUX_s_1_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1,
            (z_out_3(0)), determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_8_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 <= '0';
      ELSIF ( (NOT((NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4
          OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_13_rgt))
          OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
          OR or_dcpl_41)) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_9_nl,
            determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_1_nl,
            determinant_helper_3_get_minor_ac_int_17_true_for_and_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1 <=
            '0';
        determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1 <= '0';
      ELSIF ( determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_and_cse
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1 <=
            determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_nl OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3;
        determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1 <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_mux_4_nl,
            determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1,
            determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_nor_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
            <= '0';
      ELSIF ( or_dcpl_4 = '1' ) THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
            <= (determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_2_nl
            AND (NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_and_25_ssc_1
            OR determinant_helper_3_get_minor_ac_int_17_true_for_and_25_ssc_1)))
            OR determinant_helper_3_get_minor_ac_int_17_true_for_and_44_ssc_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0
            <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( ((NOT mux_10_nl) OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          = '1' ) THEN
        lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0
            <= MUX_v_2_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_and_28_nl,
            STD_LOGIC_VECTOR'("11"), determinant_helper_3_get_minor_ac_int_17_true_for_and_25_ssc_1);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1
            <= STD_LOGIC_VECTOR'( "00");
      ELSIF ( (NOT(mux_46_nl OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva))
          = '1' ) THEN
        lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1
            <= determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1 <= '0';
      ELSIF ( (determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
          AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3
          AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)))
          AND (NOT or_dcpl_41)) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1 <= determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_dfm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_4
          OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_45_itm_4 OR
          (NOT main_stage_0_5) OR determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3)
          AND determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_3 AND
          main_stage_0_4) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_dfm_1
            <= MUX_v_17_2_2(STD_LOGIC_VECTOR'("00000000000000000"), determinant_helper_3_do_determinant_ac_int_17_true_determinant_1_lpi_1_mx0,
            input_mat_Matrix_for_not_17_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_3
            <= STD_LOGIC_VECTOR'( "00000000000000000");
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_acc_2_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( and_dcpl_26 = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_3
            <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_acc_2_itm_1
            <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_itm_1)
            + SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_mul_1_itm_1),
            17));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        sfi_exit_input_mat_Matrix_for_lpi_1 <= '0';
      ELSIF ( (or_dcpl_4 AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_1_1))
          = '1' ) THEN
        sfi_exit_input_mat_Matrix_for_lpi_1 <= NOT((NOT(sfi_exit_input_mat_Matrix_for_lpi_1
            OR input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1)) OR input_mat_Matrix_for_for_equal_tmp_2);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_3 <= '0';
      ELSIF ( (and_dcpl_9 AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_2
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1)
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_3 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_mul_1_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_2
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( and_dcpl_29 = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_itm_1
            <= MUX_v_17_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_nl),
            17)), determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_1,
            lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1));
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_mul_1_itm_1
            <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_determinant_helper_2_do_determinant_ac_int_17_true_for_acc_1_itm_1)
            * SIGNED(determinant_helper_2_do_determinant_ac_int_17_true_for_mux_6_nl)),
            17));
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_2
            <= MUX_v_17_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_1,
            determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_acc_itm_1,
            lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_2 <= '0';
      ELSIF ( (and_dcpl_14 AND exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_st_1
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1)
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_2 <= determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_determinant_helper_2_do_determinant_ac_int_17_true_for_acc_1_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
        determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_acc_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( and_dcpl_32 = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_determinant_helper_2_do_determinant_ac_int_17_true_for_acc_1_itm_1
            <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(determinant_helper_2_do_determinant_ac_int_17_true_for_mux_7_nl)
            + UNSIGNED'( "00000000000000001"), 17));
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_input_mat_getElement_2_input_mat_getElement_2_mux_1_itm_1
            <= MUX1HOT_v_17_3_2(input_mat_data_0_2_lpi_1, input_mat_data_0_0_lpi_1,
            STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_nl),
            17)), STD_LOGIC_VECTOR'( and_100_nl & and_101_nl & (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))));
        determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_acc_itm_1
            <= MUX_v_17_2_2((z_out_3(16 DOWNTO 0)), determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_0_lpi_1,
            lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( ((determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1
          OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1) AND
          main_stage_0_2 AND nor_85_cse AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
          AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
          AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0=STD_LOGIC_VECTOR'("00"))
          AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
          AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1 <= determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( (and_dcpl_36 AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0=STD_LOGIC_VECTOR'("00"))
          AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
          AND nor_85_cse) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_1 <= '0';
      ELSIF ( (and_dcpl_36 AND or_125_cse AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0=STD_LOGIC_VECTOR'("00"))
          AND determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 AND
          determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
          AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)))
          AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_51_itm_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_1
            AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( ((NOT(determinant_helper_3_get_minor_ac_int_17_true_for_or_28_itm_1
          AND determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1 AND
          determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1)) AND
          (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1)
          AND main_stage_0_2) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_2_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (NOT((NOT(and_dcpl_48 OR (NOT (input_mat_Matrix_for_1_for_acc_tmp(1)))))
          OR or_dcpl_42)) = '1' ) THEN
        input_mat_data_2_0_lpi_1 <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (or_125_cse AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
          AND (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(1))
          AND or_dcpl_10 AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1
          AND (NOT (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0)))
          AND and_dcpl_51 AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
          AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
          AND nor_85_cse) = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1
            <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_40_itm_1 <= '0';
        determinant_helper_3_get_minor_ac_int_17_true_for_and_41_itm_1 <= '0';
      ELSIF ( determinant_helper_3_get_minor_ac_int_17_true_for_or_33_cse = '1' )
          THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_and_40_itm_1 <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_and_36_cse_mx0w0,
            (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)),
            and_dcpl_109);
        determinant_helper_3_get_minor_ac_int_17_true_for_and_41_itm_1 <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_and_28_cse_1,
            (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)),
            and_dcpl_109);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_2_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (mux_47_nl AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND main_stage_0_2 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_11_itm_1)
          = '1' ) THEN
        input_mat_data_2_1_lpi_1 <= input_mat_data_2_1_lpi_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_2_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((NOT(or_177_cse AND (input_mat_Matrix_for_1_for_acc_tmp(2)))) AND
          main_stage_0_2 AND determinant_helper_3_do_determinant_ac_int_17_true_for_and_21_itm_1)
          = '1' ) THEN
        input_mat_data_2_2_lpi_1 <= input_mat_data_2_2_lpi_1_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1 <= '0';
      ELSIF ( (((NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))
          OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
          OR nand_8_cse OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
          OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
          OR nor_11_cse) AND or_dcpl_10 AND and_dcpl_22) = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1 <= determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_2_itm_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((NOT mux_51_nl) AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
          AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)
          AND (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(0)))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_2_itm_1
            <= MUX1HOT_v_17_3_2(input_mat_data_1_1_lpi_1, determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_2,
            determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_2_input_mat_getElement_1_slc_input_mat_data_17_16_0_ctmp_sva_1_mx0,
            STD_LOGIC_VECTOR'( determinant_helper_3_get_minor_ac_int_17_true_for_and_52_nl
            & determinant_helper_3_get_minor_ac_int_17_true_for_or_26_nl & determinant_helper_3_get_minor_ac_int_17_true_for_and_30_cse_1));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1 <= '0';
        determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1 <= '0';
      ELSIF ( and_dcpl_73 = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1 <= determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
        determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1 <= determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_1_dfm_1_reg
            <= '0';
      ELSIF ( (and_dcpl_68 AND or_dcpl_10 AND input_mat_Matrix_for_i_1_1_lpi_1 AND
          (NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1) AND input_mat_Matrix_for_for_j_1_1_1_lpi_1
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)
          = '1' ) THEN
        reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_1_dfm_1_reg
            <= NOT exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_dfm_6_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (mux_58_nl AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
          AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_dfm_6_1
            <= MUX_v_17_2_2(STD_LOGIC_VECTOR'("00000000000000000"), determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_1_nl,
            determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_3);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp <= '0';
      ELSIF ( ((((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
          AND CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0=STD_LOGIC_VECTOR'("00"))
          AND determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 AND
          determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
          AND (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(0)))
          OR (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(1)))
          AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
          AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)))
          AND (NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
          OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_4_psp_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_0_lpi_1 <= STD_LOGIC_VECTOR'(
            "00000000000000000");
      ELSIF ( (NOT(mux_65_nl OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva))
          = '1' ) THEN
        determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_0_lpi_1 <= MUX_v_17_2_2(STD_LOGIC_VECTOR'("00000000000000000"),
            mux1h_nl, not_235_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_0_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (NOT(and_dcpl_48 OR or_62_cse OR (input_mat_Matrix_for_1_for_acc_tmp(0))))
          = '1' ) THEN
        input_mat_data_0_0_lpi_1 <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_0_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (NOT(and_dcpl_48 OR or_62_cse OR (NOT (input_mat_Matrix_for_1_for_acc_tmp(0)))))
          = '1' ) THEN
        input_mat_data_0_2_lpi_1 <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (or_177_cse AND or_62_cse) = '1' ) THEN
        input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1
            <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1
            <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((NOT(or_122_cse AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))
          AND and_dcpl_69) = '1' ) THEN
        input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1
            <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_11_itm_1 <= '0';
      ELSIF ( (NOT(mux_32_nl OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva))
          = '1' ) THEN
        determinant_helper_3_do_determinant_ac_int_17_true_for_and_11_itm_1 <= input_mat_Matrix_for_i_1_1_lpi_1_dfm_1
            AND (NOT input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1) AND (NOT(input_mat_Matrix_for_for_equal_tmp_2
            OR input_mat_Matrix_for_for_equal_tmp_3 OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2
            OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_3));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_1_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
        input_mat_data_1_0_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( input_mat_data_and_3_cse = '1' ) THEN
        input_mat_data_1_1_lpi_1 <= input_rsci_idat(84 DOWNTO 68);
        input_mat_data_1_0_lpi_1 <= input_rsci_idat(67 DOWNTO 51);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_1_2_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( (mux_38_nl AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          AND (NOT(or_dcpl_57 OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0))))
          = '1' ) THEN
        input_mat_data_1_2_lpi_1 <= input_rsci_idat(101 DOWNTO 85);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_mat_data_0_1_lpi_1 <= STD_LOGIC_VECTOR'( "00000000000000000");
      ELSIF ( ((NOT((or_122_cse AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)
          OR or_tmp_44)) OR exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva)
          = '1' ) THEN
        input_mat_data_0_1_lpi_1 <= input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_exs_34_16_0_ctmp_sva_1_1;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1_dfm_1_reg
            <= '0';
      ELSIF ( (mux_20_nl AND and_dcpl_69 AND (NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1)
          AND input_mat_Matrix_for_for_j_1_1_1_lpi_1 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)
          = '1' ) THEN
        reg_determinant_helper_3_get_minor_ac_int_17_true_minor_data_1_1_lpi_1_dfm_1_reg
            <= NOT exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2;
      END IF;
    END IF;
  END PROCESS;
  input_mat_Matrix_for_for_input_mat_Matrix_for_for_mux_22_nl <= MUX_s_1_2_2(input_mat_Matrix_for_i_1_1_lpi_1_dfm_1,
      z_out_1, input_mat_Matrix_for_for_equal_tmp_2);
  nor_43_nl <= NOT((NOT determinant_helper_3_do_determinant_ac_int_17_true_for_and_12_itm_3)
      OR CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_3/=STD_LOGIC_VECTOR'("10")));
  nor_44_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_3(1))
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_1_0(0))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_2)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_3_1_0(1)));
  mux_nl <= MUX_s_1_2_2(nor_43_nl, nor_44_nl, determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3);
  nor_41_nl <= NOT((lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_2)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_2_1_0(0))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0);
  nor_42_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2(0))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_0);
  mux_2_nl <= MUX_s_1_2_2(nor_41_nl, nor_42_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_2(1));
  mux_3_nl <= MUX_s_1_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_2,
      mux_2_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_2_1);
  nor_39_nl <= NOT((lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0(1))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_2)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_st_1_1_0(0))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0);
  nor_40_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(0))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_0);
  mux_4_nl <= MUX_s_1_2_2(nor_39_nl, nor_40_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1));
  mux_5_nl <= MUX_s_1_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1,
      mux_4_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_st_1_1);
  and_95_nl <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))
      AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  and_97_nl <= and_dcpl_95 AND (NOT exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_sva);
  or_9_nl <= (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)));
  mux_6_nl <= MUX_s_1_2_2(or_9_nl, (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  input_mat_Matrix_for_input_mat_Matrix_for_and_8_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1
      AND (NOT exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2);
  determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_or_nl
      <= determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 OR (NOT
      determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1);
  determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_not_4_nl
      <= NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_and_nl
      <= MUX_v_30_2_2(STD_LOGIC_VECTOR'("000000000000000000000000000000"), determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1,
      determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_not_4_nl);
  determinant_helper_3_get_minor_ac_int_17_true_for_mux_4_nl <= MUX_s_1_2_2((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)),
      determinant_helper_3_get_minor_ac_int_17_true_for_and_41_itm_1, or_dcpl_41);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_6_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4 AND
      (NOT determinant_helper_3_get_minor_ac_int_17_true_for_mux_4_nl) AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2;
  or_130_nl <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0))
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31);
  and_187_nl <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(1))
      AND (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  mux_43_nl <= MUX_s_1_2_2(nor_tmp_10, or_130_nl, and_187_nl);
  or_129_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
      OR nor_tmp_10;
  mux_44_nl <= MUX_s_1_2_2(mux_43_nl, or_129_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_9_nl
      <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 AND determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_1_nl
      <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 OR determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_itm_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_and_nl <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_13_rgt
      AND (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1)));
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_12_nl <= determinant_helper_3_get_minor_ac_int_17_true_for_for_or_3_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_nl <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1,
      determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1, determinant_helper_3_get_minor_ac_int_17_true_for_for_1_and_12_nl);
  determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_nl
      <= determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_2_acc_itm_2;
  determinant_helper_3_get_minor_ac_int_17_true_for_for_mux_4_nl <= MUX_s_1_2_2(determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1_dfm_1,
      determinant_helper_3_get_minor_ac_int_17_true_for_for_determinant_helper_3_get_minor_ac_int_17_true_for_for_or_nl,
      determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2);
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_nor_1_nl
      <= NOT((NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_4
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5 OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1)) OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR or_dcpl);
  determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_2_nl
      <= MUX1HOT_s_1_3_2(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2,
      lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_dfm_2_1,
      (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1),
      STD_LOGIC_VECTOR'( determinant_helper_3_do_determinant_ac_int_17_true_for_or_47_ssc_1
      & determinant_helper_3_do_determinant_ac_int_17_true_for_and_26_ssc_1 & determinant_helper_3_do_determinant_ac_int_17_true_for_and_27_ssc_1));
  determinant_helper_3_do_determinant_ac_int_17_true_for_nor_1_nl <= NOT(determinant_helper_3_get_minor_ac_int_17_true_for_and_44_ssc_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_and_27_ssc_1);
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_28_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR'("00"),
      determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_1_tmp,
      determinant_helper_3_do_determinant_ac_int_17_true_for_nor_1_nl);
  and_120_nl <= ((NOT lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1) OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0)
      AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  and_121_nl <= input_mat_Matrix_for_for_j_1_1_1_lpi_1 AND input_mat_Matrix_for_i_1_1_lpi_1;
  mux_8_nl <= MUX_s_1_2_2(nor_tmp, and_120_nl, and_121_nl);
  or_17_nl <= nor_11_cse OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1/=STD_LOGIC_VECTOR'("01"))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0;
  mux_9_nl <= MUX_s_1_2_2(mux_8_nl, or_17_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  mux_7_nl <= MUX_s_1_2_2(nor_tmp, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0,
      lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  or_15_nl <= CONV_SL_1_1(determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp/=STD_LOGIC_VECTOR'("00"));
  mux_10_nl <= MUX_s_1_2_2(mux_9_nl, mux_7_nl, or_15_nl);
  nor_79_nl <= NOT(nor_11_cse OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR nand_21_cse);
  mux_45_nl <= MUX_s_1_2_2(nor_79_nl, (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  nand_20_nl <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1
      AND (NOT mux_45_nl));
  or_178_nl <= (NOT input_mat_Matrix_for_i_1_1_lpi_1) OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1
      OR (NOT input_mat_Matrix_for_for_j_1_1_1_lpi_1) OR lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1;
  mux_46_nl <= MUX_s_1_2_2(nand_20_nl, or_178_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  input_mat_Matrix_for_not_17_nl <= NOT determinant_helper_3_do_determinant_ac_int_17_true_for_asn_sft_lpi_1_st_3;
  determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_1_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1)
      * SIGNED(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_mux_12_itm_1)),
      17));
  determinant_helper_2_do_determinant_ac_int_17_true_for_mux_6_nl <= MUX_v_17_2_2(determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_acc_itm_1,
      input_mat_data_2_0_lpi_1, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1_st_1(1));
  determinant_helper_2_do_determinant_ac_int_17_true_for_mux_7_nl <= MUX_v_17_2_2((NOT
      input_mat_data_1_2_lpi_1), (NOT determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_1_lpi_2),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_2_do_determinant_ac_int_17_true_for_1_mul_nl
      <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(input_mat_data_1_0_lpi_1) *
      SIGNED(input_mat_data_2_2_lpi_1_mx0)), 17));
  and_100_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1;
  and_101_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0))
      AND (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1);
  nor_73_nl <= NOT((NOT input_mat_Matrix_for_i_1_1_lpi_1) OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1
      OR (NOT(input_mat_Matrix_for_for_j_1_1_1_lpi_1 AND lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)));
  nor_74_nl <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      OR (NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR nor_11_cse OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR nand_21_cse)));
  mux_47_nl <= MUX_s_1_2_2(nor_73_nl, nor_74_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_52_nl <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_or_26_nl <= (determinant_helper_3_get_minor_ac_int_17_true_for_for_or_2_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1) OR determinant_helper_3_get_minor_ac_int_17_true_for_and_29_cse_1
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_5 OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1 OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  or_153_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR not_tmp_119;
  and_184_nl <= (determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31)
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0)))
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1 AND
      determinant_helper_3_get_minor_ac_int_17_true_for_unequal_tmp_1_1;
  mux_48_nl <= MUX_s_1_2_2(not_tmp_119, and_184_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(1));
  or_150_nl <= (NOT(CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"))
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)))
      OR nor_tmp_15;
  mux_49_nl <= MUX_s_1_2_2(mux_48_nl, or_150_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2);
  mux_50_nl <= MUX_s_1_2_2(mux_49_nl, nor_tmp_15, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  mux_51_nl <= MUX_s_1_2_2(or_153_nl, mux_50_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  determinant_helper_3_get_minor_ac_int_17_true_for_and_45_nl <= (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_or_tmp_1)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_or_25_nl <= (determinant_helper_3_get_minor_ac_int_17_true_for_for_or_tmp_1
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1) OR determinant_helper_3_get_minor_ac_int_17_true_for_and_29_cse_1
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_equal_tmp_3 OR determinant_helper_3_get_minor_ac_int_17_true_for_for_1_nor_tmp_1
      OR (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR ((NOT and_182_cse) AND determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_48_nl <= and_182_cse AND
      determinant_helper_3_get_minor_ac_int_17_true_for_and_11_m1c_1;
  determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_1_nl
      <= MUX1HOT_v_17_4_2(input_mat_data_1_0_lpi_1, determinant_helper_3_get_minor_ac_int_17_true_minor_data_0_0_lpi_1_mx0,
      input_mat_data_1_1_lpi_1, input_mat_data_2_2_lpi_1_mx0, STD_LOGIC_VECTOR'(
      determinant_helper_3_get_minor_ac_int_17_true_for_and_45_nl & determinant_helper_3_get_minor_ac_int_17_true_for_or_25_nl
      & determinant_helper_3_get_minor_ac_int_17_true_for_and_30_cse_1 & determinant_helper_3_get_minor_ac_int_17_true_for_and_48_nl));
  nand_13_nl <= NOT((CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1/=STD_LOGIC_VECTOR'("10")))
      AND (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(1)));
  or_161_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2
      OR (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  or_160_nl <= (NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_1_lpi_1
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2)))
      OR (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  or_159_nl <= (NOT(determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1
      OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31)))
      OR (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  or_158_nl <= and_182_cse OR (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  mux_53_nl <= MUX_s_1_2_2(or_159_nl, or_158_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0));
  mux_54_nl <= MUX_s_1_2_2(or_160_nl, mux_53_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(1));
  and_183_nl <= nand_8_cse AND or_tmp_77;
  or_155_nl <= CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00"));
  mux_52_nl <= MUX_s_1_2_2(and_183_nl, or_tmp_77, or_155_nl);
  mux_55_nl <= MUX_s_1_2_2(mux_54_nl, mux_52_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2);
  mux_56_nl <= MUX_s_1_2_2(or_161_nl, mux_55_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  or_154_nl <= (NOT (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0)))
      OR (NOT main_stage_0_2) OR determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_1_1
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_or_tmp_1_1;
  mux_57_nl <= MUX_s_1_2_2(mux_56_nl, or_154_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1));
  mux_58_nl <= MUX_s_1_2_2(nand_13_nl, mux_57_nl, determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(0));
  determinant_helper_3_get_minor_ac_int_17_true_for_and_33_nl <= determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2
      AND determinant_helper_3_get_minor_ac_int_17_true_for_and_9_m1c_1 AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2
      AND (NOT and_128_tmp);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_56_nl <= (NOT or_dcpl_42)
      AND determinant_helper_3_get_minor_ac_int_17_true_for_or_32_m1c AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2
      AND (NOT and_128_tmp);
  determinant_helper_3_get_minor_ac_int_17_true_for_and_57_nl <= or_dcpl_42 AND determinant_helper_3_get_minor_ac_int_17_true_for_or_32_m1c
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2 AND
      (NOT and_128_tmp);
  determinant_helper_3_do_determinant_ac_int_17_true_for_and_35_nl <= determinant_helper_3_get_minor_ac_int_17_true_for_and_28_cse_1
      AND determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2 AND
      (NOT and_128_tmp);
  mux1h_nl <= MUX1HOT_v_17_5_2(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT exit_input_mat_Matrix_for_lpi_1_dfm_3_mx0w2,
      1),17)), input_mat_data_1_2_lpi_1, input_mat_Matrix_for_for_slc_input_mat_Matrix_for_for_acc_psp_1_34_16_0_ctmp_sva_1,
      input_mat_data_2_0_lpi_1, input_mat_data_2_1_lpi_1_mx0, STD_LOGIC_VECTOR'(
      (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_equal_tmp_2) &
      determinant_helper_3_get_minor_ac_int_17_true_for_and_33_nl & determinant_helper_3_get_minor_ac_int_17_true_for_and_56_nl
      & determinant_helper_3_get_minor_ac_int_17_true_for_and_57_nl & determinant_helper_3_do_determinant_ac_int_17_true_for_and_35_nl));
  not_235_nl <= NOT and_128_tmp;
  or_179_nl <= (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0)
      OR lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_1 OR (NOT(input_mat_Matrix_for_for_j_1_1_1_lpi_1
      AND input_mat_Matrix_for_i_1_1_lpi_1));
  nor_82_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR (NOT (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(1))));
  mux_63_nl <= MUX_s_1_2_2(nor_82_nl, (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(1)),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  nor_83_nl <= NOT((lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2);
  or_168_nl <= determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1
      OR (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0));
  mux_60_nl <= MUX_s_1_2_2((NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_acc_itm_2),
      or_168_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2);
  nand_23_nl <= NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_1_for_1_1_acc_itm_31
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1);
  or_166_nl <= (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_1_acc_itm_2)
      OR determinant_helper_3_get_minor_ac_int_17_true_for_for_col_1_lpi_1 OR (NOT(determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_acc_itm_2
      OR determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1 OR (determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(1))));
  mux_59_nl <= MUX_s_1_2_2(nand_23_nl, or_166_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(0));
  or_167_nl <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      OR mux_59_nl;
  mux_61_nl <= MUX_s_1_2_2(mux_60_nl, or_167_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0(1));
  or_169_nl <= (lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(1))
      OR mux_61_nl;
  mux_62_nl <= MUX_s_1_2_2(nor_83_nl, or_169_nl, lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  mux_64_nl <= MUX_s_1_2_2(mux_63_nl, mux_62_nl, determinant_helper_3_get_minor_ac_int_17_true_for_mux1h_24_tmp(0));
  or_180_nl <= lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      OR mux_64_nl;
  mux_65_nl <= MUX_s_1_2_2(or_179_nl, or_180_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  mux_32_nl <= MUX_s_1_2_2((NOT mux_31_itm), or_tmp_41, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0);
  mux_36_nl <= MUX_s_1_2_2(sfi_exit_input_mat_Matrix_for_lpi_1, (NOT input_mat_Matrix_for_i_1_1_lpi_1),
      input_mat_Matrix_for_asn_sft_lpi_1);
  nor_15_nl <= NOT(lfst_exitL_exit_input_mat_Matrix_for_2_for_lpi_1_0 OR mux_36_nl);
  mux_37_nl <= MUX_s_1_2_2(input_mat_Matrix_for_i_1_1_lpi_1, nor_15_nl, and_124_cse);
  nor_16_nl <= NOT(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_0
      OR (NOT(nor_11_cse OR (NOT determinant_helper_3_do_determinant_ac_int_17_true_for_j_1_lpi_1)
      OR (NOT determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR CONV_SL_1_1(lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1/=STD_LOGIC_VECTOR'("01"))
      OR (NOT lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2)
      OR CONV_SL_1_1(lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_1_0/=STD_LOGIC_VECTOR'("00")))));
  mux_38_nl <= MUX_s_1_2_2(mux_37_nl, nor_16_nl, lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_lpi_1_dfm_3_1);
  nor_23_nl <= NOT((determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp(1))
      OR (NOT and_dcpl_51));
  mux_18_nl <= MUX_s_1_2_2(and_dcpl_51, determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1,
      lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2);
  or_47_nl <= (lfst_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_1_determinant_helper_3_get_minor_ac_int_17_true_for_2_for_2_lpi_1_2
      AND determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_5_1_lpi_1)
      OR and_dcpl_51;
  or_46_nl <= (determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp(1))
      OR CONV_SL_1_1(determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_1_tmp/=STD_LOGIC_VECTOR'("00"));
  mux_19_nl <= MUX_s_1_2_2(mux_18_nl, or_47_nl, or_46_nl);
  mux_20_nl <= MUX_s_1_2_2(nor_23_nl, mux_19_nl, determinant_helper_3_do_determinant_ac_int_17_true_for_mux1h_42_tmp(0));
  determinant_helper_3_do_determinant_ac_int_17_true_for_mux_15_nl <= MUX_v_31_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(NOT
      input_mat_data_0_1_lpi_1),31)), (determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_31_2_lpi_1
      & determinant_helper_3_get_minor_ac_int_17_true_for_for_1_col2_7_1_lpi_1),
      lfst_exitL_exit_determinant_helper_3_do_determinant_ac_int_17_true_for_2_determinant_helper_3_get_minor_ac_int_17_true_for_lpi_1(0));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(determinant_helper_3_do_determinant_ac_int_17_true_for_mux_15_nl)
      + UNSIGNED'( "0000000000000000000000000000001"), 31));
  input_mat_Matrix_for_for_input_mat_Matrix_for_for_or_6_nl <= input_mat_Matrix_for_i_1_1_lpi_1_dfm_1
      OR (NOT sfi_exit_input_mat_Matrix_for_lpi_1);
  input_mat_Matrix_for_for_mux_25_nl <= MUX_s_1_2_2(input_mat_Matrix_for_asn_sft_lpi_1,
      input_mat_Matrix_for_for_input_mat_Matrix_for_for_or_6_nl, and_dcpl_121);
  input_mat_Matrix_for_for_mux_26_nl <= MUX_s_1_2_2(input_mat_Matrix_for_for_j_1_1_1_lpi_1_dfm_1,
      input_mat_Matrix_for_asn_sft_lpi_1, and_dcpl_121);
  z_out_1 <= MUX_s_1_2_2(input_mat_Matrix_for_for_mux_25_nl, input_mat_Matrix_for_i_1_1_lpi_1_dfm_1,
      input_mat_Matrix_for_for_mux_26_nl);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    determinant
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_pkg_v1.ALL;
USE work.ccs_out_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;


ENTITY determinant IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (152 DOWNTO 0);
    input_rsc_triosy_lz : OUT STD_LOGIC;
    result_rsc_dat : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
    result_rsc_triosy_lz : OUT STD_LOGIC
  );
END determinant;

ARCHITECTURE v1 OF determinant IS
  -- Default Constants

  COMPONENT determinant_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (152 DOWNTO 0);
      input_rsc_triosy_lz : OUT STD_LOGIC;
      result_rsc_dat : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
      result_rsc_triosy_lz : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL determinant_core_inst_input_rsc_dat : STD_LOGIC_VECTOR (152 DOWNTO 0);
  SIGNAL determinant_core_inst_result_rsc_dat : STD_LOGIC_VECTOR (16 DOWNTO 0);

BEGIN
  determinant_core_inst : determinant_core
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => determinant_core_inst_input_rsc_dat,
      input_rsc_triosy_lz => input_rsc_triosy_lz,
      result_rsc_dat => determinant_core_inst_result_rsc_dat,
      result_rsc_triosy_lz => result_rsc_triosy_lz
    );
  determinant_core_inst_input_rsc_dat <= input_rsc_dat;
  result_rsc_dat <= determinant_core_inst_result_rsc_dat;

END v1;



