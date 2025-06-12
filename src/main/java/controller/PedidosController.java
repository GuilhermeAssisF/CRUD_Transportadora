package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

            	loadClientes(req);
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
        String dataPedidoStr = req.getParameter("data_pedido"); // <-- Pegue a string da data

        Pedido pedido;
        if (pedidoId == null || pedidoId.equals("")) // Use null check para maior segurança
            pedido = new Pedido();
        else
            pedido = new Pedido(Integer.parseInt(pedidoId));

        pedido.setClienteId(Integer.parseInt(clienteId));
        pedido.setProdutoId(Integer.parseInt(produtoId));
        pedido.setQuantidade(Integer.parseInt(quantidade));

        // --- Lógica para converter e definir a data ---
        if (dataPedidoStr != null && !dataPedidoStr.isEmpty()) {
            try {
                // Formato da data que vem do input type="date" (yyyy-MM-dd)
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(dataPedidoStr);
                pedido.setDataPedido(new Timestamp(parsedDate.getTime()));
            } catch (ParseException e) {          
                System.err.println("Erro ao converter data do pedido: " + dataPedidoStr + " - " + e.getMessage());
                req.setAttribute("errorMessage", "Formato de data inválido. Por favor, insira a data no formato YYYY-MM-DD.");
            }
        }
        // --- FIM DA LÓGICA DE DATA ---

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
        PedidoDAO pedidoDao = DAOFactory.createDAO(PedidoDAO.class);

        List<Pedido> pedidos = null;
        BigDecimal totalGeralPedidos = BigDecimal.ZERO; // Inicializa a soma

        String clienteIdFilterStr = req.getParameter("clienteFilter"); 
        int selectedClienteFilter = 0; 

        if (clienteIdFilterStr != null && !clienteIdFilterStr.isEmpty()) {
            try {
                selectedClienteFilter = Integer.parseInt(clienteIdFilterStr);
            } catch (NumberFormatException e) {
                System.err.println("ID de cliente para filtro inválido: " + clienteIdFilterStr);
                // Adiciona uma mensagem de erro à requisição caso o ID seja inválido
                req.setAttribute("errorMessage", "ID de cliente inválido para filtro. O filtro não foi aplicado.");
            }
        }

        try {
            if (selectedClienteFilter > 0) {
                // Se um cliente for selecionado, carrega apenas os pedidos desse cliente
                pedidos = pedidoDao.listAllByCliente(selectedClienteFilter);
            } else {
                // Se nenhum filtro ou filtro "Todos", carrega todos os pedidos
                pedidos = pedidoDao.listAll();
            }

            // Calcula a soma total dos pedidos filtrados
            if (pedidos != null) {
                for (Pedido pedido : pedidos) {
                    // Garante que o produto e o preço não são nulos antes de somar
                    if (pedido.getProduto() != null && pedido.getProduto().getPreco() != null) {
                        totalGeralPedidos = totalGeralPedidos.add(
                            pedido.getProduto().getPreco().multiply(new BigDecimal(pedido.getQuantidade()))
                        );
                    }
                }
            }

        } catch (ModelException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Erro ao carregar a lista de pedidos: " + e.getMessage());
        }

        req.setAttribute("pedidos", pedidos);
        req.setAttribute("totalGeralPedidos", totalGeralPedidos);
        req.setAttribute("selectedClienteFilter", selectedClienteFilter);
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