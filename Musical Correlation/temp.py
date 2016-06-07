from wavfile import *
from scipy.signal import *
from scipy.stats import *
from matplotlib.pyplot import *
import matplotlib.pyplot as plt
from numpy import *
from pandas.stats import *
from pandas import *
from pylab import * #plot, show, title, xlabel, ylabel, subplot, savefig
from scipy import fft, arange, ifft
from numpy import sin, linspace, pi
#from scipy.io.wavfile import read,write

def plotSpectru(y,Fs):
 n = len(y) # lungime semnal
 k = arange(n)
 T = n/Fs
 frq = k/T # two sides frequency range
 frq = frq[range(n/2)] # one side frequency range

 Y = fft(y)/n # fft computing and normalization
 Y = Y[range(n/2)]
 
 plot(frq,abs(Y),'r') # plotting the spectrum
 xlabel('Freq (Hz)')
 ylabel('|Y(freq)|')

Fs = 44100;  # sampling rate

rate,data=read('perdoa.wav')
y=data[:,1]
lungime=len(y)
timp=len(y)/44100.
t=linspace(0,timp,len(y))

print '-----------------------------------------'

rate1,data1=read('04-MASTRUZ.wav')
x=data1[:,1]
lungime=len(x)
timp=len(x)/44100.
t1=linspace(0,timp,len(x))

print 'TODOS OS DADOS ANTES Y', len (y)
print 'TODOS OS DADOS ANTES X', len (x)

if (len(x)>len(y)):
	b = len(y) 
	print 'b recebeu quantidade de dados de y'
	a = x
	print 'a recebeu a lista completa de x'
else: 
	b = len(x)
	print 'b recebeu quantidade de dados de x'
	a = y
	print 'a recebeu a lista completa de y'
	
print 'TODOS OS DADOS DE A',len (a)		
print 'QUANTIDADE DE DADOS RECEBIDOS POR B',b
g=[]
j=0
c=[]
for j in a[0:b]:
	g.append(j)


if (len(x)>len(y)):
	c = y
	print 'c recebeu y\n'
else:
	c = x
	print 'c recebeu x\n'		
print pearsonr (c,g)
#matplotlib.pyplot.scatter(c,g, s=20, c='b', marker='o', cmap=None, norm=None, vmin=None, vmax=None, alpha=None,linewidths=None, verts=None, hold=None)
#plt.show()
print 'TODOS OS DADOS DEPOIS Y', len (y)
print 'TODOS OS DADOS DEPOIS C', len (c)
print 'TODOS OS DADOS DEPOIS X', len (x)
print 'TODOS OS DADOS DEPOIS G', len (g)

print amin (y),'MINIMO de y'
print amax (y),'MAXIMO de y'

print amin (g),'MINIMO de g'
print amax (g),'MAXIMO de g'

print amin (c),'MINIMO de c'
print amax (c),'MAXIMO de c'

xlabel('Time')
ylabel('Amplitude')

subplot(4,1,1)
plotSpectru(c,Fs)
subplot(4,1,2)
plotSpectru(g,Fs)
subplot(4,1,3)
plotSpectru(x,Fs)
subplot(4,1,4)
plotSpectru(y,Fs)
show()
show()
show()
show()
