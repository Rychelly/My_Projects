#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>

int buffer=0;

void delay(int secs) {
  time_t beg = time(NULL), end = beg + secs;
  do {
    ;
  } while (time(NULL) < end);
}


void *produtor(){

   int i=0;
   while(1){

    i=rand()%20;
    printf("Buffer = %d... Produtor produziu %d.\n",buffer,i);
    buffer=i;
    delay(1);

   }
}

void *consumidor(){

   while(1){

    printf("Buffer = %d... Consumidor consumiu  %d.\n",buffer,buffer);
    delay(1);

   }
}

main() {
  pthread_attr_t *attr = NULL;
  pthread_t ThreadProdutor, ThreadConsumidor;


  srand(time(NULL));

  pthread_create(&ThreadProdutor, attr, produtor, NULL);
  pthread_create(&ThreadConsumidor, attr, consumidor, NULL);
  while (1) /* loop infinito */
   { ;}


}
