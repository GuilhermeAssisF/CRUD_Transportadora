<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GA Transportes - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Estilos globais do Body (copiados das outras páginas) */
        body {
            background-color: #f0f2f5; /* Fundo cinza claro consistente */
        }
        /* Estilos da Navbar do cabeçalho (para o index) */
        .top-navbar {
            background-color: #ffffff; /* Fundo branco para a navbar */
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Sombra sutil */
            padding: 0.75rem 1.5rem; /* Padding para espaçamento */
        }
        .top-navbar .navbar-brand {
            font-weight: bold;
            color: #343a40; /* Cor escura para o texto da marca */
        }
        .top-navbar .nav-link {
            color: #495057; /* Cor padrão para links da navbar */
            padding: 0.5rem 1rem;
            margin-left: 0.5rem; /* Espaçamento entre os links */
            border-radius: 0.5rem;
            transition: all 0.2s ease-in-out;
        }
        .top-navbar .nav-link:hover {
            background-color: #e9ecef; /* Cor de fundo ao passar o mouse */
            color: #0d6efd; /* Cor do texto ao passar o mouse */
        }
        .top-navbar .nav-link.active {
            font-weight: 600;
            background-color: #0d6efd !important; /* Cor de fundo mais forte para ativo */
            color: #ffffff !important; /* Texto branco para ativo */
        }
        /* Estilo específico para o botão de Perfil */
        .top-navbar .btn-profile {
            color: #0d6efd; /* Cor do texto padrão do botão de perfil */
            background-color: transparent;
            border-color: #0d6efd; /* Cor da borda */
        }
        .top-navbar .btn-profile:hover {
            color: #ffffff; /* Cor do texto no hover */
            background-color: #0d6efd; /* Cor de fundo no hover */
            border-color: #0d6efd;
        }
        .top-navbar .btn-profile.active {
            background-color: #0d6efd;
            color: #ffffff;
        }
        .top-navbar .btn-logout { /* Estilo específico para o botão de Sair/Logout */
            margin-left: 1rem;
        }

        /* Estilos do conteúdo principal */
        .main-content-wrapper {
            padding: 40px 0; /* Espaçamento interno para o conteúdo principal */
            flex-grow: 1; /* Faz com que ocupe todo o espaço disponível verticalmente */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .card-menu {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px rgba(0,0,0,.08);
            text-decoration: none;
            color: inherit;
        }
        .card-menu:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0,0,0,.12);
        }
        .card-menu .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 150px;
        }
        .card-menu .card-title {
            font-size: 1.5rem;
            margin-top: 15px;
        }

        /* Estilos do Rodapé */
        .main-footer { /* Renomeado de .footer para .main-footer para evitar conflito */
            background-color: #343a40; /* Cor escura do Bootstrap */
            color: #f8f9fa; /* Texto cinza claro */
            padding: 1.5rem 0; /* Padding vertical */
            box-shadow: 0 -0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Sombra sutil para cima */
        }
    </style>
</head>
<body>
    <div class="d-flex flex-column min-vh-100">
        <header>
            <nav class="navbar navbar-expand-lg top-navbar">
                <div class="container-fluid">
                    <a class="navbar-brand fs-4" href="${pageContext.request.contextPath}/">Transportadora</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbarCollapse" aria-controls="mainNavbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="mainNavbarCollapse">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <%-- Lógica para o item "Home" (ativo e não clicável nesta página) --%>
                                <c:set var="isHomeActive" value="${pageContext.request.servletPath eq '/' || pageContext.request.servletPath eq '/index.jsp'}" />
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
                                <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                                    <i class="bi bi-person-check me-2"></i>Clientes
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
                                    <i class="bi bi-box-seam me-2"></i>Produtos
                                </a>
                            </li>
                            <li class="nav-item me-4"> <%-- Adicionado me-4 aqui --%>
                                <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
                                    <i class="bi bi-receipt me-2"></i>Pedidos
                                </a>
                            </li>
                            <%-- Movido para antes do Sair e estilizado como botão de perfil --%>
                            <li class="nav-item">
                                <c:set var="isFuncionariosActive" value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                                <c:choose>
                                    <c:when test="${isFuncionariosActive}">
                                        <span class="btn btn-primary btn-profile d-flex align-items-center active">
                                            <i class="bi bi-person-vcard me-2"></i>Funcionário
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/funcionarios" class="btn btn-outline-primary btn-profile d-flex align-items-center">
                                            <i class="bi bi-person-vcard me-2"></i>Funcionário
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-danger btn-logout d-flex align-items-center ms-2"> <%-- Adicionado ms-2 para espaçamento --%>
                                    <i class="bi bi-box-arrow-right me-2"></i>Sair
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main class="flex-grow-1 d-flex flex-column justify-content-center align-items-center text-center main-content-wrapper">
            <h1 class="my-5 display-5 text-dark">Bem-vindo ao Sistema GA Transportes</h1>
            <div class="container">
                <div class="row justify-content-center g-4">
                    <div class="col-md-4 col-lg-3">
                        <a href="${pageContext.request.contextPath}/clientes" class="card card-menu text-decoration-none">
                            <div class="card-body">
                                <i class="bi bi-people-fill display-4 text-primary"></i>
                                <h5 class="card-title text-dark">Clientes</h5>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <a href="${pageContext.request.contextPath}/produtos" class="card card-menu text-decoration-none">
                            <div class="card-body">
                                <i class="bi bi-box-seam-fill display-4 text-success"></i>
                                <h5 class="card-title text-dark">Produtos</h5>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <a href="${pageContext.request.contextPath}/pedidos" class="card card-menu text-decoration-none">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>