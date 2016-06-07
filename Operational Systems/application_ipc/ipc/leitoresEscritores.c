#include<stdio.h>
#include<pthread.h>
#include<time.h>
#include<stdlib.h>
#define maxReaders 10//definindo quantidade de leitores
#define maxWriters 10 //definindo quantidades de escritores
#define maxIteracoes 4//definindo a quantidade de leitura ou escrita de cada thread no buffer




int buffer=0;//memória compartilhada
pthread_mutex_t mutex; // variavel mutex


//................função delay..................//

void delay(int secs) {

  time_t beg = time(NULL), end = beg + secs;

  do {


  } while (time(NULL) < end);
}

//..............................................//



//...................................função leitura.........................................//

void *read(void *i){


   long identify=(long)i;
   int flag;

   for(flag=0;flag<maxIteracoes;flag++){
        pthread_mutex_lock(&mutex);
        delay(rand()%2);
        printf("l %ld %d\n",identify,buffer);
        delay(rand()%2);
        pthread_mutex_unlock(&mutex);
        delay(rand()%4);//para dar tempo de outro thread pegar o controle e não entrar no laço for de novo rapidamente
    }




}

//..........................................................................................//



//................................................função escrita...........................................//

void *write(void *i){


   long identify=(long)i;
   int flag;


   for(flag=0;flag<maxIteracoes;flag++){

        pthread_mutex_lock(&mutex);
        delay(rand()%2);
        printf("%ld quer escrever...\n", identify);
        delay(rand()%2);
        buffer=random()%20;
        delay(rand()%2);
        printf("e %ld %d\n",identify,buffer);
        delay(rand()%2);
        pthread_mutex_unlock(&mutex);
        delay(rand()%4);//para dar tempo de outro thread pegar o controle e não entrar no laço for de novo rapidamente
    }


}

//........................................................................................................//




int main(){

  int status=0;
  long laco;
  pthread_attr_t attr;
  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr,PTHREAD_CREATE_JOINABLE);
  pthread_mutex_init(&mutex, NULL);
  pthread_t threadWriter[maxWriters],threadReader[maxReaders];//criação das variáveis leitoras e escritoras



   for(laco=0;laco<maxWriters;laco++){

       pthread_create(&threadWriter[laco],&attr,write,(void *)laco);//criação dos threads escritores
       pthread_create(&threadReader[laco],&attr,read,(void *)laco);

   }








   for(laco=0;laco<maxReaders;laco++){

      pthread_join(threadReader[laco], (void **)&status);//join os threads
      pthread_join(threadWriter[laco], (void **)&status);

   }



  pthread_exit(NULL);


}
