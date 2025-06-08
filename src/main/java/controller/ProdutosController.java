package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelException;
import model.Produto;
import model.dao.DAOFactory;
import model.dao.ProdutoDAO;

@WebServlet(urlPatterns = {"/produtos", "/produto/save", "/produto/update", "/produto/delete"})
public class ProdutosController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String action = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println(action);

        switch (action) {
            case "/CrudTransportadora/produtos": {

                // Carregar lista de produtos
                loadProdutos(req);

                RequestDispatcher rd = req.getRequestDispatcher("/produtos.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/produto/update": {

                loadProduto(req);

                RequestDispatcher rd = req.getRequestDispatcher("/form_produto.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/produto/delete": {

                deleteProduto(req);

                resp.sendRedirect(contextPath + "/produtos");
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

        if (action.equals(contextPath + "/produto/save")) {

            String produtoId = req.getParameter("produto_id");
            if (produtoId != null && !produtoId.equals(""))
                updateProduto(req);
            else 
                insertProduto(req);

            resp.sendRedirect(contextPath + "/produtos");

        } else {
            throw new IllegalArgumentException("Unexpected POST value: " + action);
        }
    }

    private void deleteProduto(HttpServletRequest req) {
        String produtoIdString = req.getParameter("produtoId");
        int produtoId = Integer.parseInt(produtoIdString);

        Produto produto = new Produto(produtoId);

        ProdutoDAO dao = DAOFactory.createDAO(ProdutoDAO.class);

        try {
            dao.delete(produto);
        } catch (ModelException e) {
            e.getCause().printStackTrace();
            e.printStackTrace();
        }
    }

    private void updateProduto(HttpServletRequest req) {
        Produto produto = createProduto(req);

        ProdutoDAO dao = DAOFactory.createDAO(ProdutoDAO.class);

        try {
            dao.update(produto);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private Produto createProduto(HttpServletRequest req) {
        String produtoId = req.getParameter("produto_id");
        String produtoNome = req.getParameter("produto_nome");
        String produtoDescricao = req.getParameter("produto_descricao");
        String produtoPrecoStr = req.getParameter("produto_preco");

        Produto produto;
        if (produtoId.equals(""))
            produto = new Produto();
        else 
            produto = new Produto(Integer.parseInt(produtoId));

        produto.setNome(produtoNome);
        produto.setDescricao(produtoDescricao);

        // Conversão segura de String para BigDecimal
        if (produtoPrecoStr != null && !produtoPrecoStr.isEmpty()) {
            try {
                BigDecimal preco = new BigDecimal(produtoPrecoStr.replace(",", "."));
                produto.setPreco(preco);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                produto.setPreco(BigDecimal.ZERO); // fallback para evitar NullPointer
            }
        } else {
            produto.setPreco(BigDecimal.ZERO);
        }

        return produto;
    }

    private void loadProduto(HttpServletRequest req) {
        String produtoIdParameter = req.getParameter("produtoId");

        if (produtoIdParameter == null || produtoIdParameter.isEmpty()) {
            return;
        }

        int produtoId = Integer.parseInt(produtoIdParameter);

        ProdutoDAO dao = DAOFactory.createDAO(ProdutoDAO.class);

        try {
            Produto produto = dao.findById(produtoId);

            if (produto == null)
                throw new ModelException("Produto não encontrado para alteração");

            req.setAttribute("produto", produto);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private void insertProduto(HttpServletRequest req) {
        Produto produto = createProduto(req);

        ProdutoDAO dao = DAOFactory.createDAO(ProdutoDAO.class);

        try {
            dao.save(produto);
        } catch (ModelException e) {
            e.printStackTrace();
        }
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
