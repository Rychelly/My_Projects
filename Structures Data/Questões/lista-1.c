#include <stdio.h>
#include <string.h>

void imprimeVetor(char *vetor);
void inverteVetor(char *vetor, char *vetorinvertido);
char *imprimeCivil(int c);
void contaVogais(char *frase);

int main () {

	char v[20]="anderson";
	char v2[20];

    imprimeVetor(v);
    inverteVetor(v, v2);
    printf("\n%s - %s - %s", v, v2, imprimeCivil(1) );
    contaVogais("agua de coco");

}

void imprimeVetor(char *vetor) {
    int i=0;

    /*for (i=0; *( vetor + i ) != NULL; i++) {
      printf("\n%c", *( vetor + i ) );
    }*/

    while (*vetor)
       printf("\n%c", *vetor++ );

}

char *imprimeCivil(int c) {

     if (c == 1)
       return ("solteiro");
     if (c == 2)
       return ("casado");

     // completar
}

void inverteVetor(char *vetor, char *vetorinvertido) {
    int i, j=0, tam = strlen(vetor);

    for (i=tam;i>0;i--) {
        *(vetorinvertido+j) = *(vetor+(i-1));
        j++;
    }
    *(vetorinvertido+j)='\0';
}

void contaVogais(char *frase) {
    int i, tam = strlen(frase);
    int cont=0;

    printf("\n\na:");
    for (i=0;i<tam;i++) {
        if (frase[i]=='a') {
          cont++;
          printf("*");
        }
    }
    printf("(%d)", cont);

    cont=0;
    printf("\ne:");
    for (i=0;i<tam;i++) {
        if (frase[i]=='e') {
          cont++;
          printf("*");
        }
    }
    printf("(%d)", cont);

    // completar
}
