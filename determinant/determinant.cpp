#include "determinant.h"
#include <ac_assert.h>

// TODO: Insert your matrix class implementation here.


// Helper struct for determinant calculation
template<int N_det>
struct determinant_helper
{
  // TODO: Insert static assert here to prevent N_det for being larger than 10. See e.g. https://www.geeksforgeeks.org/understanding-static_assert-c-11/ 	
  // Return the minor matrix of element (i,j) for determinant calculation
  template<typename T>
  static Matrix<T, N_det-1> get_minor(const Matrix<T, N_det>& matrix, int i, int j)
  {
    // TODO: Implement the body of the function to extract and return the minor matrix based on the parameters
	// This you should use as a helper function for do_determinant below
  }

  // Recursively calculate determinant
  template <typename T>
  static T do_determinant(const Matrix<T, N_det>& param)
  {
	// TODO: Calculate and return the determinant of the param matrix. You will need to recursively call do_determinant here.
  }
};

// Determinant specialization for 1x1 matrix
template<> struct determinant_helper<1>
{
  // TODO: Implement the do_determinant template function for 1x1 matrix
};

// Function for determinant calculation. Uses helper struct to work around partial specialization
template<typename T, int N_det>
T determinant_calc(const Matrix<T, N_det>& param)
{
  // TODO: Call the do_determinant function of the determinant_helper struct to get the return value
}

// Top-level function. No modifications needed
void determinant(ac_int<W,S> input[N][N], ac_int<W,S> &result)
{
  Matrix<ac_int<W,S>, N> input_mat(input);
  result = determinant_calc(input_mat);
}

