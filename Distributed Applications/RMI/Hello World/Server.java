import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;


public class Server extends UnicastRemoteObject implements Hello {

	private static final long serialVersionUID = 1L;

	public Server()throws RemoteException{
		super();
	}

	public String hello() throws RemoteException{
		return "Hello World!";
	}
	
	public static void main(String args[]){
		
		try{
			Registry registry = LocateRegistry.createRegistry(3991);
			Server c = new Server();
			registry.bind("Hello", c);
			System.out.println("Server Ok.");
		}
		catch (Exception ex){
			System.out.println("Erro Server: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
}
