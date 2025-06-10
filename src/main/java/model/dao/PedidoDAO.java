package model.dao;

import java.util.List;

import model.Pedido;
import model.ModelException;


public interface PedidoDAO {
	boolean save(Pedido pedido) throws ModelException ;
	boolean update(Pedido pedido) throws ModelException;
	boolean delete(Pedido pedido) throws ModelException;
	List<Pedido> listAllByCliente(int clienteId) throws ModelException;
	List<Pedido> listAll() throws ModelException;
	Pedido findById(int id) throws ModelException;
	
}
