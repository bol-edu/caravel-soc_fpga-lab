
#include <iostream>
#include <cstdlib>
#include "mmult.h"

using namespace std;

#define MAX_SIZE 16

void reference_mmult(int* a, int* b, int* c, int a_row, int a_col, int b_col) {
    for (int i = 0; i < a_row; i++) {
        for (int j = 0; j < b_col; j++) {
            int sum = 0;
            for (int k = 0; k < a_col; k++) {
                sum += a[i * a_col + k] * b[k * b_col + j];
            }
            c[i * b_col + j] = sum;
        }
    }
}

void print_matrix(int* matrix, size_t rows, size_t cols, const char* name) {
    std::cout << "Matrix " << name << ":\n";
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            std::cout << matrix[i * cols + j] << " ";
        }
        std::cout << "\n";
    }
    std::cout << "\n";
}

void mmult(volatile int* a, volatile int* b, volatile int* c, int a_row, int a_col, int b_col);

int main(int argc, char *argv[]) {
	int a[MAX_SIZE * MAX_SIZE];
	int b[MAX_SIZE * MAX_SIZE];
	int c[MAX_SIZE * MAX_SIZE];
	int c_ref[MAX_SIZE * MAX_SIZE];

    // Initialize matrices with random data
    for (int i = 0; i < MAX_SIZE * MAX_SIZE; i++) {
        a[i] = std::rand() % 10;
    }
    for (int i = 0; i < MAX_SIZE * MAX_SIZE; i++) {
        b[i] = std::rand() % 10;
    }

    // Print the initialized matrices
    print_matrix(a, MAX_SIZE, MAX_SIZE, "A");
    print_matrix(b, MAX_SIZE, MAX_SIZE, "B");

    // Compute the reference result
    reference_mmult(a, b, c_ref, MAX_SIZE, MAX_SIZE, MAX_SIZE);

    // Run the HLS kernel
    mmult(a, b, c, MAX_SIZE, MAX_SIZE, MAX_SIZE);

    // Compare results
    bool pass = true;
    for (int i = 0; i < MAX_SIZE * MAX_SIZE; i++) {
        if (c[i] != c_ref[i]) {
            pass = false;
            std::cout << "Mismatch at index " << i << ": HW=" << c[i] << ", Ref=" << c_ref[i] << "\n";
        }
        else{
            std::cout << "Correct at index " << i << ": HW=" << c[i] << ", Ref=" << c_ref[i] << "\n";
        }
    }

    if (pass) {
        std::cout << "Test Passed\n";
    } else {
        std::cout << "Test Failed\n";
    }

    return pass ? 0 : 1;
}

