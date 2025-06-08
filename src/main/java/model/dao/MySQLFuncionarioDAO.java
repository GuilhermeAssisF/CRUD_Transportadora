package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.ModelException;
import model.Funcionario;

public class MySQLFuncionarioDAO implements FuncionarioDAO {

    @Override
    public boolean save(Funcionario funcionario) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlInsert = "INSERT INTO funcionario (nome, sexo, email, senha) VALUES (?, ?, ?, ?)";
        
        db.prepareStatement(sqlInsert);
        db.setString(1, funcionario.getName());
        db.setString(2, funcionario.getGender());
        db.setString(3, funcionario.getEmail());
        db.setString(4, funcionario.getSenha());
          
        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Funcionario funcionario) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlUpdate = "UPDATE funcionario "
                          + "SET nome = ?, "
                          + "sexo = ?, "
                          + "email = ?, "
                          + "senha = ? "
                          + "WHERE id = ?";

        db.prepareStatement(sqlUpdate);
        
        // Se a senha veio nula ou vazia, busca a senha atual
        String senha = funcionario.getSenha();
        if (senha == null || senha.equals("")) {
            senha = this.findById(funcionario.getId()).getSenha();
        }

        db.setString(1, funcionario.getName());
        db.setString(2, funcionario.getGender());
        db.setString(3, funcionario.getEmail());
        db.setString(4, senha);
        db.setInt(5, funcionario.getId());
        
        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Funcionario funcionario) throws ModelException {
        
        DBHandler db = new DBHandler();
        
        String sqlDelete = "DELETE FROM funcionario WHERE id = ?";

        db.prepareStatement(sqlDelete);        
        db.setInt(1, funcionario.getId());
        
        return db.executeUpdate() > 0;
    }

    @Override
    public List<Funcionario> listAll() throws ModelException {
    
        DBHandler db = new DBHandler();
        
        List<Funcionario> funcionarios = new ArrayList<Funcionario>();
            
        String sqlQuery = "SELECT * FROM funcionario ORDER BY id";
        
        db.createStatement();
    
        db.executeQuery(sqlQuery);

        while (db.next()) {
            Funcionario f = createFuncionario(db);
            funcionarios.add(f);
        }
        
        return funcionarios;
    }

    @Override
    public Funcionario findById(int id) throws ModelException {
        
        DBHandler db = new DBHandler();
                
        String sql = "SELECT * FROM funcionario WHERE id = ?";
        
        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();
        
        Funcionario u = null;
        while (db.next()) {
            u = createFuncionario(db);
            break;
        }
        
        return u;
    }
    
    @Override
    public Funcionario findByEmail(String email) throws ModelException {
        DBHandler db = new DBHandler();
        
        String sql = "SELECT * FROM funcionario WHERE email = ?";
        
        db.prepareStatement(sql);
        db.setString(1, email);
        db.executeQuery();
        
        Funcionario u = null;
        while (db.next()) {
            u = createFuncionario(db);
            break;
        }
        
        return u;
    }
    
    private Funcionario createFuncionario(DBHandler db) throws ModelException {
        Funcionario u = new Funcionario(db.getInt("id"));
        u.setName(db.getString("nome"));
        u.setGender(db.getString("sexo"));
        u.setEmail(db.getString("email"));
        u.setSenha(db.getString("senha"));
        
        return u;
    }
}
