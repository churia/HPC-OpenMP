MPCC=gcc
CC=gcc
MPFLAGS=-O3 -fopenmp -Wall -lrt -lm
FLAGS=-O3 -Wall -lrt -lm
EXECS=jacobi2D-omp gs2D-omp gs2D-serial jacobi2D-serial

all: ${EXECS}

jacobi2D-serial: jacobi2D.c
	${CC} ${FLAGS} jacobi2D.c -o jacobi2D-serial

#jacobi2D: jacobi2D-omp.c
#	${CC} ${FLAGS} jacobi2D-omp.c -o jacobi2D

jacobi2D-omp: jacobi2D-omp.c
	${MPCC} ${MPFLAGS} jacobi2D-omp.c -o jacobi2D-omp

gs2D-serial : gs2D.c
	${CC} ${FLAGS} gs2D-omp.c -o gs2D-serial

#gs2D: gs2D-omp.c
#	${CC} ${FLAGS} gs2D-omp.c -o gs2D

gs2D-omp: gs2D-omp.c
	${MPCC} ${MPFLAGS} gs2D-omp.c -o gs2D-omp





clean:
	rm -f ${EXECS}
