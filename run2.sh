#!/bin/sh

#./gs2D-serial 24 2000 > log/gs24
#./gs2D-omp 24 2000 > log/gs24-omp
#./gs2D-serial 100 100000 > log/gs100
#./gs2D-omp 100 100000 > log/gs100-omp
./gs2D-serial 500 500000 > log/gs500
./gs2D-omp 500 500000 > log/gs500-omp
./gs2D-serial 1000 1000000 > log/gs1000
./gs2D-omp 1000 1000000 > log/gs1000-omp

