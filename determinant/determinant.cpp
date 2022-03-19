// name             :   Joonas Ikonen
// student number   :   150244761
#include "determinant.h"
#include <ac_assert.h>

#include "matrix.h"

// Helper struct for determinant calculation
template<int N_det>
struct determinant_helper
{
  // Prevent N_det from being larger than 10
  static_assert(N_det <= 10, "N_det can not be larger than 10" );
  // typedef ac_int<ac::log2_ceil<N_det>::val> index_t;
  
  // Return the minor matrix of element (i,j) for determinant calculation
  template<typename T>
  static Matrix<T, N_det-1> get_minor(const Matrix<T, N_det>& matrix, int i, int j)
  {
    const int minor_n = N_det - 1;
    Matrix<T, minor_n> minor;
    int source_col = 0;
    int source_row = 0;

    for (int row = 0; row != minor_n; row++) {
      if (row >= i) 
        source_row = row + 1;
      else
        source_row = row;
      for (int col = 0; col != minor_n; col++) {
        if (col >= j) 
          source_col = col + 1;
        else
          source_col = col;

        minor.setElement(row, col, matrix.getElement(source_row, source_col));
      }
    }
    return minor;
  }

  // Recursively calculate determinant
  template <typename T>
  static T do_determinant(const Matrix<T, N_det>& param)
  {
	// TODO: Calculate and return the determinant of the param matrix. You will need to recursively call do_determinant here.
    T determinant = 0;
    for (int j = 0; j != N_det; j++) {
      const Matrix<T, N_det-1> minor = determinant_helper<N_det>::get_minor<T>(param, 0, j);
      T minor_determinant = determinant_helper<N_det-1>::do_determinant(minor);
      determinant += ((j % 2 == 0) ? 1 : -1) * param.getElement(0, j) * minor_determinant;
    }
    return determinant;
  }
};

// Determinant specialization for 1x1 matrix
template<>
struct determinant_helper<1>
{
  template<typename T>
  static T do_determinant(const Matrix<T, 1>& param)
  {
    return param.getElement(0, 0);
  }
};

// Function for determinant calculation. Uses helper struct to work around partial specialization
template<typename T, int N_det>
T determinant_calc(const Matrix<T, N_det>& param)
{
  T determinant = determinant_helper<N_det>::do_determinant(param);
  return determinant;
}

// Top-level function. No modifications needed
void determinant(ac_int<W,S> input[N][N], ac_int<W,S> &result)
{
  Matrix<ac_int<W,S>, N> input_mat(input);
  result = determinant_calc(input_mat);
}

