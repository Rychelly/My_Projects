/*
 ============================================================================
 Name        : ProjectSwitch_StructureDates.c
 Author      : Rychelly Glenneson da Silva Ramos
 Version     : 1.0
 Copyright   : Projeto desenvolvido para a disciplina de Estrutura de Dados
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>


typedef struct MODELO_PACOTE{

int enderecoIP;
char protocolo[5];
struct MODELO_PACOTE *prox;

}PACOTE;


PACOTE *criaPacote(int tipoPacote);
PACOTE *escalonador(PACOTE *portaEntrada);
PACOTE *inserePacoteLista(PACOTE *portaEntrada,PACOTE *pacote);


//---------------------//main-----------------------------//

int main(){
int i=0,contador=0;
PACOTE *PE,*aux;
PACOTE *saida;
srand(time(NULL));

saida=NULL;

PE=NULL;

while(contador<4){

i=rand()%3;

PE=inserePacoteLista(PE,criaPacote(i));

//saida=escalonador(PE[0]);

//printf("\n%d\n",PE->enderecoIP);
//puts(PE->protocolo);

contador++;

}


aux=PE;

printf("conferindo se ouve insercao dos pacotes na lista de Entrada\n");

while(aux!=NULL){

printf("\n%d\n",aux->enderecoIP);
puts(aux->protocolo);
aux=aux->prox;
}
printf("\n\\-----------------------------------------------\\");


printf("\n\n");

printf("pacote processado e recebido na saida \n");

saida=escalonador(PE);
printf("saida\n");
printf("%d\n",saida->enderecoIP);
puts(saida->protocolo);

printf("\n\\-----------------------------------------------\\\n");


printf("Lista de Entrada depois da remoção do pacote \n");
aux=PE;

while(aux!=NULL){

printf("\n%d\n",aux->enderecoIP);
puts(aux->protocolo);
aux=aux->prox;
}

printf("\n\\-----------------------------------------------\\");
getchar();

 return 0;




}


//----------------------main------------------------//




PACOTE *criaPacote(int tipoPacote){


PACOTE *pacote=(PACOTE*)malloc(sizeof(PACOTE));




 switch(tipoPacote){

   case 0:
    pacote->enderecoIP=0;
    strcpy(pacote->protocolo,"VOIP");
    pacote->prox=NULL;
    break;

   case 1:
    pacote->enderecoIP=1;
    strcpy(pacote->protocolo,"HTTP");
    pacote->prox=NULL;
    break;


   case 2:
    pacote->enderecoIP=2;
    strcpy(pacote->protocolo,"SMTP");
    pacote->prox=NULL;
    break;

}


return pacote;


}


PACOTE *escalonador(PACOTE *portaEntrada){

 PACOTE *aux2;
 PACOTE *aux;
 char flag='s';

 aux2=portaEntrada;
 aux=portaEntrada;


  while(aux!=NULL && flag=='s'){

     if(strcmp(aux->protocolo,"VOIP")==0){

        aux2->prox=aux->prox;

        flag='n';
        return aux;


     }

     else{
        aux2=aux;
        aux=aux->prox;
     }

  }

 aux2=portaEntrada;
 aux=portaEntrada;

  while(aux!=NULL && flag=='s'){

     if(strcmp(aux->protocolo,"HTTP")==0){

        aux2->prox=aux->prox;

        flag='n';
        return aux;
     }

     else{
       aux2=aux;
       aux=aux->prox;
     }

  }

  aux2=portaEntrada;
  aux=portaEntrada;


    while(aux!=NULL && flag=='s'){

     if(strcmp(aux->protocolo,"SMTP")==0){

        aux2->prox=aux->prox;
        flag='n';
        return aux;

     }

     else{
       aux2=aux;
       aux=aux->prox;
     }

  }

return 0;

}//end of function

PACOTE *inserePacoteLista(PACOTE *portaEntrada,PACOTE *pacote){

PACOTE *aux;

 if(portaEntrada==NULL){
  aux->prox=pacote;
  pacote->prox=NULL;

  return aux;
 }

aux=portaEntrada;

while(aux->prox!=NULL)
 aux=aux->prox;

aux->prox=pacote;
pacote->prox=NULL;

return portaEntrada;


}
