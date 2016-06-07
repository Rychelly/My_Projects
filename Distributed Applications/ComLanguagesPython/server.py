#coding: utf-8

import socket

host = ''
port = 3998

tcp_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

origem = (host, port)

tcp_server.bind(origem)

tcp_server.listen(1)

online = True

while online:
	connecting, client = tcp_server.accept()
    
    print "Conectado com ", client
    
    mensagem_rec = connecting.recv(100*1024)
    
    print mensagem_rec
