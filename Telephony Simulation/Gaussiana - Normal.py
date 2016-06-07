#Implementacao - Geracao de VA Gaussiana (Normal)

from random import *
from math import *
from pylab import *

print("Geracao de Variavel Aleatoria Gaussiana - Normal")
n = input("Digite a quantidade de variaveis a ser gerada: ")
media = input("Digite a media: ")


x = []

for i in range(n):
    u = 0
    
    for j in range(12):
        u = u + random()

    z = u-6
    x.append(media + z)

print(x)

hist(x,bins=500)

show()
