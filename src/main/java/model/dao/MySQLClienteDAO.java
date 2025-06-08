package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Cliente;
import model.ModelException;

public class MySQLClienteDAO implements ClienteDAO {

    @Override
    public boolean save(Cliente cliente) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlInsert = "INSERT INTO cliente (nome, email, telefone) VALUES (?, ?, ?)";
        
        db.prepareStatement(sqlInsert);
        db.setString(1, cliente.getName());
        db.setString(2, cliente.getEmail());
        db.setString(3, cliente.getTelefone());
        
        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Cliente cliente) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlUpdate = "UPDATE cliente "
                          + "SET nome = ?, "
                          + "email = ?, "
                          + "telefone = ? "
                          + "WHERE id = ?";

        db.prepareStatement(sqlUpdate);

        db.setString(1, cliente.getName());
        db.setString(2, cliente.getEmail());
        db.setString(3, cliente.getTelefone());
        db.setInt(4, cliente.getId());
        
        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Cliente cliente) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlDelete = "DELETE FROM cliente WHERE id = ?";
        
        db.prepareStatement(sqlDelete);
        db.setInt(1, cliente.getId());
        
        return db.executeUpdate() > 0;
    }

    @Override
    public List<Cliente> listAll() throws ModelException {
        
        DBHandler db = new DBHandler();
        
        List<Cliente> clientes = new ArrayList<>();
        
        String sqlQuery = "SELECT * FROM cliente ORDER BY id";
        
        db.createStatement();
        db.executeQuery(sqlQuery);
        
        while (db.next()) {
            Cliente c = createCliente(db);
            clientes.add(c);
        }
        
        return clientes;
    }

    @Override
    public Cliente findById(int id) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sql = "SELECT * FROM cliente WHERE id = ?";
        
        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();
        
        Cliente c = null;
        while (db.next()) {
            c = createCliente(db);
            break;
        }
        
        return c;
    }
    
    private Cliente createCliente(DBHandler db) throws ModelException {
        Cliente c = new Cliente(db.getInt("id"));
        c.setName(db.getString("nome"));
        c.setEmail(db.getString("email"));
        c.setTelefone(db.getString("telefone"));
        
        return c;
    }
}
