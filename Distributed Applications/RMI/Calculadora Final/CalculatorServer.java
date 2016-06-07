import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;

public class CalculatorServer extends UnicastRemoteObject implements Calculator {


	private static final long serialVersionUID = 1L;


	protected CalculatorServer()throws RemoteException {
		
		super();
	}

	public long add(long a, long b) throws RemoteException {
		// TODO Auto-generated method stub
		return a+b;
	}

	public long mult(long a, long b) throws RemoteException {
		// TODO Auto-generated method stub
		return a*b;
	}

	public long div(long a, long b) throws RemoteException {
		// TODO Auto-generated method stub
		return a/b;
	}

	public long sub(long a, long b) throws RemoteException {
		// TODO Auto-generated method stub
		return a-b;
	}
	
	
	public static void main(String[] args) {
		
		try{
			Registry registry = LocateRegistry.createRegistry(3991);
			Calculator c = new CalculatorServer();
			registry.bind("CalculatorService", c);
			System.out.println("Server Ok.");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
