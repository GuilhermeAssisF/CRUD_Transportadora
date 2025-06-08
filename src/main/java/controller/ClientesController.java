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
import model.Cliente;
import model.dao.DAOFactory;
import model.dao.ClienteDAO;

@WebServlet(urlPatterns = {"/clientes", "/cliente/save", "/cliente/update", "/cliente/delete"})
public class ClientesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String action = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println(action);

        switch (action) {
            case "/CrudTransportadora/clientes": {

                // Carregar lista de clientes
                loadClientes(req);

                RequestDispatcher rd = req.getRequestDispatcher("/clientes.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/cliente/update": {

                loadCliente(req);

                RequestDispatcher rd = req.getRequestDispatcher("/form_cliente.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/cliente/delete": {

                deleteCliente(req);

                resp.sendRedirect(contextPath + "/clientes");
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

        if (action.equals(contextPath + "/cliente/save")) {

            String clienteId = req.getParameter("cliente_id");
            if (clienteId != null && !clienteId.equals(""))
                updateCliente(req);
            else 
                insertCliente(req);

            resp.sendRedirect(contextPath + "/clientes");

        } else {
            throw new IllegalArgumentException("Unexpected POST value: " + action);
        }
    }
	
	private void deleteCliente(HttpServletRequest req) {
        String clienteIdString = req.getParameter("clienteId");
        int clienteId = Integer.parseInt(clienteIdString);

        Cliente cliente = new Cliente(clienteId);

        ClienteDAO dao = DAOFactory.createDAO(ClienteDAO.class);

        try {
            dao.delete(cliente);
        } catch (ModelException e) {
            e.getCause().printStackTrace();
            e.printStackTrace();
        }
    }
	
	private void updateCliente(HttpServletRequest req) {
        Cliente cliente = createCliente(req);

        ClienteDAO dao = DAOFactory.createDAO(ClienteDAO.class);

        try {
            dao.update(cliente);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }
	
	private Cliente createCliente(HttpServletRequest req) {
        String clienteId = req.getParameter("cliente_id");
        String clienteName = req.getParameter("cliente_name");
        String clienteEmail = req.getParameter("cliente_email");
        String clienteTelefone = req.getParameter("cliente_telefone");

        Cliente cliente;
        if (clienteId.equals(""))
            cliente = new Cliente();
        else 
            cliente = new Cliente(Integer.parseInt(clienteId));

        cliente.setName(clienteName);
        cliente.setEmail(clienteEmail);
        cliente.setTelefone(clienteTelefone);

        return cliente;
    }
	
	private void loadCliente(HttpServletRequest req) {
        String clienteIdParameter = req.getParameter("clienteId");

        if (clienteIdParameter == null || clienteIdParameter.isEmpty()) {
            // Se não foi passado ID, não carrega nada (novo funcionário)
            return;
        }

        int clienteId = Integer.parseInt(clienteIdParameter);

        ClienteDAO dao = DAOFactory.createDAO(ClienteDAO.class);

        try {
            Cliente cliente = dao.findById(clienteId);

            if (cliente == null)
                throw new ModelException("Usuário não encontrado para alteração");
            
            req.setAttribute("cliente", cliente);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }
	
    private void insertCliente(HttpServletRequest req) {
    	Cliente cliente = createCliente(req);

    	ClienteDAO dao = DAOFactory.createDAO(ClienteDAO.class);

        try {
            dao.save(cliente);
        } catch (ModelException e) {
            e.printStackTrace();
        }
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
}
