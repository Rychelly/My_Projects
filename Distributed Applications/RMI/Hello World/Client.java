import java.rmi.Naming;
import java.rmi.RemoteException;


public class Client {
	
	static String message=null;
	
	static Hello obj = null;
	
	public static void main (String args[]){
		
		try{
			obj = (Hello)Naming.lookup("//127.0.0.1:3991/Hello");
			message = obj.hello();
			System.out.println(message);
		}
		catch (Exception excecao){
			System.out.println("Cliente exception: " + excecao.getMessage());
			excecao.printStackTrace();
		}
	}
}
