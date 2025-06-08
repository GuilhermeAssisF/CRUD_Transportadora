package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ModelException;
import model.Funcionario;
import model.dao.DAOFactory;
import model.dao.FuncionarioDAO;
import model.utils.PasswordEncryptor;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class LoginController extends HttpServlet{

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String funcionarioLogin = req.getParameter("funcionario_login");
        String funcionarioPW = req.getParameter("funcionario_pw");

        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);
        Funcionario funcionario = null;

        try {
            funcionario = dao.findByEmail(funcionarioLogin);
        } catch (ModelException e) {
            e.printStackTrace();
        }

        if (funcionario != null && PasswordEncryptor.checkPassword(funcionarioPW, funcionario.getSenha())) {

            req.getSession().setAttribute("funcionario_logado", funcionario);
            // Redireciona para a página principal com o context path correto
            resp.sendRedirect(req.getContextPath() + "/");
        } else {
            // Redireciona para login.jsp com parâmetro de erro, com context path correto
            resp.sendRedirect(req.getContextPath() + "/login.jsp?erro=true");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        // O att false indica que não é para criar uma sessão caso ela não exista
        HttpSession session = req.getSession(false);

        if (session != null)
            session.invalidate();

        // Redireciona para login.jsp com context path correto
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
