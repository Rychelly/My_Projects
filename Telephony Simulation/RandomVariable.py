 #Implementacao de Variaveis Aleatorias:

#Discreta, Exponencial, Gaussiana(Normal) e Poisson.

#Bibliotecas-----------------------------------------------------------#
from random import *
from math import *
from pylab import *
#----------------------------------------------------------------------#


#Aleatoria_Discreta----------------------------------------------------#
def discreta(a,b,n):
	
	x=[]
	for i in range(n):
		u = random()
		x.append(a+int((b-a+1)*u))
		
	return x
#----------------------------------------------------------------------#


#Aleatoria_Exponencial-------------------------------------------------#
def exponencial(n,media):
	
	y=[]
	for i in range(n):
		u = random()
		y.append((-1/media)*log(u))
	
	return y
#----------------------------------------------------------------------#

#Aleatoria_Gaussiana(Normal)-------------------------------------------#	
def gaussiana(n,media):
	
	w=[]
	for i in range(n):
		u = 0
		for j in range(12):
			u = u + random()
		z = u - 6
		w.append(media+z)
	
	return w
#----------------------------------------------------------------------#


#Aleatoria_Poisson-----------------------------------------------------#	
def poisson(n,media):
	
	k=[]
	for i in range(n):
		u = random()
		j = 0
		p = e**(-media)
		f = p
	
		if (u <=f):
			k.append(j)
		else:
			while (u > f):
				p = (media*p)/(j+1)
				j = (j+1)
				f = (f+p)
			
				if(u <= f):
					k.append(j)
	return k
		
#----------------------------------------------------------------------#
