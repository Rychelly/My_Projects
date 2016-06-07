#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#define iteracaoConsumidor 10
#define iterecaoProdutor 10

int buffer=0;
pthread_mutex_t mutex;

void delay(int secs) {
  time_t beg = time(NULL), end = beg + secs;
  do {
    ;
  } while (time(NULL) < end);
}


void *produtor(){

   int i=0,controle=0;
   while(controle<iterecaoProdutor){

     pthread_mutex_lock(&mutex);

     if(buffer){
       printf("Buffer cheio, produtor não pode inserir... Esperando consumidor.\n");
       delay(1);
     }
     else{

       i=rand()%20+1;
       printf("Buffer = %d... Produtor produziu %d.\n",buffer,i);
       buffer=i;
       delay(1);

     }

    ++controle;
    pthread_mutex_unlock(&mutex);
    delay(2);/*Delay Principal*/
   }

}

void *consumidor(){


   int controle=0;
   while(controle<iteracaoConsumidor){

    pthread_mutex_lock(&mutex);

     if(buffer){
       printf("Buffer = %d... Consumidor consumiu  %d.\n",buffer,buffer);
       buffer=0;
       delay(1);
     }
     else{
      printf("Buffer vazio, consumidor não pode consumir... Esperando produtor. \n");
      delay(1);
     }
    ++controle;
    pthread_mutex_unlock(&mutex);
    delay(3); /*Delay Principal*/
   }

}

main() {
  int status=0;
  pthread_attr_t attr;
  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_JOINABLE);
  pthread_t ThreadProdutor, ThreadConsumidor;
  pthread_mutex_init(&mutex, NULL);


  srand(time(NULL));

  pthread_create(&ThreadProdutor,&attr, produtor, NULL);
  pthread_create(&ThreadConsumidor,&attr, consumidor, NULL);


  pthread_join(ThreadProdutor, (void **)&status);
  pthread_join(ThreadConsumidor, (void **)&status);

  pthread_exit(NULL);


}
