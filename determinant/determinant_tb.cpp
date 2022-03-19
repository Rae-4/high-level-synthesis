#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cmath>
#include <ctime>
#include <string>

#include "mc_scverify.h"
#include "determinant.h"


#define N_TESTS 5;
// Simple testbench. The result should be 2882 if the determinant implementation is correct. It is recommended to develop this TB further.

void get_minor(int **minor, int **source, int n, int i, int j);
int ref_determinant(int **matrix, int n);
void print_matrix(std::ofstream file, int (*get_elem)(int, int), int n);

CCS_MAIN(int argc, char *argv[])
{
    // Open the testbench result report file
    std::string filename = "determinant_tb_output.txt"
    time_t now = time(0);
    char *timestring = ctime(&now);

    std::ofstream ofile;
    ofile.open(filename, std::ios::out);
    ofile << "Determinant testbench results - " << timestring << std::endl;

    int det_ref;
    int error_count = 0;
    ac_int<W,S> det_duv;
    ac_int<W,S> max, min;
    max.set_val<AC_VAL_MAX>();
    min.set_val<AC_VAL_MIN>();


    // Control test values and negative values. Expanded with modulo indexes for larger arrays.
    ac_int<W,S> A[N][N] = { {1,0,10},{11,12,0},{33,55,66} }; // Determinant = 2882;
    
    // Initialize the reference source matrix.
    int **matrix_ref = new int*[N];
    for (int i = 0; i < N; ++i) {
        matrix_ref[i] = new int[N];
    }

    ac_int<W,S> matrix_duv[N][N];

    // Test with control values
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrix_duv[i][j] = A[i % 3][j % 3];
            matrix_ref[i][j] = A[i % 3][j % 3];
        }
    }
    det_ref = ref_determinant(matrix_ref, N);
    CCS_DESIGN(determinant)(matrix_duv, det_duv);

    if (det_ref == det_duv) {
        ofile << "Test control values - OK" << std::endl;
    }
    else {
        ofile << "Test control values - ERROR" << std::endl;
        ofile << "Reference matrix:" << std::endl;
        print_matrix(ofile, [matrix_ref](int i, int j){ return matrix_ref[i][j]; }, N);
        ofile << "Reference determinant: " << det_ref << std::endl;
        ofile << "DUV matrix:" << std::endl;
        print_matrix(ofile, [matrix_duv](int i, int j){ return matrix_duv[i][j]; }, N);
        ofile << "DUV determinant: " << det_duv << std::endl;
        ofile << std::endl;
        error_count++;
    }

    // Test with negative control values
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrix_duv[i][j] = -A[i % 3][j % 3];
            matrix_ref[i][j] = -A[i % 3][j % 3];
        }
    }
    det_ref = ref_determinant(matrix_ref, N);
    CCS_DESIGN(determinant)(matrix_duv, det_duv);
    
    if (det_ref == det_duv) {
        ofile << "Test negative control values - OK" << std::endl;
    }
    else {
        ofile << "Test negative control values - ERROR" << std::endl;
        ofile << "Reference matrix:" << std::endl;
        print_matrix(ofile, [matrix_ref](int i, int j){ return matrix_ref[i][j]; }, N);
        ofile << "Reference determinant: " << det_ref << std::endl;
        ofile << "DUV matrix:" << std::endl;
        print_matrix(ofile, [matrix_duv](int i, int j){ return matrix_duv[i][j]; }, N);
        ofile << "DUV determinant: " << det_duv << std::endl;
        ofile << std::endl;
        error_count++;
    }

    // Random values test
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            int random_value = (rand() % (max-min)) + min;
            matrix_duv[i][j] = random_value;
            matrix_ref[i][j] = random_value;
        }
    }
    det_ref = ref_determinant(matrix_ref, N);
    CCS_DESIGN(determinant)(matrix_duv, det_duv);

    if (det_ref == det_duv) {
        ofile << "Test random values - OK" << std::endl;
    }
    else {
        ofile << "Test random values - ERROR" << std::endl;
        ofile << "Reference matrix:" << std::endl;
        print_matrix(ofile, [matrix_ref](int i, int j){ return matrix_ref[i][j]; }, N);
        ofile << "Reference determinant: " << det_ref << std::endl;
        ofile << "DUV matrix:" << std::endl;
        print_matrix(ofile, [matrix_duv](int i, int j){ return matrix_duv[i][j]; }, N);
        ofile << "DUV determinant: " << det_duv << std::endl;
        ofile << std::endl;
        error_count++;
    }

    // Print error message to console
    if (error_count == 0) {
        std::cout << "Test OK, no errors found." << std::endl;
    } else {
        std::cout << "Errors in "
                  << error_count 
                  << " testcases. Details in " 
                  << filename << std::endl;
    }

    // Close the output file
    ofile.close();

    // Cleanup the reference array
    for (int i = 0; i < N; ++i) {
        delete matrix_ref[i];
    }
    delete [] matrix_ref;
    
    CCS_RETURN(0);
}


/// Return the minor matrix at i,j for source matrix
void get_minor(int **minor, int **source, int n, int i, int j)
{
    int source_row, source_col;

    for (int row = 0; row < n-1; ++row) {
        for (int col = 0; col < n-1; ++col) {
            source_row = row + (row >= i ? 1 : 0);
            source_col = col + (col >= j ? 1 : 0);
            minor[row][col] = source[source_row][source_col];
        }
    }
}

/// Return the determinant for a nxn matrix
int ref_determinant(int **matrix, int n)
{
    int det = 0;

    // End the recursion on 1x1 matrix
    if (n == 1)
        return matrix[1][1];

    // Initialize the minor array
    int **minor = new int*[n-1];
    for (int i = 0; i < n-1; ++i) {
        minor[i] = new int[n-1];
    }

    // Calculate the determinant recursively
    for (int j = 0; j < n; ++j) {
        get_minor(minor, matrix, n, 0, j);
        det += (j % 2 == 0 ? 1 : -1) * matrix[0][j] * ref_determinant(minor, n-1);
    }

    // Cleanup the minor array
    for (int i = 0; i < n-1; ++i) {
        delete minor[i];
    }
    delete[] minor;

    return det;
}

/// Print a matrix of nxn dimensions to file. Function get_elem provides the 
// matrix element at (i, j) position. 
void print_matrix(std::ofstream file, int (*get_elem)(int, int), int n)
{
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            file << get_elem(i, j) << " ";
        }
        file << std::endl;
    }
    file << std::endl;
}