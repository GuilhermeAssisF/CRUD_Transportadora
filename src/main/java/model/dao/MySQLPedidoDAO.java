package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Cliente;
import model.ModelException;
import model.Pedido;
import model.Produto;

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

        String sql = "SELECT p.id, p.cliente_id, p.produto_id, p.quantidade, p.data_pedido, " +
	                "pr.nome AS produto_nome, pr.preco AS produto_preco, " +
	                "c.nome AS cliente_nome " +
	                "FROM pedido p " +
	                "JOIN produto pr ON p.produto_id = pr.id " +
	                "JOIN cliente c ON p.cliente_id = c.id " +
	                "ORDER BY p.id";

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

        // Aqui você também pode trazer o produto se quiser, mesmo que o seu código anterior não fazia
        String sql = "SELECT p.id, p.cliente_id, p.produto_id, p.quantidade, p.data_pedido,\r\n"
	        		+ "       pr.nome AS produto_nome, pr.preco AS produto_preco,\r\n"
	        		+ "       c.nome AS cliente_nome\r\n"
	        		+ "FROM pedido p\r\n"
	        		+ "JOIN produto pr ON p.produto_id = pr.id\r\n"
	        		+ "JOIN cliente c ON p.cliente_id = c.id\r\n"
	        		+ "WHERE p.id = ?\r\n"
	        		+ "";

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

        // Cria e adiciona o Produto
        Produto produto = new Produto();
        produto.setId(db.getInt("produto_id"));
        produto.setNome(db.getString("produto_nome"));
        produto.setPreco(db.getBigDecimal("produto_preco"));
        p.setProduto(produto);

        // Cria e adiciona o Cliente
        Cliente cliente = new Cliente();
        cliente.setId(db.getInt("cliente_id"));
        cliente.setName(db.getString("cliente_nome"));
        p.setCliente(cliente);

        // Também seta os nomes diretamente no Pedido (caso você use em jsp como pedido.clienteNome, pedido.produtoNome)
        p.setProdutoNome(produto.getNome());
        p.setClienteNome(cliente.getName());

        return p;
    }

}
