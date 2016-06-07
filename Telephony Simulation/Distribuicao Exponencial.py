from random import *
from math import *
from pylab import *

print("Simulacao de Distribuicao Exponencial")
n = input("Digite a quantidade de amostras para esta simulacao: ")
media = input("Digite a media para a simulacao: ")
y = []

for i in range(n):
    
    u = random()
    y.append((-1/media)*log(u))

print(y)

hist(y,bins=500)

show()
