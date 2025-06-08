package model;

import java.sql.Timestamp;

public class Pedido {

    private int id;
    private int clienteId;
    private int produtoId;
    private int quantidade;
    private Timestamp dataPedido;

    public Pedido() {
        this(0);
    }

    public Pedido(int id) {
        this.id = id;
        this.clienteId = 0;
        this.produtoId = 0;
        this.quantidade = 0;
        this.dataPedido = null;
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

    @Override
    public String toString() {
        return "Pedido #" + id;
    }
}
