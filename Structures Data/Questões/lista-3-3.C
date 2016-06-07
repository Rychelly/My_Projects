#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>

#define M 3
#define N 4


int main(void) {

	double **a, **b;
	int i, j;
	double *v;

	srand(time(0));


    //alocando as linhas da matriz
	if ( (a = (double **) malloc(M*sizeof(double))) == NULL) {
		printf("\nErro na alocacao dinamica!");
		exit(1);
	}
    //alocando as linhas da matriz
	if ( (b = (double **) malloc(M*sizeof(double))) == NULL) {
		printf("\nErro na alocacao dinamica!");
		exit(1);
	}

    //alocando as colunas da matriz
	for (j=0;j<M;j++) {
	   a[j] = (double *) malloc(N*sizeof(double));
	   b[j] = (double *) malloc(N*sizeof(double));
	}


	for (i=0;i<M;i++) {
	  for (j=0;j<N;j++) {
	     a[i][j] = (double)(rand()%15)/2;
	     printf(" %.2lf ", a[i][j]);
	  }
	  printf("\n");
	}

	printf("\n\n");

	for (i=0;i<M;i++) {
	  for (j=0;j<N;j++) {
	     b[i][j] = (double)(rand()%15)/2;
	     printf(" %.2lf ", b[i][j]);
	  }
	  printf("\n");
	}
	printf("\n\n");

	for (i=0;i<M;i++) {
	  for (j=0;j<N;j++) {
	     printf(" %.2lf ", a[i][j]+b[i][j]);
	  }
	  printf("\n");
	}
	printf("\n\n");


    printf("\n\nPressione qualquer tecla para liberar o espaco alocado...");
	getch();
	for (i=0; i<M; i++) {
		free(a[i]);
		free(b[i]);
	}
	free(a);
	free(b);
	printf("\nOperacao concluida!");
	getch();

	return 0;
}
