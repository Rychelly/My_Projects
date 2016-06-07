#coding: utf-8

import socket

host = '127.0.0.1'
port = 3998

tcp_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

destino = (host, port)

tcp_client.connect(destino)

online = true

while online:
	
	tcp_client.send(b'1')
	
