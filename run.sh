#!/bin/sh

#./jacobi2D 24 2000 > log/jb24
#./jacobi2D-omp 24 2000 > log/jb24-omp
#./jacobi2D 100 100000 > log/jb100
#./jacobi2D-omp 100 100000 > log/jb100-omp
# ./jacobi2D 500 500000 > log/jb500
# ./jacobi2D-omp 500 500000 > log/jb500-omp
#./jacobi2D 1000 1000000 > log/jb1000
#./jacobi2D-omp 1000 1000000 > log/jb1000-omp

OMP_NUM_THREADS=2 ./jacobi2D-omp 500 100000 > log/jb_500_2
OMP_NUM_THREADS=4 ./jacobi2D-omp 500 100000 > log/jb_500_4
OMP_NUM_THREADS=8 ./jacobi2D-omp 500 100000 > log/jb_500_8
OMP_NUM_THREADS=10 ./jacobi2D-omp 500 100000 > log/jb_500_10
OMP_NUM_THREADS=16 ./jacobi2D-omp 500 100000 > log/jb_500_16
OMP_NUM_THREADS=24 ./jacobi2D-omp 500 100000 > log/jb_500_24
OMP_NUM_THREADS=32 ./jacobi2D-omp 500 100000 > log/jb_500_32
OMP_NUM_THREADS=48 ./jacobi2D-omp 500 100000 > log/jb_500_48
OMP_NUM_THREADS=64 ./jacobi2D-omp 500 100000 > log/jb_500_64

OMP_NUM_THREADS=2 ./gs2D-omp 500 100000 > log/gs_500_2
OMP_NUM_THREADS=4 ./gs2D-omp 500 100000 > log/gs_500_4
OMP_NUM_THREADS=8 ./gs2D-omp 500 100000 > log/gs_500_8
OMP_NUM_THREADS=10 ./gs2D-omp 500 100000 > log/gs_500_10
OMP_NUM_THREADS=16 ./gs2D-omp 500 100000 > log/gs_500_16
OMP_NUM_THREADS=24 ./gs2D-omp 500 100000 > log/gs_500_24
OMP_NUM_THREADS=32 ./gs2D-omp 500 100000 > log/gs_500_32
OMP_NUM_THREADS=48 ./gs2D-omp 500 100000 > log/gs_500_48
OMP_NUM_THREADS=64 ./gs2D-omp 500 100000 > log/gs_500_64

OMP_NUM_THREADS=2 ./jacobi2D-omp 1000 10000 > log/jb_1000_2
OMP_NUM_THREADS=4 ./jacobi2D-omp 1000 10000 > log/jb_1000_4
OMP_NUM_THREADS=8 ./jacobi2D-omp 1000 10000 > log/jb_1000_8
OMP_NUM_THREADS=10 ./jacobi2D-omp 1000 10000 > log/jb_1000_10
OMP_NUM_THREADS=16 ./jacobi2D-omp 1000 10000 > log/jb_1000_16
OMP_NUM_THREADS=24 ./jacobi2D-omp 1000 10000 > log/jb_1000_24
OMP_NUM_THREADS=32 ./jacobi2D-omp 1000 10000 > log/jb_1000_32
OMP_NUM_THREADS=48 ./jacobi2D-omp 1000 10000 > log/jb_1000_48
OMP_NUM_THREADS=64 ./jacobi2D-omp 1000 10000 > log/jb_1000_64

OMP_NUM_THREADS=2 ./gs2D-omp 1000 10000 > log/gs_1000_2
OMP_NUM_THREADS=4 ./gs2D-omp 1000 10000 > log/gs_1000_4
OMP_NUM_THREADS=8 ./gs2D-omp 1000 10000 > log/gs_1000_8
OMP_NUM_THREADS=10 ./gs2D-omp 1000 10000 > log/gs_1000_10
OMP_NUM_THREADS=16 ./gs2D-omp 1000 10000 > log/gs_1000_16
OMP_NUM_THREADS=24 ./gs2D-omp 1000 10000 > log/gs_1000_24
OMP_NUM_THREADS=32 ./gs2D-omp 1000 10000 > log/gs_1000_32
OMP_NUM_THREADS=48 ./gs2D-omp 1000 10000 > log/gs_1000_48
OMP_NUM_THREADS=64 ./gs2D-omp 1000 10000 > log/gs_1000_64
