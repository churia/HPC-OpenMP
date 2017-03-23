#!/bin/sh

#./jacobi2D 24 2000 > log/jb24
#./jacobi2D-omp 24 2000 > log/jb24-omp
#./jacobi2D 100 100000 > log/jb100
#./jacobi2D-omp 100 100000 > log/jb100-omp
./jacobi2D 500 500000 > log/jb500
./jacobi2D-omp 500 500000 > log/jb500-omp
#./jacobi2D 1000 1000000 > log/jb1000
#./jacobi2D-omp 1000 1000000 > log/jb1000-omp

