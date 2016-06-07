#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>

#define numMulher 5
#define numHomens 5

sem_t homem, mulher, banheiro;

int homensUsando = 0;
int mulheresUsando = 0;

void entraMulher();
void saiMulher();
void entraHomem();
void saiHomem();
void *gerencia_mulher(void *arg);
void *gerencia_homem(void *arg);

void main() {
    srand(time(NULL));

    pthread_t mulher_thread[numMulher], homem_thread[numHomens];
    void *thread_result;
    int i;

    sem_init(&homem, 0, 1);
    sem_init(&mulher, 0, 1);
    sem_init(&banheiro, 0, 1);

    for (i = 0; i < numMulher; i ++) {
        pthread_create(&mulher_thread[i],NULL,gerencia_mulher, NULL);
    }
    for (i = 0; i < numHomens; i ++) {
        pthread_create(&homem_thread[i],NULL,gerencia_homem, NULL);
    }

    for (i = 0; i < numMulher; i++) {
        pthread_join(mulher_thread[i],&thread_result);
    }
    for (i = 0; i < numHomens; i++) {
        pthread_join(homem_thread[i],&thread_result);
    }
}

void entraMulher(){
	
    printf("Uma mulher quer entrar no banheiro...\n");
    sem_wait(&mulher);
    mulheresUsando++;

    if (mulheresUsando == 1)
        sem_wait(&banheiro);
	
	if (mulheresUsando>1){
		printf("A mulher entrou no banheiro... Têm %d mulheres no banheiro.\n", mulheresUsando);
	}else{
		printf("A mulher entrou no banheiro... Têm %d mulher no banheiro.\n", mulheresUsando);
	}
    
    sem_post(&mulher);

}

void saiMulher(){

    printf("Uma mulher quer sair do banheiro...\n");
    sem_wait(&mulher);
    mulheresUsando--;

    if (mulheresUsando == 0){
        sem_post(&banheiro);
        printf("A mulher saiu do banheiro... O banheiro está vazio.\n");
    }
    else{
		
		if (mulheresUsando>1){
			printf("A mulher saiu do banheiro... Têm %d mulheres no banheiro.\n", mulheresUsando);
		}else{
			printf("A mulher saiu do banheiro... Têm %d mulher no banheiro.\n", mulheresUsando);
		}
    }
	
    sem_post(&mulher);

}

void entraHomem(){

    printf("Uma homem quer entrar no banheiro...\n");
    sem_wait(&homem);
    homensUsando++;

    if (homensUsando == 1)
        sem_wait(&banheiro);
        
	if (homensUsando>1){
		printf("O homem entrou no banheiro... Têm %d homens no banheiro.\n", homensUsando);
	}else{
		printf("O homem entrou no banheiro... Têm %d homem no banheiro.\n", homensUsando);
	}

    sem_post(&homem);

}

void saiHomem(){
	
    printf("Um homem quer sair do banheiro...\n");
    sem_wait(&homem);
    homensUsando--;
    
    if (homensUsando == 0){
        sem_post(&banheiro);
        printf("O homem saiu do banheiro... O banheiro está vazio.\n");
    }
    else{
		if (homensUsando>1){
			printf("O homem saiu do banheiro... Têm %d homens no banheiro.\n", homensUsando);
		}else{
			printf("O homem saiu do banheiro... Têm %d homem no banheiro.\n", homensUsando);
		}
    }

    sem_post(&homem);

}

void *gerencia_mulher(void *arg){
    sleep(rand()%5);

    entraMulher();
    sleep(rand()%5);
    saiMulher();

    pthread_exit(NULL);
}

void *gerencia_homem(void *arg){
    sleep(rand()%5);

    entraHomem();
    sleep(rand()%5);
    saiHomem();

    pthread_exit(NULL);
}
