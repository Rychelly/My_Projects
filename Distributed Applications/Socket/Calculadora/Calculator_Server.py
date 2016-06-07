#coding: utf-8

import socket

host = ''
port = 3998

tcp_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

origem = (host, port)

tcp_server.bind(origem)

tcp_server.listen(1)

def add(a, b):
    return a+b

def sub(a, b):
    return a-b

def mult(a, b):
    return a*b

def div(a, b):
    return a/b
    
online = True

while online:
    
    connecting, client = tcp_server.accept()
    print "Conectado com ", client
    
    mensagem_rec = connecting.recv(100*1024)
    
    if mensagem_rec == "options":
        
        mensagem_env = "1 - Adição;\n2 - Subtração;\n3 - Multiplicação;\n4 - Divisão;\n5 - Sair.\nDigite a opção desejada (O nome da operação, sem acentos. Ex: adicao): "
        
        connecting.send(mensagem_env)
        
        continue
		
    elif mensagem_rec == "adicao":
        
        valor_env1 = "Digite o valor de A: "
        connecting.send(valor_env1)
        valor_rec1 = connecting.recv(100*1024)
        
        valor_env2 = "Digite o valor de B: "
        connecting.send(valor_env2)
        valor_rec2 = connecting.recv(100*1024)
        
        operacao = add(valor_rec1, valor_rec2)
        
        connecting.send(operacao)
        

