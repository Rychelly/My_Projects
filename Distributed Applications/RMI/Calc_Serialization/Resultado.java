import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Resultado extends Remote{
	
	public int delta(Funcao_Quadratica item)throws RemoteException;
	public Raizes raizes(Funcao_Quadratica item)throws RemoteException;
	public void testaDelta()throws RemoteException; 
}
