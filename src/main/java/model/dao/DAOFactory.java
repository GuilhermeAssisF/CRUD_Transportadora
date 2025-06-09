package model.dao;

import java.util.HashMap;
import java.util.Map;

public class DAOFactory {
	
	private static Map<Class, Object> listDAOsInterfaces = new HashMap<Class, Object>();
	
	// Para o DAOFactory funcionar para suas classes de domínio, adicione na 
	// lista suas interfaces e classes DAO na listDAOsInterfaces
	static {
		listDAOsInterfaces.put(FuncionarioDAO.class, new MySQLFuncionarioDAO());
		listDAOsInterfaces.put(ClienteDAO.class, new MySQLClienteDAO());
		listDAOsInterfaces.put(ProdutoDAO.class, new MySQLProdutoDAO());
		listDAOsInterfaces.put(PedidoDAO.class, new MySQLPedidoDAO());
	}
	
	@SuppressWarnings("unchecked")
	public static <DAOInterface> DAOInterface createDAO(Class<?> entity){
		return (DAOInterface) listDAOsInterfaces.get(entity);
	} 
	
	
}
