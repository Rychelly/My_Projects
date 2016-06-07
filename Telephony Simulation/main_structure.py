#Instituto Federal de Educacao, Ciencia e Tecnologia da Paraiba
#Campus Campina Grande
#Curso Superior de Tecnologia em Telematica
#Disciplina: Probabilidade e Introducao a Processos Estocasticos
#Professor: Paulo Ribeiro Lins Junior
#Alunos: Rychelly Glenneson da Silva Ramos / Gustavo Ramos da Silva

#Probabilidade de Bloqueios em uma Rede Telefonica com Comutacao de Circuitos

from pylab import *
from math import *
from RandomVariable import *
from random import *

def main():
	
	#Variaveis:
	n = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
	carga = []
	probabilidade_bloqueio = [0,0,0,0,0,0,0,0,0,0]
	pb = 0
	quant = 0
	contador = 0
	bloqueio = 0.0
	duracao_chamada = 0 
	tempo_entre_chamadas = 0
	matriz_ocupacao = [[0,0,0],[0,0,0],[0,0,0]]
	num_max_chamadas = input("Digite o numero maximo de chamadas: ")
	
	#Inicio da Simulacao:
	for i in range(10):
		
		bloqueio = 0.0
		while(contador < num_max_chamadas):
			
			if(tempo_entre_chamadas == 0):
				
				#Selecionando no Origem:
				o = discreta(1,5,1)
				origem = o[0]
				
				#Selecionando no Destino:
				d = discreta(6,10,1)
				destino = d[0]
				
				#Selecionando Tempo de Duracao de Chamada:
				while(duracao_chamada <= 0):
					tdc = exponencial(1,n[i])
					duracao_chamada = int(tdc[0])
				
				#Selecionando o Tempo Entre Chamadas
				while(tempo_entre_chamadas <= 0):
					tec = poisson(1,0.5)
					tempo_entre_chamadas = tec[0]
				
				#Atribuindo Valores a Matriz de Ocupacao
				for j in range(3):
					
					if(matriz_ocupacao[j][-1] == 0):
						matriz_ocupacao[j][0] = origem
						matriz_ocupacao[j][1] = destino
						matriz_ocupacao[j][2] = duracao_chamada
						break
					else:
						quant += 1
					
				if(quant == 3):
					bloqueio += 1
				quant = 0
			contador += 1
			
			
			#Decrementando Tempo de Duracao de Chamadas
			print('Matriz: ',matriz_ocupacao)			
			for k in range(3):
				
				if(matriz_ocupacao[k][-1] != 0):
					matriz_ocupacao[k][-1] -= 1
				else:
					matriz_ocupacao[k] = [0,0,0]
			
			#Decrementando Tempo Entre Chamadas	
			tempo_entre_chamadas -= 1
		
			print('******')
			
		#Calculando e Armazenando a probabilidade de bloqueio	
			pb = ((bloqueio/num_max_chamadas)*100)
			probabilidade_bloqueio[i] = pb
		pb = 0
		contador = 0
		
		
	for X in range(10):
		carga.append(n[X]*10)
		
	print('Probabilidade de Bloqueio: ',probabilidade_bloqueio)	
	
	plot(carga,probabilidade_bloqueio)
	
	xlabel('Carga Oferecida (Erlang)')
	
	ylabel('Probabilidade de Bloqueio (%)')
	
	title('Rede Telefonica por Comutacao')
	
	grid()
	
	show()
	
main()










