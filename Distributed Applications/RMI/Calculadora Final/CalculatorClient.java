

import java.rmi.Naming;

public class CalculatorClient {

	public static void main(String[] args){
		
		try{
			Calculator c =  (Calculator) Naming.lookup("//127.0.0.1:3991/CalculatorServer");
			System.out.println("Addition : "+c.add(20, 16));
			System.out.println("Subtraction : "+c.sub(20, 16));
			System.out.println("Division : "+c.div(20, 16));
			System.out.println("Multiplication : "+c.mult(20, 16));
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
