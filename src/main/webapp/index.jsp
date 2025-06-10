<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>GA Transportes - Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    </head>

    <body>
        <div class="d-flex flex-column min-vh-100">
            <header>
                <nav class="navbar navbar-expand-lg top-navbar">
                    <div class="container-fluid">
                        <a class="navbar-brand fs-4" href="${pageContext.request.contextPath}/">Transportadora</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#mainNavbarCollapse" aria-controls="mainNavbarCollapse"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="mainNavbarCollapse">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <%-- Lógica para o item "Home" (ativo e não clicável nesta página) --%>
                                        <c:set var="isHomeActive"
                                            value="${pageContext.request.servletPath eq '/' || pageContext.request.servletPath eq '/index.jsp'}" />
                                        <c:choose>
                                            <c:when test="${isHomeActive}">
                                                <span class="nav-link active" aria-current="page">
                                                    <i class="bi bi-house-door me-2"></i>Home
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/" class="nav-link">
                                                    <i class="bi bi-house-door me-2"></i>Home
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/clientes"
                                        class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                                        <i class="bi bi-person-check me-2"></i>Clientes
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/produtos"
                                        class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
                                        <i class="bi bi-box-seam me-2"></i>Produtos
                                    </a>
                                </li>
                                <li class="nav-item me-4"> <%-- Adicionado me-4 aqui --%>
                                        <a href="${pageContext.request.contextPath}/pedidos"
                                            class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
                                            <i class="bi bi-receipt me-2"></i>Pedidos
                                        </a>
                                </li>
                                <%-- Movido para antes do Sair e estilizado como botão de perfil --%>
                                    <li class="nav-item">
                                        <c:set var="isFuncionariosActive"
                                            value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                                        <c:choose>
                                            <c:when test="${isFuncionariosActive}">
                                                <span
                                                    class="btn btn-primary btn-profile d-flex align-items-center active">
                                                    <i class="bi bi-person-vcard me-2"></i>Funcionário
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/funcionarios"
                                                    class="btn btn-outline-primary btn-profile d-flex align-items-center">
                                                    <i class="bi bi-person-vcard me-2"></i>Funcionário
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/login"
                                            class="btn btn-outline-danger btn-logout d-flex align-items-center ms-2">
                                            <%-- Adicionado ms-2 para espaçamento --%>
                                                <i class="bi bi-box-arrow-right me-2"></i>Sair
                                        </a>
                                    </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>

            <main
                class="flex-grow-1 d-flex flex-column justify-content-center align-items-center text-center main-content-wrapper">
                <h1 class="my-5 display-5 text-dark">Bem-vindo ao Sistema GA Transportes</h1>
                <div class="container">
                    <div class="row justify-content-center g-4">
                        <div class="col-md-4 col-lg-3">
                            <a href="${pageContext.request.contextPath}/clientes"
                                class="card card-menu text-decoration-none">
                                <div class="card-body">
                                    <i class="bi bi-people-fill display-4 text-primary"></i>
                                    <h5 class="card-title text-dark">Clientes</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 col-lg-3">
                            <a href="${pageContext.request.contextPath}/produtos"
                                class="card card-menu text-decoration-none">
                                <div class="card-body">
                                    <i class="bi bi-box-seam-fill display-4 text-success"></i>
                                    <h5 class="card-title text-dark">Produtos</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 col-lg-3">
                            <a href="${pageContext.request.contextPath}/pedidos"
                                class="card card-menu text-decoration-none">
                                <div class="card-body">
                                    <i class="bi bi-journal-check display-4 text-info"></i>
                                    <h5 class="card-title text-dark">Pedidos</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="text-white text-center main-footer">
                <div class="container">
                    <p class="mb-0">&copy; 2025 GA Transportes. Todos os direitos reservados.</p>
                </div>
            </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

    </html>