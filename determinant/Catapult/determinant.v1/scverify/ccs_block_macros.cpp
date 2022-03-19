void mc_testbench_capture_IN( ac_int<17, true > input[3][3],  ac_int<17, true > &result) { testbench::capture_IN(input,result); }
void mc_testbench_capture_OUT( ac_int<17, true > input[3][3],  ac_int<17, true > &result) { testbench::capture_OUT(input,result); }
void mc_testbench_wait_for_idle_sync() {testbench::wait_for_idle_sync(); }
