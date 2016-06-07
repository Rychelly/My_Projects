# Implementacao da Distribuicao de Poisson

from random import *
from math import *
from pylab import *

print("Simulacao da Distribuicao de Poisson")
n = input("Digite a quantidade de amostras para esta simulacao: ")
media = input("Digite a media: ")

x = []

for i in range (n):
	u = random()
	j = 0
	p = e**(-media)
	f = p
	
	if (u <=f):
		x.append(j)
	else:
		while (u > f):
			p = (media*p)/(j+1)
			j = (j+1)
			f = (f+p)
			
			if(u <= f):
				x.append(j)

		
print(x)

hist(x,bins=500)

show()
	
	
	
