#include <stdio.h>
#include <string.h>
#include <locale.h>
#include <stdlib.h>

int main(){

	int i, QD, CHD, CHT;

	float ND, soma=0;
	
	printf("Digite a quantidade de disciplinas cursadas: ");
	scanf("%d",&QD);
	
	system("clear");
	
	for(i=0;i<QD;i++){
		
		printf("Digite a nota da disciplina %d: ", i+1);
		scanf("%f",&ND);
		printf("Digite a carga horaria da disciplina %d: ",i+1);
		scanf("%d",&CHD);
		printf("\n");
		
		soma = soma + (ND*CHD);
		
		CHT = CHT + CHD;
		
		
	}

	system("clear");

	printf("CRE = %f", soma/CHT);
	
	
	return 0;

}
