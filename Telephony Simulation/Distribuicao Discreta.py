#Implementacao - Aleatoria Discreta

from random import *
from math import *
from pylab import *

a = 1
b = 10
x = []

print("Simulacao de Distribuicao Aleatoria Discreta")
n = input("Digite a quantidade de amostras para esta simulacao: ")

for i in range(n):
    
    u = random()
    x.append(a+int((b-a+1)*u))

print(x), "\n"

hist(x,bins=500)

show()


