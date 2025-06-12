package model;

import java.sql.Timestamp;
import java.math.BigDecimal;

public class Pedido {

    private int id;
    private int clienteId;
    private int produtoId;
    private int quantidade;
    private Timestamp dataPedido;

    // exibir nome de cliente e nome do produto
    private String clienteNome;
    private String produtoNome;

    // Referências para objeto
    private Cliente cliente;
    private Produto produto;

    public Pedido() {
        this(0);
    }

    public Pedido(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Timestamp getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Timestamp dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getClienteNome() {
        return clienteNome;
    }

    public void setClienteNome(String clienteNome) {
        this.clienteNome = clienteNome;
    }

    public String getProdutoNome() {
        return produtoNome;
    }

    public void setProdutoNome(String produtoNome) {
        this.produtoNome = produtoNome;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    // método que calcula o valor total do pedido
    public BigDecimal getValorTotal() {
        if (produto != null && produto.getPreco() != null) {
            return produto.getPreco().multiply(new BigDecimal(quantidade));
        } else {
            return BigDecimal.ZERO;
        }
    }
}