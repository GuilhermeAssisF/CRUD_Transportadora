package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.ModelException;
import model.Pedido;

public class MySQLPedidoDAO implements PedidoDAO {

    @Override
    public boolean save(Pedido pedido) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "INSERT INTO pedido (cliente_id, produto_id, quantidade) VALUES (?, ?, ?)";

        db.prepareStatement(sql);
        db.setInt(1, pedido.getClienteId());
        db.setInt(2, pedido.getProdutoId());
        db.setInt(3, pedido.getQuantidade());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Pedido pedido) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "UPDATE pedido SET cliente_id = ?, produto_id = ?, quantidade = ? WHERE id = ?";

        db.prepareStatement(sql);
        db.setInt(1, pedido.getClienteId());
        db.setInt(2, pedido.getProdutoId());
        db.setInt(3, pedido.getQuantidade());
        db.setInt(4, pedido.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Pedido pedido) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "DELETE FROM pedido WHERE id = ?";

        db.prepareStatement(sql);
        db.setInt(1, pedido.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public List<Pedido> listAll() throws ModelException {
        DBHandler db = new DBHandler();

        List<Pedido> pedidos = new ArrayList<>();

        String sql = "SELECT * FROM pedido ORDER BY id";

        db.createStatement();
        db.executeQuery(sql);

        while (db.next()) {
            Pedido p = createPedido(db);
            pedidos.add(p);
        }

        return pedidos;
    }

    @Override
    public Pedido findById(int id) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "SELECT * FROM pedido WHERE id = ?";

        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();

        Pedido p = null;
        while (db.next()) {
            p = createPedido(db);
            break;
        }

        return p;
    }

    private Pedido createPedido(DBHandler db) throws ModelException {
        Pedido p = new Pedido(db.getInt("id"));
        p.setClienteId(db.getInt("cliente_id"));
        p.setProdutoId(db.getInt("produto_id"));
        p.setQuantidade(db.getInt("quantidade"));
        p.setDataPedido(db.getTimestamp("data_pedido"));

        return p;
    }
}
