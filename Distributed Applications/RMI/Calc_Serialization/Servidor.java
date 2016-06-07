import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;

public class Servidor extends UnicastRemoteObject implements Resultado, Serializable{

	private static final long serialVersionUID = 1L;
	private static int v_delta;
	
	public Servidor() throws RemoteException {
		super();
		this.setV_delta(0);
	}
	

	public int delta(Funcao_Quadratica item) throws RemoteException {
		v_delta = (item.getB()*item.getB())-(4*item.getA()*item.getC());
		return v_delta;
	}

	public Raizes raizes(Funcao_Quadratica item) throws RemoteException {
		
		testaDelta();
		Raizes raiz = new Raizes();
			raiz.a=((- item.getB()+Math.sqrt(v_delta))/(2*item.getA()));
			raiz.b=((- item.getB()-Math.sqrt(v_delta))/(2*item.getA()));
			return raiz;
	}
	
	public void testaDelta(){
		
		if(v_delta<0){
			throw new RaizesException("Delta negativo, raizes imaginárias!");
		}			
	}
	
	public void setV_delta(int delta) {
		v_delta = delta;
	}


	public int getV_delta() {
		return v_delta;
	}
	
	public static void main(String[] args) {
		
		try{
			Registry registry = LocateRegistry.createRegistry(7776);
			Resultado c = new Servidor();
			registry.bind("CalculadoraService", c);
			System.out.println("Server pronto.");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
