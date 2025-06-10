<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Transportadora - Clientes</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/clientes.css">
    </head>

    <body>
        <div class="d-flex" id="wrapper">
            <nav class="sidebar d-flex flex-column p-3 d-none d-lg-block">
                <div class="sidebar-header">
                    Transportadora
                </div>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/"
                            class="nav-link ${pageContext.request.servletPath eq '/' ? 'active' : ''}"
                            aria-current="page">
                            <i class="bi bi-house-door"></i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <c:set var="isClientesActive"
                            value="${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/'}" />
                        <c:choose>
                            <c:when test="${isClientesActive}">
                                <span class="nav-link active">
                                    <i class="bi bi-person-check"></i>
                                    Clientes
                                </span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/clientes" class="nav-link">
                                    <i class="bi bi-person-check"></i>
                                    Clientes
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/produtos"
                            class="nav-link ${pageContext.request.servletPath eq '/produtos' ? 'active' : ''}">
                            <i class="bi bi-box-seam"></i>
                            Produtos
                        </a>
                    </li>
                    <li class="nav-item me-4"> <%-- Adicionado me-4 para espaçamento --%>
                            <a href="${pageContext.request.contextPath}/pedidos"
                                class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
                                <i class="bi bi-receipt"></i>
                                Pedidos
                            </a>
                    </li>
                </ul>
                <div class="mt-auto sidebar-footer">
                    <%-- Botão Funcionários (personalizado como link de navegação com badge) --%>
                        <c:set var="isFuncionariosActive"
                            value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                        <c:choose>
                            <c:when test="${isFuncionariosActive}">
                                <span class="funcionarios-badge-link active w-100 mb-2">
                                    <i class="bi bi-person-vcard"></i>Funcionários
                                </span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/funcionarios"
                                    class="funcionarios-badge-link w-100 mb-2">
                                    <i class="bi bi-person-vcard"></i>Funcionários
                                </a>
                            </c:otherwise>
                        </c:choose>
                        <a href="${pageContext.request.contextPath}/login" class="nav-link text-danger">
                            <i class="bi bi-box-arrow-right"></i>
                            Sair
                        </a>
                </div>
            </nav>

            <div id="page-content-wrapper" class="flex-grow-1">
                <nav class="navbar navbar-light bg-light rounded d-lg-none mb-3 mx-3 mt-3">
                    <div class="container-fluid">
                        <button class="btn btn-outline-secondary sidebar-toggle" type="button"
                            data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
                            aria-controls="offcanvasSidebar">
                            <i class="bi bi-list"></i>
                        </button>
                        <span class="navbar-brand mb-0 h1 ms-2">Transportadora</span>
                    </div>
                </nav>

                <div class="offcanvas offcanvas-start bg-white" tabindex="-1" id="offcanvasSidebar"
                    aria-labelledby="offcanvasSidebarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasSidebarLabel">Menu</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="nav nav-pills flex-column mb-auto">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/"
                                    class="nav-link ${pageContext.request.servletPath eq '/' ? 'active' : ''}"
                                    aria-current="page">
                                    <i class="bi bi-house-door"></i>
                                    Home
                                </a>
                            </li>
                            <li class="nav-item">
                                <c:set var="isClientesActiveMobile"
                                    value="${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/'}" />
                                <c:choose>
                                    <c:when test="${isClientesActiveMobile}">
                                        <span class="nav-link active">
                                            <i class="bi bi-person-check"></i>
                                            Clientes
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/clientes" class="nav-link">
                                            <i class="bi bi-person-check"></i>
                                            Clientes
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/produtos"
                                    class="nav-link ${pageContext.request.servletPath eq '/produtos' ? 'active' : ''}">
                                    <i class="bi bi-box-seam"></i>
                                    Produtos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/pedidos"
                                    class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
                                    <i class="bi bi-receipt"></i>
                                    Pedidos
                                </a>
                            </li>
                        </ul>
                        <div class="mt-auto sidebar-footer">
                            <%-- Botão Funcionários no Mobile --%>
                                <c:set var="isFuncionariosActiveMobile"
                                    value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                                <c:choose>
                                    <c:when test="${isFuncionariosActiveMobile}">
                                        <span class="funcionarios-badge-link active w-100 mb-2">
                                            <i class="bi bi-person-vcard"></i>Funcionários
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/funcionarios"
                                            class="funcionarios-badge-link w-100 mb-2">
                                            <i class="bi bi-person-vcard"></i>Funcionários
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/login" class="nav-link text-danger">
                                    <i class="bi bi-box-arrow-right"></i>
                                    Sair
                                </a>
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="fw-bold mb-0">Lista de Clientes</h2>
                            <p class="text-muted mb-0">Visualize e gerencie todos os clientes cadastrados.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/cliente/update"
                            class="btn btn-primary d-flex align-items-center">
                            <i class="bi bi-plus-circle me-2"></i> Novo Cliente
                        </a>
                    </div>

                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                        <c:forEach var="cliente" items="${clientes}">
                            <div class="col">
                                <div class="card h-100 card-cliente">
                                    <div class="card-title-id">
                                        <h5 class="text-truncate">${cliente.name}</h5>
                                        <small>ID: ${cliente.id}</small>
                                    </div>
                                    <div class="card-body p-0"> <%-- Removido padding do card-body para controlar melhor
                                            o espaçamento --%>
                                            <p class="card-text">
                                                <i class="bi bi-envelope-fill text-primary"></i> ${cliente.email}
                                            </p>
                                            <p class="card-text">
                                                <i class="bi bi-telephone-fill text-primary"></i> ${cliente.telefone}
                                            </p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-end gap-2 bg-transparent border-0">
                                        <%-- Ajuste para remover borda e background do footer --%>
                                            <a class="btn btn-sm btn-outline-primary"
                                                href="${pageContext.request.contextPath}/cliente/update?clienteId=${cliente.id}"
                                                title="Editar Cliente">
                                                <i class="bi bi-pencil-square me-1"></i> Editar
                                            </a>
                                            <a class="btn btn-sm btn-outline-danger"
                                                href="${pageContext.request.contextPath}/cliente/delete?clienteId=${cliente.id}"
                                                onclick="return confirm('Deseja realmente excluir este cliente?');"
                                                title="Remover Cliente">
                                                <i class="bi bi-trash me-1"></i> Remover
                                            </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty clientes}">
                            <div class="col-12"> <%-- Manter col-12 para ocupar a largura total --%>
                                    <div class="empty-state-message text-center text-muted py-3 px-3">
                                        Nenhum cliente cadastrado ainda. <a
                                            href="${pageContext.request.contextPath}/cliente/update"
                                            class="alert-link">Cadastre um novo cliente!</a>
                                    </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>


        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>