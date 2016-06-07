from scipy import *
from scipy.stats.mstats import *
from scipy.stats import*
from math import *
from pandas import *
from matplotlib.pyplot import *
import matplotlib.pyplot as plt
from numpy import *
from pylab import *
import csv


f = csv.reader(open('arquivo_gripe.csv'), delimiter=',')

estados = {"Brasil":[],
           "Santa Catarina":[],
           "Sao Paulo":[], 
           "Rio de Janeiro":[],
           "Rio Grande do Sul":[]}
          
for row in f:     
    estados["Brasil"].append(int (row[1])) 
    estados["Santa Catarina"].append(int (row[8])) 
    estados["Sao Paulo"].append(int (row[9])) 
    estados["Rio de Janeiro"].append(int (row[6])) 
    estados["Rio Grande do Sul"].append(int (row[7])) 
    


for j in estados.keys():
    print '=================\033[34m'+j+'\033[0;0m===================='
    n=len(estados[j])
    print 'Quantidade de amostras avaliadas ->',n
    print "Menor valor ->", min(estados[j]), "\nMaior valor ->", max(estados[j])
    print 'Aplitude ->', (max(estados[j])-min(estados[j]))
    print 'Media ->', mean (estados[j])
    print 'Mediana ->', median(estados[j])
    print 'Moda ->', mode(estados[j])
    print 'Variancia ->', var(estados[j])
    print 'Desvio Padrao ->', std (estados[j])
    print 'Coeficiente de variacao ->', std(estados[j])/mean(estados[j])
    print 'Erro padrao ->', std(estados[j])/math.sqrt(n)
    print sum(estados[j])
    soma_df = 0.0
    for i in estados[j]:
        t = i-mean(estados[j])
        soma_df = math.fabs(t)+soma_df
    print 'Desvio medio ->', soma_df/n	
    cas=(3*(mean(estados[j])-median(estados[j])))/std(estados[j])
    print 'Assimetria ->', cas
    if cas > 0 and cas < 1:
        print 'Assimetria moderada'
    elif cas == 0:
        print 'Perfeita simetria'
    else :
        print 'Assimetria forte'	
    print 'Curtose ->', kurtosis(estados[j])
    print 'Quartis 2,3 e 4 ->', percentile(estados[j],[25,50,75])	
    print "Percentis: 10,20,30,40...90 ->", percentile(estados[j],[10,20,30,40,50,60,70,80,90])
    print '********************************************\n'
print 'Correlacao\n'
for k in estados.keys():
    if k is not "Brasil":
        print corrcoef(estados[k],estados["Brasil"]),k,'X BR'       
 
for i in estados.keys():
    matplotlib.pyplot.hist(estados[i], bins=10, range=None, normed=False, weights=None, cumulative=False, bottom=None,histtype='bar', align='mid', orientation='vertical', rwidth=None, log=False, color='green', label='')
    plt.xlabel(u'Dados da Coleta')
    plt.ylabel(u'Frequencia Absoluta')
    plt.title(i)
    plt.show()
    
for i in estados.keys():
    matplotlib.pyplot.boxplot(estados[i], notch=False, sym='b+', vert=True, whis=1.5, positions=None, widths=None,patch_artist=False, bootstrap=None, hold=None)
    plt.ylabel(u'Dados da Coleta')
    plt.title(i)
    show()
for i in estados.keys():
    if i is not "Brasil":
        matplotlib.pyplot.scatter(estados[i], estados["Brasil"], s=20, c='b', marker='o', cmap=None, norm=None, vmin=None, vmax=None, alpha=None,linewidths=None, verts=None, hold=None)
        plt.xlabel(i)
        plt.ylabel(u'Brasil')
        plt.title("Diagrama de dispersao - Estado x Pais")
        plt.show()
