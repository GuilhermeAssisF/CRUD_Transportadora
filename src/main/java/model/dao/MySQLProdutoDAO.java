package model.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import model.ModelException;
import model.Produto;

public class MySQLProdutoDAO implements ProdutoDAO {

    @Override
    public boolean save(Produto produto) throws ModelException {

        DBHandler db = new DBHandler();

        String sqlInsert = "INSERT INTO produto (nome, descricao, preco) VALUES (?, ?, ?)";

        db.prepareStatement(sqlInsert);
        db.setString(1, produto.getNome());
        db.setString(2, produto.getDescricao());
        db.setBigDecimal(3, produto.getPreco());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Produto produto) throws ModelException {

        DBHandler db = new DBHandler();

        String sqlUpdate = "UPDATE produto "
                         + "SET nome = ?, "
                         + "descricao = ?, "
                         + "preco = ? "
                         + "WHERE id = ?";

        db.prepareStatement(sqlUpdate);

        db.setString(1, produto.getNome());
        db.setString(2, produto.getDescricao());
        db.setBigDecimal(3, produto.getPreco());
        db.setInt(4, produto.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Produto produto) throws ModelException {

        DBHandler db = new DBHandler();

        String sqlDelete = "DELETE FROM produto WHERE id = ?";

        db.prepareStatement(sqlDelete);
        db.setInt(1, produto.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public List<Produto> listAll() throws ModelException {

        DBHandler db = new DBHandler();

        List<Produto> produtos = new ArrayList<>();

        String sqlQuery = "SELECT * FROM produto ORDER BY id";

        db.createStatement();
        db.executeQuery(sqlQuery);

        while (db.next()) {
            Produto p = createProduto(db);
            produtos.add(p);
        }

        return produtos;
    }

    @Override
    public Produto findById(int id) throws ModelException {

        DBHandler db = new DBHandler();

        String sql = "SELECT * FROM produto WHERE id = ?";

        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();

        Produto p = null;
        while (db.next()) {
            p = createProduto(db);
            break;
        }

        return p;
    }

    private Produto createProduto(DBHandler db) throws ModelException {
        Produto p = new Produto(db.getInt("id"));
        p.setNome(db.getString("nome"));
        p.setDescricao(db.getString("descricao"));

        // Lendo preco como BigDecimal:
        BigDecimal preco = db.getBigDecimal("preco");
        p.setPreco(preco);

        return p;
    }
}
