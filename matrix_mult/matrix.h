/// Class-based matrix implementation.
// name             :   Joonas Ikonen
// student number   :   150244761

#ifndef _MATRIX
#define _MATRIX

#include <ac_int.h>
#include "matrix_mult.h"

/// Matrix class
// template params:
//  element_t: algorithmic c datatype
//  N: Width of the matrix
template<typename element_t, int N>
class Matrix {
public:
    /// Bit accurate type for indexing the matrix
    typedef ac_int<ac::log2_ceil<N+1>::val, false> index_t;
    /// Element type for multiplication result
    //typedef ac_int<2*element_t::width+ac::log2_ceil<N>::val, false> result_element_t;
    typedef hls_result_t result_element_t;
    typedef Matrix<result_element_t, N> mult_result_t;

    /// Initialize the matrix to zero
    Matrix() : transposed(false), wptr(0), rptr(0) {
        ac::init_array<AC_VAL_0>(&data[0][0], N*N);
        ac::init_array<AC_VAL_DC>(&cache_a[0], 2*N);
        ac::init_array<AC_VAL_DC>(&cache_b[0], 2*N);
    }
    
    /// Initialize the matrix with input values
    Matrix(element_t input_vals[N][N]) : transposed(false), wptr(0), rptr(0) { 
        for (index_t i = 0; i != N; i++) {
            for (index_t j = 0; j != N; j++) {
                setElement(i, j, input_vals[i][j]);
            }
        }
        ac::init_array<AC_VAL_DC>(&cache_a[0], 2*N);
        ac::init_array<AC_VAL_DC>(&cache_b[0], 2*N);
    }
    
    /// Set a value to an element in the matrix.
    void setElement(index_t i, index_t j, element_t val) {
        index_t a, b;
        if (transposed) {
            a = j;
            b = i;
        } else {
            a = i;
            b = j;
        }
        data[a][b] = val;
    }

    /// Return a value of an element in the matrix.
    element_t getElement(index_t i, index_t j) const {
        index_t a, b;
        if (transposed) {
            a = j;
            b = i;
        } else {
            a = i;
            b = j;
        }
        return data[a][b];
    }
    
    /// Transpose the matrix
    void transpose(bool tr) {
        transposed = tr;
    };
    
    /// Return true if matrix is transposed.
    bool is_transposed() {
        return transposed;
    }

    /// Operator overload for matrix multiplication
    mult_result_t operator * (Matrix& param) {
        mult_result_t result;
        result_element_t tmp;
               
        for (index_t i = 0; i != N; i++) {                
            for (index_t j = 0; j != N+1; j++) {
                if (j != N) 
                    mem_to_cache(i, j);

                if (j != 0) {
                    mac_cache(tmp);
                    result.setElement(i, j-1, tmp);
                }
            }
        }
        return result;
    }

    /// Read a row/col of values from matrix memory to cache
    void mem_to_cache(index_t i, index_t j) {
        for (index_t k = 0; k != N; k++) {
            cache_a[wptr] = getElement(i, k);
            cache_b[wptr] = param.getElement(k, j);
        }
        wptr = wptr ? 0:1;
    }

    /// Multiply accumulate the cached row and column
    void mac_cache(result_element_t &value) {
        value = 0;
        index_t offset = (rptr ? N:0);
        for (int k = 0; k != N; k++) {
            value += cache_a[offset+k] * cache_b[offset+k];
        }
        rptr = (rptr ? 0:1);
    }

    /// Move the contents of the matrix class to the target array.
    void toArray(element_t target[N][N]) {
        for (index_t i = 0; i != N; i++) {
            for (index_t j = 0; j != N; j++) {
                target[i][j] = getElement(i, j);
            }
        }
    }

private:
    element_t data[N][N];
    element_t cache_a[2*N];
    element_t cache_b[2*N];
    ac_int<1, false> wptr;
    ac_int<1, false> rptr;
    bool transposed;
};

#endif
