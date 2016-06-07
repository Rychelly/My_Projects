/*
 ============================================================================
 Name        : Ordination_Algoritms.c
 Author      : Rychelly Glenneson da Silva Ramos
 Version     :
 Copyright   : Exercise of Curricular Component - Structure Dates
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void bubleSort(int *vet1, int max);
void selectionSort(int *vet1, int max);
void trocarPosicaoValores( int *posicaoA, int *posicaoB );
void insertionSort(int vetorDesordenado[], int tamanhoVetor );
void shell_sort(int *a, int size);

int main() {

	int i;
	int vet1[13] = {3,5,10,12,15,1,0,4,20,7,9,2,6};

	for(i=0;i<13;i++){
		printf("%d\t",vet1[i]);
	}

	printf("\n");

	selectionSort(vet1,13);

	for(i=0;i<13;i++){
		printf("%d\t",vet1[i]);
	}

	return EXIT_SUCCESS;
}


void bubleSort( int vetorDesordenado[], int tamanhoVetor )
{
   int i, j;   
   for( i = 0; i < ( tamanhoVetor -1 );  i++ )
   {
      for( j=0; j <( tamanhoVetor -( i +1 ) ); j++ )  
      {
         if( vetorDesordenado[j] > vetorDesordenado[j+1] )  
         {          
            trocarPosicaoValores( &vetorDesordenado[j], &vetorDesordenado[j+1] ); 
         }
      } 
   }
}

void trocarPosicaoValores( int *posicaoA, int *posicaoB )
{
   int temporario;
   temporario = *posicaoA;
   *posicaoA = *posicaoB;
   *posicaoB = temporario;     
}


void selectionSort( int vetorDesordenado[], int tamanhoVetor )
{
   int i, j, posicaoValorMinimo;

   for (i = 0; i < ( tamanhoVetor - 1 ); i++) 
   {
      posicaoValorMinimo = i;
      for (j = ( i + 1 ); j < tamanhoVetor; j++) 
      {
         if( vetorDesordenado[j] < vetorDesordenado[posicaoValorMinimo] ) 
         {
           posicaoValorMinimo = j;
         }
       }
       
       if ( i != posicaoValorMinimo ) 
       {
          trocarPosicaoValores( &vetorDesordenado[i], &vetorDesordenado[posicaoValorMinimo] );  
       }
   }
}


void insertionSort(int vetorDesordenado[], int tamanhoVetor )
{
   int i, j, valorAtual;
 
   for( j=1; j < tamanhoVetor; j++ ) 
   {
      valorAtual = vetorDesordenado[j];
      i = j-1;
      
      while(i >= 0 && vetorDesordenado[i] > valorAtual)
      {
        vetorDesordenado[i+1] = vetorDesordenado[i];
        i--;
      } 
              
      vetorDesordenado[i+1] = valorAtual;
   }
}

void shell_sort(int *a, int size)
{
 int i , j , value;
 int gap = 1;
 
 do {
  gap = 3*gap+1;
 } while(gap < size);
 
 do {
  gap /= 3;
  for(i = gap; i < size; i++) {
   value = a[i];
   j = i - gap;
   
   while (j >= 0 && value < a[j]) {
    a[j + gap] = a[j];
    j -= gap;
   }
   a[j + gap] = value;
  }
 }while(gap > 1);
}
