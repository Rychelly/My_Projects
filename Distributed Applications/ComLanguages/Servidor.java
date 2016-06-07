
import java.io.*; 
import java.net.*;
import java.util.Scanner;
import java.*;
import java.io.ObjectOutputStream;
import java.io.PrintStream;


public class Servidor {
	

	public static void main(String[] args) throws IOException {
		
		ServerSocket servidor = new ServerSocket(3992);
		InetAddress inet = servidor.getInetAddress();
		System.out.println("HostAddress="+inet.getHostAddress());
		System.out.println("HostName="+inet.getHostName());
		
		System.out.println("Porta 3992 esta aberta");
		  
		Socket cliente = servidor.accept();
		
		ObjectInputStream entrada = new ObjectInputStream(cliente.getInputStream());
		ObjectOutputStream saida = new ObjectOutputStream(cliente.getOutputStream());
		
		byte num= entrada.readByte();
		
		System.out.println("Veio do cliente: "+Integer.toBinaryString(num));
		
		saida.writeByte(1);
		saida.flush();
	  }


	}


