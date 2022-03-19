// ccs_block_macros.h
#include "mc_testbench.h"
extern void mc_testbench_capture_IN( ac_int<17, true > input[3][3],  ac_int<17, true > &result);
extern void mc_testbench_capture_OUT( ac_int<17, true > input[3][3],  ac_int<17, true > &result);
extern void mc_testbench_wait_for_idle_sync();

#ifdef CCS_DESIGN_FUNC_determinant
#define ccs_intercept_determinant_67 \
  ccs_real_determinant(ac_int<17, true > input[3][3],ac_int<17, true > &result);\
  void determinant(ac_int<17, true > input[3][3],ac_int<17, true > &result)\
{\
    static bool ccs_intercept_flag = false;\
    if (!ccs_intercept_flag) {\
      std::cout << "SCVerify intercepting C++ function 'determinant' for RTL block 'determinant'" << std::endl;\
      ccs_intercept_flag=true;\
    }\
    mc_testbench_capture_IN(input,result);\
    ccs_real_determinant(input,result);\
    mc_testbench_capture_OUT(input,result);\
}\
  void ccs_real_determinant
#else
#define ccs_intercept_determinant_67 determinant
#endif
// Matrix 28 INLINE
#define ccs_intercept_Matrix_28 Matrix
// setElement 35 INLINE
#define ccs_intercept_setElement_35 setElement
// const 47 INLINE
#define ccs_intercept_const_47 const
// do_determinant 52 INLINE
#define ccs_intercept_do_determinant_52 do_determinant
// do_determinant 34 INLINE
#define ccs_intercept_do_determinant_34 do_determinant
// get_minor 17 INLINE
#define ccs_intercept_get_minor_17 get_minor
// determinant_calc 60 INLINE
#define ccs_intercept_determinant_calc_60 determinant_calc
