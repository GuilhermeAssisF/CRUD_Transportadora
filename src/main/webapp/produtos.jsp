<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Transportadora - Produtos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/produtos.css">
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
                        <a href="${pageContext.request.contextPath}/clientes"
                            class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                            <i class="bi bi-person-check"></i>
                            Clientes
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/produtos"
                            class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
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
                <div class="container-fluid">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="fw-bold mb-0">Lista de Produtos</h2>
                            <p class="text-muted mb-0">Visualize e gerencie todos os produtos disponíveis.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/produto/update"
                            class="btn btn-primary d-flex align-items-center">
                            <i class="bi bi-plus-circle me-2"></i> Novo Produto
                        </a>
                    </div>

                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                        <c:forEach var="produto" items="${produtos}">
                            <div class="col">
                                <div class="card h-100 card-produto">
                                    <div class="card-title-id">
                                        <h5 class="text-truncate">${produto.nome}</h5>
                                        <small>ID: ${produto.id}</small>
                                    </div>
                                    <div class="card-body p-0">
                                        <p class="card-text">
                                            <i class="bi bi-file-text-fill text-primary"></i> ${produto.descricao}
                                        </p>
                                        <p class="card-text">
                                            <i class="bi bi-cash-coin text-primary"></i> R$ ${produto.preco}
                                        </p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-end gap-2 bg-transparent border-0">
                                        <a class="btn btn-sm btn-outline-primary"
                                            href="${pageContext.request.contextPath}/produto/update?produtoId=${produto.id}"
                                            title="Editar Produto">
                                            <i class="bi bi-pencil-square me-1"></i> Editar
                                        </a>
                                        <a class="btn btn-sm btn-outline-danger"
                                            href="${pageContext.request.contextPath}/produto/delete?produtoId=${produto.id}"
                                            onclick="return confirm('Deseja realmente excluir este produto?');"
                                            title="Remover Produto">
                                            <i class="bi bi-trash me-1"></i> Remover
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty produtos}">
                            <div class="col-12">
                                <div class="empty-state-message text-center text-muted py-3 px-3">
                                    Nenhum produto cadastrado ainda. <a
                                        href="${pageContext.request.contextPath}/produto/update"
                                        class="alert-link">Cadastre um novo produto!</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

    </html>