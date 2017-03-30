MPCC=gcc
CC=gcc
MPFLAGS=-O3 -fopenmp -Wall  -lm
FLAGS=-O3 -Wall  -lm
EXECS=omp_solved2 omp_solved3 omp_solved4 omp_solved5 omp_solved6 jacobi2D-omp gs2D-omp gs2D-serial hw2.pdf

all: ${EXECS}

omp_solved2:omp_solved2.c
	${MPCC} ${MPFLAGS} omp_solved2.c -o omp_solved2

omp_solved3:omp_solved3.c
	${MPCC} ${MPFLAGS} omp_solved3.c -o omp_solved3

omp_solved4:omp_solved4.c
	${MPCC} ${MPFLAGS} omp_solved4.c -o omp_solved4

omp_solved5:omp_solved5.c
	${MPCC} ${MPFLAGS} omp_solved5.c -o omp_solved5

omp_solved6:omp_solved6.c
	${MPCC} ${MPFLAGS} omp_solved6.c -o omp_solved6

jacobi2D-omp: jacobi2D-omp.c
	${MPCC} ${MPFLAGS} jacobi2D-omp.c -o jacobi2D-omp

gs2D-omp: gs2D-omp.c
	${MPCC} ${MPFLAGS} gs2D-omp.c -o gs2D-omp

gs2D-serial : gs2D-serial.c
	${CC} ${FLAGS} gs2D-serial.c -o gs2D-serial
hw2.pdf:
	pdflatex hw2.tex

clean:
	rm -f ${EXECS} *.aux *.log *.gz
