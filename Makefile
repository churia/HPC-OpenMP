MPCC=gcc
CC=gcc
MPFLAGS=-O3 -fopenmp -Wall -lrt -lm
FLAGS=-O3 -Wall -lrt -lm
EXECS=jacobi2D-omp gs2D-omp gs2D-serial 

all: ${EXECS}

jacobi2D-omp: jacobi2D-omp.c
	${MPCC} ${MPFLAGS} jacobi2D-omp.c -o jacobi2D-omp

gs2D-omp: gs2D-omp.c
	${MPCC} ${MPFLAGS} gs2D-omp.c -o gs2D-omp

gs2D-serial : gs2D-serial.c
	${CC} ${FLAGS} gs2D-serial.c -o gs2D-serial


clean:
	rm -f ${EXECS}
