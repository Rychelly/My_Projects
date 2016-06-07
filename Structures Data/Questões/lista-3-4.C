#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>

#define M 3
#define N 4

double **criaMatriz(int m, int n);
void liberaMatriz(double **ma);
void geraV(int *vt, int tam);

int main(void) {

	double **a, **b;
	int i, j, z=3;
	int *v;
    srand(time(0));

	/* questao 1 da lista de alocacao */
	v = (int *) malloc(z*sizeof(int));

	geraV(v, z);

    for (i=0;i<z;i++)
       printf(" %d ", v[i]);

    printf("\n\n");
    free(v);
    // final da questao 01

	a = criaMatriz(M, N);
	b = criaMatriz(M, N);

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
	liberaMatriz(a);
	liberaMatriz(b);

	printf("\nOperacao concluida!");
	getch();

	return 0;
}

void geraV(int *vt, int tam){

    int i;

    for (i=0;i<tam;i++)
       *(vt+i)=rand()%10;

}

double **criaMatriz(int m, int n){
    double **ma;
    int i;

	if ( (ma = (double **) malloc(m*sizeof(double))) == NULL) {
		printf("\nErro na alocacao dinamica!");
		exit(1);
	}

	for (i=0;i<m;i++) {
	   ma[i] = (double *) malloc(n*sizeof(double));
	}

	return ma;
}

void liberaMatriz(double **ma) {
    int i;

	for (i=0; i<M; i++) {
		free(ma[i]);
	}
	free(ma);
}
