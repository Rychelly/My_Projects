
import java.net.*;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.util.Scanner;
import java.io.*;
import java.*;
import java.io.PrintStream;

public class Cliente { 
		
	  Socket cliente ;
	  ObjectInputStream out1 ;
	  ObjectInputStream inp1;
	  
	  public void recebeDados() throws IOException {
		  
		  out1 = new ObjectInputStream(cliente.getInputStream());
		  System.out.println("Resultado: "+Integer.toBinaryString(inp1.readByte()));
		  
	  }
	  
	  public void enviaDados(int num1) throws IOException {
		
		  ObjectOutputStream inp1 = new ObjectOutputStream(cliente.getOutputStream());
		  inp1.writeByte(num1);
		  inp1.flush();
		  
	  }
	
	  public static void main(String[] args)throws IOException{
	  
		Cliente Calculadora = new Cliente();
		Calculadora.cliente = new Socket("127.0.0.1",2525);
	    System.out.println("O cliente se conectou ao servidor");
	    Scanner input = new Scanner(System.in);
	  
	   
	    
	    System.out.println("Digite o primeiro numero:");
	    int nm1 = input.nextInt();
	    Calculadora.enviaDados(nm1);
	    Calculadora.recebeDados();

	    System.out.println("Chegou aqui!");
 
	}

}
