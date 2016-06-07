#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Conta{
    char nome[40];
    int numCC;
    int senha;
};

int ultCC = 0;
void fillConta(Conta *c1);
Conta fillConta2();
void mostraConta(Conta c1);
int validaSenha(Conta c1, char ch1[], int s1);

int main(void){
    Conta v1[5];
    char nome[40];
    int s, result, i;

    //fillConta(&v1[0]);
    //v1[1] = fillConta2();

    for (i=0;i<3;i++)
       fillConta(&v1[i]);

    for (i=0;i<3;i++)
       mostraConta(v1[i]);

    printf("\nDigite um nome de usuario: ");
    gets(nome);
    printf("\nDigite sua senha: ");
    scanf("%d%*c", &s);

    result = 0;
    for (i=0;i<3;i++) {
       if (validaSenha(v1[i], nome, s) == 3) {
          printf("Bem vindo usuario %s!", nome);
          result = 0;
          break;
       } else
          if (validaSenha(v1[i], nome, s) == 2) {
          printf("Usuario %s: Senha nao confere!");
          result = 0;
          break;
          }
       result = 1;
    }

    if (result == 1)
       printf("Usuario Inexistente!!");

	return 1;
}

void fillConta(Conta *c1){
   printf("\nDigite o nome do cliente: ");
   gets(c1->nome);
   printf("Digite sua senha: ");
   scanf("%d%*c", &c1->senha);
   c1->numCC = ++ultCC;
}

Conta fillConta2(){
   Conta c1;

   printf("Digite o nome do cliente: ");
   gets(c1.nome);
   printf("\nDigite sua senha: ");
   scanf("%d%*c", &c1.senha);
   c1.numCC = ++ultCC;

   return c1;
}

void mostraConta(Conta c1){
   printf("\nNome do cliente: %s", c1.nome);
   printf("\nNumero da conta: %d", c1.numCC);
   printf("\nSenha do cliente: %d\n\n", c1.senha);
}

int validaSenha(Conta c1, char ch1[40], int s1) {
    if (strcmp(c1.nome, ch1)==0) {
       if (c1.senha==s1)
          return 3;
       else return 2;
    }

    return 1;
}

