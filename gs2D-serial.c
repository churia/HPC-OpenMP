/* modified from Georg Stadler's code
 */
#include <stdio.h>
#include <math.h>
#include "util.h"
#include <string.h>

#define epsilon 1e-5

/* compuate global residual, assuming ghost values are updated */
double compute_residual(double *u, int M, double hsq)
{
  int i;
  double tmp, res = 0.0;
  for (i = M+1; i <= M*(M-1)-2; i++){
    if(i % M == 0 || i % M == M-1 )
      continue; //pass border points!
    tmp = ((4.0 * u[i] - u[i-1] - u[i+1]- u[i-M] - u[i+M]) / hsq - 1);
    res += tmp * tmp;
  }
  return sqrt(res);
}


int main(int argc, char * argv[])
{
  int i, N, M,iter, max_iters;

  sscanf(argv[1], "%d", &N);
  sscanf(argv[2], "%d", &max_iters);

  /* timing */
  timestamp_type time1, time2;
  get_timestamp(&time1);
  M = N+2; //include border points
  
  /* Allocation of vectors, including bolder points */
   double * u    = (double *) calloc(sizeof(double), M*M);

  double h = 1.0 / (N + 1);
  double hsq = h * h;
  double res, res0;

  //initialize points
  for(i = 0; i < M*M; i++){
    u[i] = 0.0;
  }

  /* initial residual */
  res0 = compute_residual(u, M, hsq);
  res = res0;
  printf("Iter 0 Residual %g\n", res0);

  for (iter = 1; iter <= max_iters && res > epsilon*res0; iter++) {

    /* Gauss-Seidel step for all the inner points */
    for (i = M+1; i <= M*(M-1)-2; i++){
      if(i % M == 0 || i % M == M-1 )
        continue; //pass border points!
      u[i]  = 0.25 * (hsq + u[i-M] + u[i-1] + u[i+1] + u[i+M]);
    }

    if (0 == (iter % 10)) {
      res = compute_residual(u, M, hsq);
      printf("Iter %d Residual %g\n", iter, res);
    }
  }

  /* Clean up */
  free(u);

  /* timing */
  get_timestamp(&time2);
  double elapsed = timestamp_diff_in_seconds(time1,time2);
  printf("Time elapsed is %f seconds.\n", elapsed);
  return 0;
}
