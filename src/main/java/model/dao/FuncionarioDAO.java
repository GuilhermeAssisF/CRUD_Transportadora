package model.dao;

import java.util.List;

import model.ModelException;
import model.Funcionario;

public interface FuncionarioDAO {
	boolean save(Funcionario funcionario) throws ModelException ;
	boolean update(Funcionario funcionario) throws ModelException;
	boolean delete(Funcionario funcionario) throws ModelException;
	List<Funcionario> listAll() throws ModelException;
	Funcionario findById(int id) throws ModelException;
	Funcionario findByEmail(String email) throws ModelException;
}
