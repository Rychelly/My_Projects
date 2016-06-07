#coding: utf-8

import socket

host = '127.0.0.1'
port = 3998

tcp_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

destino = (host, port)

tcp_client.connect(destino)

online = True

while online:
    
    mensagem_env = 'options' 
    
    tcp_client.send(mensagem_env)
    
    mensagem_rec = tcp_client.recv(100*1024)
    
    print mensagem_rec
    
    mensagem_sinal = str(raw_input()) #Digite o sinal da operação
    
    print mensagem_sinal
    
    tcp_client.send(mensagem_sinal)
    
    mensagem_recA = tcp_client.recv(100*1024)
    
    print "1"
    
    print mensagem_recA
    
    mensagem_envA = input() #Digite o valor de A
    
    tcp_client.send(mensagem_envA)
    
    mensagem_recB = tcp_client.recv(100*1024)
    
    print mensagem_recB
    
    mensagem_envB = input() #Digite o valor de B
    
    tcp_client.send(mensagem_envB)
    
    mensagem_result = tcp_client.recv(100*1024)
    
    print mensagem_result
