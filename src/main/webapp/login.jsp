<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Login - GA Transportes</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    </head>

    <body>
      <div class="d-flex flex-column min-vh-100">
        <nav class="navbar login-top-navbar">
          <div class="container">
            <span class="navbar-brand mb-0 h1">GA Transportes</span>
          </div>
        </nav>

        <main class="flex-grow-1 d-flex justify-content-center align-items-center">
          <div class="login-card">

            <h2 class="text-center mb-4">Login</h2>

            <form action="${pageContext.request.contextPath}/login" method="POST">
              <div class="mb-3">
                <label for="funcionario_login_id" class="form-label"><i class="bi bi-person me-2"></i>Login
                  (e-mail)</label>
                <input type="text" class="form-control" id="funcionario_login_id" name="funcionario_login"
                  placeholder="Digite seu e-mail" required />
              </div>

              <div class="mb-3">
                <label for="funcionario_pw_id" class="form-label"><i class="bi bi-key me-2"></i>Senha</label>
                <input type="password" class="form-control" id="funcionario_pw_id" name="funcionario_pw"
                  placeholder="Digite sua senha" required />
              </div>

              <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary btn-lg">
                  <i class="bi bi-box-arrow-in-right me-2"></i>Logar
                </button>
              </div>

              <c:if test="${param.erro == 'true'}">
                <span class="text-danger small"><i class="bi bi-exclamation-triangle-fill me-1"></i>Usuário ou senha
                  inválidos.</span>
              </c:if>
            </form>

          </div>
        </main>

        <footer class="text-white text-center main-footer">
          <div class="container">
            <jsp:useBean id="date" class="java.util.Date" />
            <fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
            <p class="mb-0">&copy;
              <c:out value="${currentYear}" /> GA Transportes. Todos os direitos reservados.
            </p>
          </div>
        </footer>
      </div>
      <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>