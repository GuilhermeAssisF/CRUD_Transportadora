package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelException;
import model.Pedido;
import model.Cliente;
import model.Produto;
import model.dao.DAOFactory;
import model.dao.PedidoDAO;
import model.dao.ClienteDAO;
import model.dao.ProdutoDAO;

@WebServlet(urlPatterns = {"/pedidos", "/pedido/save", "/pedido/update", "/pedido/delete"})
public class PedidosController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println(action);

        switch (action) {
            case "/CrudTransportadora/pedidos": {

                loadPedidos(req);

                RequestDispatcher rd = req.getRequestDispatcher("/pedidos.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/pedido/update": {

                loadPedido(req);
                loadClientes(req);
                loadProdutos(req);

                RequestDispatcher rd = req.getRequestDispatcher("/form_pedido.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/pedido/delete": {

                deletePedido(req);

                resp.sendRedirect(contextPath + "/pedidos");
                break;
            }
            default:
                throw new IllegalArgumentException("Unexpected value: " + action);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println("POST: " + action);

        if (action.equals(contextPath + "/pedido/save")) {

            String pedidoId = req.getParameter("pedido_id");
            if (pedidoId != null && !pedidoId.equals(""))
                updatePedido(req);
            else
                insertPedido(req);

            resp.sendRedirect(contextPath + "/pedidos");

        } else {
            throw new IllegalArgumentException("Unexpected POST value: " + action);
        }
    }

    private void deletePedido(HttpServletRequest req) {
        String pedidoIdString = req.getParameter("pedidoId");
        int pedidoId = Integer.parseInt(pedidoIdString);

        Pedido pedido = new Pedido(pedidoId);

        PedidoDAO dao = DAOFactory.createDAO(PedidoDAO.class);

        try {
            dao.delete(pedido);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private void updatePedido(HttpServletRequest req) {
        Pedido pedido = createPedido(req);

        PedidoDAO dao = DAOFactory.createDAO(PedidoDAO.class);

        try {
            dao.update(pedido);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private Pedido createPedido(HttpServletRequest req) {
        String pedidoId = req.getParameter("pedido_id");
        String clienteId = req.getParameter("cliente_id");
        String produtoId = req.getParameter("produto_id");
        String quantidade = req.getParameter("quantidade");

        Pedido pedido;
        if (pedidoId.equals(""))
            pedido = new Pedido();
        else
            pedido = new Pedido(Integer.parseInt(pedidoId));

        pedido.setClienteId(Integer.parseInt(clienteId));
        pedido.setProdutoId(Integer.parseInt(produtoId));
        pedido.setQuantidade(Integer.parseInt(quantidade));

        return pedido;
    }

    private void loadPedido(HttpServletRequest req) {
        String pedidoIdParameter = req.getParameter("pedidoId");

        if (pedidoIdParameter == null || pedidoIdParameter.isEmpty()) {
            // Novo pedido
            return;
        }

        int pedidoId = Integer.parseInt(pedidoIdParameter);

        PedidoDAO dao = DAOFactory.createDAO(PedidoDAO.class);

        try {
            Pedido pedido = dao.findById(pedidoId);

            if (pedido == null)
                throw new ModelException("Pedido não encontrado para alteração");

            req.setAttribute("pedido", pedido);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private void insertPedido(HttpServletRequest req) {
        Pedido pedido = createPedido(req);

        PedidoDAO dao = DAOFactory.createDAO(PedidoDAO.class);

        try {
            dao.save(pedido);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private void loadPedidos(HttpServletRequest req) {
        PedidoDAO dao = DAOFactory.createDAO(PedidoDAO.class);

        List<Pedido> pedidos = null;
        try {
            pedidos = dao.listAll();
        } catch (ModelException e) {
            e.printStackTrace();
        }

        if (pedidos != null)
            req.setAttribute("pedidos", pedidos);
    }

    private void loadClientes(HttpServletRequest req) {
        ClienteDAO dao = DAOFactory.createDAO(ClienteDAO.class);

        List<Cliente> clientes = null;
        try {
            clientes = dao.listAll();
        } catch (ModelException e) {
            e.printStackTrace();
        }

        if (clientes != null)
            req.setAttribute("clientes", clientes);
    }

    private void loadProdutos(HttpServletRequest req) {
        ProdutoDAO dao = DAOFactory.createDAO(ProdutoDAO.class);

        List<Produto> produtos = null;
        try {
            produtos = dao.listAll();
        } catch (ModelException e) {
            e.printStackTrace();
        }

        if (produtos != null)
            req.setAttribute("produtos", produtos);
    }
}
