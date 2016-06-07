import java.io.Serializable;


public class RaizesException extends RuntimeException implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public RaizesException(String mensagem) {
		super(mensagem);
	}
}
