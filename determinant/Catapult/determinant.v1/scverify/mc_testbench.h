// ----------------------------------------------------------------------------
// SystemC Testbench Header
//
//    HLS version: 10.3d/815731 Production Release
//       HLS date: Wed Apr 24 14:54:19 PDT 2019
//  Flow Packages: HDL_Tcl 8.0a, SCVerify 8.0a
//
//   Generated by: student@SoC-courses
// Generated date: Sat Mar 19 19:12:33 EET 2022
//
// ----------------------------------------------------------------------------
#ifdef CCS_SCVERIFY

// 
// -------------------------------------
// testbench
// User supplied testbench
// -------------------------------------
// 
#ifndef INCLUDED_TESTBENCH_H
#define INCLUDED_TESTBENCH_H

extern void mc_testbench_input_skip(bool v);
extern void mc_testbench_result_skip(bool v);

#ifndef SC_USE_STD_STRING
#define SC_USE_STD_STRING
#endif

#include "../../determinant.h"
#include <ac_assert.h>
#include "../../matrix.h"
#include <systemc.h>
#include <tlm.h>
#include <ac_int.h>
#include <mc_container_types.h>
#include <mc_typeconv.h>
#include <mc_transactors.h>
#include <mc_comparator.h>
#include <mc_end_of_testbench.h>
#include <vector>


class testbench : public sc_module
{
public:
   // Interface Ports
   sc_in< bool > clk;
   sc_port< tlm::tlm_fifo_put_if< mgc_sysc_ver_array1D<ac_int<17, true >,9> > > ccs_input;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_input;
   sc_port< tlm::tlm_fifo_get_if< ac_int<17, true > > > ccs_result;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_result;
   sc_in< bool > design_is_idle;
   sc_out< sc_logic > enable_stalls;
   sc_in< unsigned short > stall_coverage;
   
   // Data objects
   bool testbench_ended;
   int main_exit_code;
   bool atleast_one_active_input;
   sc_time last_event_time;
   sc_time last_event_time2;
   sc_signal< bool >                          cpp_testbench_active;
   sc_event testbench_end_event;
   int argc;
   const char* const *argv;
   bool _checked_results;
   bool _failed;
   static testbench* that;
   int main();
   static bool enable_idle_sync_mode;
   static unsigned short idle_sync_stable_cycles;
   static bool input_ignore;
   static bool input_skip;
   static bool input_skip_quiet;
   static bool input_skip_once;
   static bool input_skip_noerr;
   static int input_array_comp_first;
   static int input_array_comp_last;
   bool _capture_input;
   static mc_wait_ctrl input_wait_ctrl;
   int input_capture_count;
   int input_iteration_count;
   static bool result_ignore;
   static bool result_skip;
   static bool result_skip_quiet;
   static bool result_skip_once;
   static bool result_skip_noerr;
   static int result_array_comp_first;
   static int result_array_comp_last;
   static bool result_use_mask;
   static ac_int<17, true > result_output_mask;
   tlm::tlm_fifo< mc_golden_info< ac_int<17, true >, ac_int<17, true > > > result_golden;
   bool _capture_result;
   static mc_wait_ctrl result_wait_ctrl;
   int result_capture_count;
   int result_iteration_count;
   int wait_cnt;
   
   // Named Objects
   
   // Module instance pointers
   mc_comparator< ac_int<17, true > , ac_int<17, true > > *result_comp;
   
   // Declare processes (SC_METHOD and SC_THREAD)
   void wait_for_end();
   void run();
   
   // Constructor
   SC_HAS_PROCESS(testbench);
   testbench(
      const sc_module_name& name
   )
      : clk("clk")
      , ccs_input("ccs_input")
      , ccs_wait_ctrl_input("ccs_wait_ctrl_input")
      , ccs_result("ccs_result")
      , ccs_wait_ctrl_result("ccs_wait_ctrl_result")
      , design_is_idle("design_is_idle")
      , enable_stalls("enable_stalls")
      , stall_coverage("stall_coverage")
      , cpp_testbench_active("cpp_testbench_active")
      , result_golden("result_golden",-1)
   {
      // Instantiate other modules
      result_comp = new mc_comparator< ac_int<17, true > , ac_int<17, true > > (
         "result_comp",
         "result",
         0,
         0,
         1
      );
      result_comp->data_in(ccs_result);
      result_comp->data_golden(result_golden);
      
      
      // Register processes
      SC_METHOD(wait_for_end);
      sensitive << clk.pos() << testbench_end_event;
      SC_THREAD(run);
      // Other constructor statements
      set_stack_size(64000000);
      argc = sc_argc();
      argv = sc_argv();
      _checked_results = false;
      that = this;
      testbench_ended = false;
      main_exit_code = 0;
      atleast_one_active_input = true;
      _failed = false;
      _capture_input = true;
      _capture_result = true;
      wait_cnt = 0;
   }
   
   ~testbench()
   {
      delete result_comp;
      result_comp = 0;
   }
   
   // C++ class functions
   public:
      static void wait_for_idle_sync() ;
   public:
      static void set_enable_stalls(bool flag) ;
   public:
      void capture_input( ac_int<17, true > input[3][3]) ;
   public:
      void capture_result( ac_int<17, true > &result) ;
   protected:
      void wait_on_input_required() ;
   public:
      static void capture_IN( ac_int<17, true > input[3][3],  ac_int<17, true > &result) ;
   public:
      static void capture_OUT( ac_int<17, true > input[3][3],  ac_int<17, true > &result) ;
   public:
      static void exec_determinant( ac_int<17, true > input[3][3],  ac_int<17, true > &result) ;
   protected:
      void start_of_simulation() ;
   protected:
      void end_of_simulation() ;
   public:
      void check_results() ;
   public:
      bool failed() ;
   public:
      void set_failed(bool fail) ;
};
#endif
#endif