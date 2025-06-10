<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
    <link rel="stylesheet" href="css/pedidos.css">
    <title>Transportadora - Pedidos</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <nav class="sidebar d-flex flex-column p-3 d-none d-lg-block">
            <div class="sidebar-header">
                Transportadora
            </div>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/" class="nav-link ${pageContext.request.servletPath eq '/' ? 'active' : ''}" aria-current="page">
                        <i class="bi bi-house-door"></i>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' ? 'active' : ''}">
                        <i class="bi bi-person-check"></i>
                        Clientes
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' ? 'active' : ''}">
                        <i class="bi bi-box-seam"></i>
                        Produtos
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link ${pageContext.request.servletPath eq '/funcionarios' ? 'active' : ''}">
                        <i class="bi bi-person-vcard"></i>
                        Funcionários
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pedidos" class="nav-link">
                         <i class="bi bi-receipt"></i>
                         Pedidos
                    </a>
                </li>
            </ul>
            <div class="mt-auto sidebar-footer">
                <a href="${pageContext.request.contextPath}/login" class="nav-link text-danger">
                    <i class="bi bi-box-arrow-right"></i>
                    Sair
                </a>
            </div>
        </nav>

        <div id="page-content-wrapper" class="flex-grow-1">
            <nav class="navbar navbar-light bg-light rounded d-lg-none mb-3 mx-3 mt-3">
                <div class="container-fluid">
                    <button class="btn btn-outline-secondary sidebar-toggle" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                        <i class="bi bi-list"></i>
                    </button>
                    <span class="navbar-brand mb-0 h1 ms-2">Transportadora</span>
                </div>
            </nav>

            <div class="offcanvas offcanvas-start bg-white" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasSidebarLabel">Menu</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/" class="nav-link ${pageContext.request.servletPath eq '/' ? 'active' : ''}" aria-current="page">
                                <i class="bi bi-house-door"></i>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' ? 'active' : ''}">
                                <i class="bi bi-person-check"></i>
                                Clientes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' ? 'active' : ''}">
                                <i class="bi bi-box-seam"></i>
                                Produtos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link ${pageContext.request.servletPath eq '/funcionarios' ? 'active' : ''}">
                                <i class="bi bi-person-vcard"></i>
                                Funcionários
                            </a>
                        </li>
                        <li class="nav-item">
                            <%-- Verifica se a página atual é /pedido/list ou /pedido/list/ --%>
                            <c:set var="isPedidosActiveMobile" value="${pageContext.request.servletPath eq '/pedido/list' || pageContext.request.servletPath eq '/pedido/list/'}" />
                            <c:choose>
                                <c:when test="${isPedidosActiveMobile}">
                                    <%-- Se for a página de pedidos, usar um span ou div com a classe active e desabilitar o clique --%>
                                    <span class="nav-link active">
                                        <i class="bi bi-receipt"></i>
                                        Pedidos
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <%-- Caso contrário, é um link normal --%>
                                    <a href="${pageContext.request.contextPath}/pedido/list" class="nav-link">
                                        <i class="bi bi-receipt"></i>
                                        Pedidos
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                    <div class="mt-auto sidebar-footer">
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
                        <h2 class="fw-bold mb-0">Lista de Pedidos</h2>
                        <p class="text-muted mb-0">Visualize e gerencie todas as transações com detalhes de pagamento e cliente.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/pedido/update" class="btn btn-primary d-flex align-items-center">
                        <i class="bi bi-plus-circle me-2"></i>
                        Novo Pedido
                    </a>
                </div>

                <div class="order-list-container">
                    <div class="row order-header d-none d-md-flex mx-0">
                        <div class="col col-ped-id text-start">Id</div>
                        <div class="col col-ped-cliente text-start">Cliente</div>
                        <div class="col col-ped-produto text-start">Produto</div>
                        <div class="col col-ped-qty text-start">Qtd</div>
                        <div class="col col-ped-preco-unit text-start">Preço Unitário</div>
                        <div class="col col-ped-total text-start">Total Pedido</div>
                        <div class="col col-ped-data text-start">Data Pedido</div>
                        <div class="col col-ped-actions text-end">Ações</div>
                    </div>

                    <ul class="list-unstyled mb-0">
                        <c:choose>
                            <c:when test="${not empty pedidos}">
                                <c:forEach var="pedido" items="${pedidos}" varStatus="loop">
                                    <li class="order-row">
                                        <div class="col col-ped-id text-truncate text-start">#${pedido.id}</div>
                                        <div class="col col-ped-cliente text-truncate text-start">${pedido.clienteNome}</div>
                                        <div class="col col-ped-produto text-truncate text-start">${pedido.produtoNome}</div>
                                        <div class="col col-ped-qty text-start">${pedido.quantidade}</div>
                                        <div class="col col-ped-preco-unit text-start">
                                            <fmt:formatNumber value="${pedido.produto.preco}" type="currency" currencySymbol="R$ " />
                                        </div>
                                        <div class="col col-ped-total fw-bold text-start">
                                            <fmt:formatNumber value="${pedido.quantidade * pedido.produto.preco}" type="currency" currencySymbol="R$ " />
                                        </div>
                                        <div class="col col-ped-data text-start">
                                            <fmt:formatDate value="${pedido.dataPedido}" pattern="MMM dd,yyyy" />
                                        </div>
                                        <div class="col col-ped-actions">
                                            <div class="dropdown">
                                                <button class="btn btn-sm p-0 text-muted" type="button" id="dropdownMenuButton${loop.index}" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="bi bi-three-dots-vertical"></i>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton${loop.index}">
                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pedido/update?pedidoId=${pedido.id}"><i class="bi bi-pencil me-2"></i>Editar</a></li>
                                                    <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/pedido/delete?pedidoId=${pedido.id}" onclick="return confirm('Deseja realmente excluir este pedido?');"><i class="bi bi-trash me-2"></i>Remover</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <li class="order-row text-center text-muted py-3 px-3">Nenhum pedido encontrado.</li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script>
        // Script para a sidebar offcanvas em telas menores
        document.addEventListener('DOMContentLoaded', function() {
            var offcanvas = document.getElementById('offcanvasSidebar');
            if (offcanvas) {
                offcanvas.addEventListener('show.bs.offcanvas', function () {
                    document.body.classList.add('overflow-hidden');
                });
                offcanvas.addEventListener('hide.bs.offcanvas', function () {
                    document.body.classList.remove('overflow-hidden');
                });
            }
        });
    </script>
</body>
</html>