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
import model.Funcionario;
import model.dao.DAOFactory;
import model.dao.FuncionarioDAO;
import model.utils.PasswordEncryptor;

@WebServlet(urlPatterns = {"/funcionarios", "/funcionario/save", "/funcionario/update", "/funcionario/delete"})
public class FuncionariosController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String action = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println(action);

        switch (action) {
            case "/CrudTransportadora/funcionarios": {

                // Carregar lista de funcionarios
                loadFuncionarios(req);

                RequestDispatcher rd = req.getRequestDispatcher("/funcionarios.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/funcionario/update": {

                loadFuncionario(req);

                RequestDispatcher rd = req.getRequestDispatcher("/form_funcionario.jsp");
                rd.forward(req, resp);
                break;
            }
            case "/CrudTransportadora/funcionario/delete": {

                deleteFuncionario(req);

                resp.sendRedirect(contextPath + "/funcionarios");
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

        if (action.equals(contextPath + "/funcionario/save")) {

            String funcionarioId = req.getParameter("funcionario_id");
            if (funcionarioId != null && !funcionarioId.equals(""))
                updateFuncionario(req);
            else 
                insertFuncionario(req);

            resp.sendRedirect(contextPath + "/funcionarios");

        } else {
            throw new IllegalArgumentException("Unexpected POST value: " + action);
        }
    }

    private void deleteFuncionario(HttpServletRequest req) {
        String funcionarioIdString = req.getParameter("funcionarioId");
        int funcionarioId = Integer.parseInt(funcionarioIdString);

        Funcionario funcionario = new Funcionario(funcionarioId);

        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);

        try {
            dao.delete(funcionario);
        } catch (ModelException e) {
            e.getCause().printStackTrace();
            e.printStackTrace();
        }
    }

    private void updateFuncionario(HttpServletRequest req) {
        Funcionario funcionario = createFuncionario(req);

        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);

        try {
            dao.update(funcionario);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private Funcionario createFuncionario(HttpServletRequest req) {
        String funcionarioId = req.getParameter("funcionario_id");
        String funcionarioName = req.getParameter("funcionario_name");
        String funcionarioGender = req.getParameter("funcionario_gender");
        String funcionarioEMail = req.getParameter("funcionario_email");

        String funcionarioPW = req.getParameter("funcionario_pw");
        if (!funcionarioPW.equals(""))
            funcionarioPW = PasswordEncryptor.hashPassword(funcionarioPW);

        Funcionario funcionario;
        if (funcionarioId.equals(""))
            funcionario = new Funcionario();
        else 
            funcionario = new Funcionario(Integer.parseInt(funcionarioId));

        funcionario.setName(funcionarioName);
        funcionario.setGender(funcionarioGender);
        funcionario.setEmail(funcionarioEMail);
        funcionario.setSenha(funcionarioPW);

        return funcionario;
    }

    private void loadFuncionario(HttpServletRequest req) {
        String funcionarioIdParameter = req.getParameter("funcionarioId");

        if (funcionarioIdParameter == null || funcionarioIdParameter.isEmpty()) {
            // Se não foi passado ID, não carrega nada (novo funcionário)
            return;
        }

        int funcionarioId = Integer.parseInt(funcionarioIdParameter);

        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);

        try {
            Funcionario funcionario = dao.findById(funcionarioId);

            if (funcionario == null)
                throw new ModelException("Usuário não encontrado para alteração");
            
            req.setAttribute("funcionario", funcionario);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }


    private void insertFuncionario(HttpServletRequest req) {
        Funcionario funcionario = createFuncionario(req);

        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);

        try {
            dao.save(funcionario);
        } catch (ModelException e) {
            e.printStackTrace();
        }
    }

    private void loadFuncionarios(HttpServletRequest req) {
        FuncionarioDAO dao = DAOFactory.createDAO(FuncionarioDAO.class);

        List<Funcionario> funcionarios = null;
        try {
            funcionarios = dao.listAll();
        } catch (ModelException e) {
            e.printStackTrace();
        }

        if (funcionarios != null)
            req.setAttribute("funcionarios", funcionarios);
    }
}
