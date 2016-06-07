import java.io.Serializable;
import java.rmi.Naming;

public class Cliente implements Serializable{


	private static final long serialVersionUID = 1L;

public static void main(String[] args){
		
		try{
			Funcao_Quadratica item=new Funcao_Quadratica();
			item.setA(1);
			item.setB(-2);
			item.setC(2);
			int delta;
			
			Resultado c =  (Resultado) Naming.lookup("//127.0.0.1:7776/CalculadoraService");
			delta = c.delta(item);
			System.out.println("Delta : "+delta);

			Raizes rais= new Raizes();
			//testaDelta(delta);
			rais=c.raizes(item);
			System.out.println("Rais 1: "+rais.getA());
			System.out.println("Rais 2: "+rais.getB());
				
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
