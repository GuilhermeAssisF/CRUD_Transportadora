<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportadora - Produtos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Estilos globais para o layout (copiados da página de pedidos/clientes) */
        body {
            background-color: #f0f2f5; /* Light gray background for the page */
        }

        /* Estilos da Sidebar */
        .sidebar {
            background-color: #ffffff;
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            height: 100vh; /* Pega a altura total da viewport */
            position: sticky;
            top: 0;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0.75rem;
        }
        .sidebar .nav-link {
            color: #495057;
            padding: 0.75rem 1rem;
            margin-bottom: 0.5rem;
            border-radius: 0.5rem;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }
        .sidebar .nav-link:hover {
            background-color: #e9ecef;
            color: #0d6efd;
        }
        .sidebar .nav-link.active {
            font-weight: 600;
            background-color: #0d6efd !important;
            color: #ffffff !important;
            cursor: default; /* Altera o cursor para indicar que não é clicável */
        }
        .sidebar .nav-link i {
            font-size: 1.1rem;
            margin-right: 0.75rem;
        }
        .sidebar-header {
            margin-bottom: 1.5rem;
            font-size: 1.25rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
        }
        .sidebar-footer {
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid #dee2e6;
        }

        /* Ajuste do container principal para empurrar o conteúdo */
        #page-content-wrapper {
            flex-grow: 1;
        }
        #page-content-wrapper .container-fluid {
            padding-left: 1.5rem;
            padding-right: 1.5rem;
            padding-top: 1.5rem;
            padding-bottom: 1.5rem;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Estilos dos cards de produto (adaptados da página de pedidos) */
        .card-produto {
            background-color: #ffffff; /* Fundo branco, como o container da lista de pedidos */
            border-radius: 0.75rem;
            padding: 1.5rem; /* Padding interno */
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Sombra sutil */
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .card-produto:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1); /* Sombra um pouco mais forte no hover */
        }

        /* Estilos para o conteúdo dentro do card */
        .card-produto .card-title-id {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem; /* Espaço abaixo do título/ID */
        }

        .card-produto .card-title-id h5 {
            margin-bottom: 0;
            font-weight: bold;
            color: #343a40; /* Cor mais escura para o título */
        }

        .card-produto .card-title-id small {
            color: #6c757d; /* Cor mais suave para o ID */
        }

        .card-produto .card-text {
            margin-bottom: 0.75rem; /* Espaço entre os parágrafos de texto */
            color: #495057; /* Cor do texto */
        }

        .card-produto .card-text i {
            font-size: 1rem;
            margin-right: 0.5rem;
            color: #0d6efd; /* Cor azul primária para os ícones */
        }

        .card-produto .card-footer {
            padding-top: 1rem; /* Espaço acima do footer */
            border-top: 1px solid #dee2e6; /* Borda sutil */
            margin-top: 1rem; /* Margem acima da borda */
        }

        /* Small adjustments for responsiveness */
        @media (max-width: 991.98px) { /* Breakpoint para esconder a sidebar em telas menores que lg */
            .sidebar-toggle {
                display: block !important;
                margin-bottom: 1rem;
            }
            .sidebar {
                position: fixed;
                top: 0;
                left: -250px;
                width: 250px;
                height: 100vh;
                z-index: 1050;
                transition: left 0.3s ease-in-out;
                padding-top: 5rem;
                border-radius: 0;
            }
            .sidebar.show {
                left: 0;
            }
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 1040;
            }
            .overlay.show {
                display: block;
            }
            #page-content-wrapper {
                margin-left: 0 !important;
                padding: 0;
            }
            #page-content-wrapper .container-fluid {
                padding: 1rem;
                min-height: auto;
            }
            /* Em telas menores, o padding do card pode ser menor */
            .card-produto {
                padding: 1rem;
            }
        }
    </style>
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
                    <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                        <i class="bi bi-person-check"></i>
                        Clientes
                    </a>
                </li>
                <li class="nav-item">
                    <%-- Lógica para o item "Produtos" --%>
                    <c:set var="isProdutosActive" value="${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/'}" />
                    <c:choose>
                        <c:when test="${isProdutosActive}">
                            <span class="nav-link active">
                                <i class="bi bi-box-seam"></i>
                                Produtos
                            </span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/produtos" class="nav-link">
                                <i class="bi bi-box-seam"></i>
                                Produtos
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link ${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/' ? 'active' : ''}">
                        <i class="bi bi-person-vcard"></i>
                        Funcionários
                    </a>
                </li>
                <li class="nav-item">
                    <%-- Caminho para Pedidos corrigido para /pedidos --%>
                    <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
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
                            <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                                <i class="bi bi-person-check"></i>
                                Clientes
                            </a>
                        </li>
                        <li class="nav-item">
                            <%-- Lógica para o item "Produtos" no mobile --%>
                            <c:set var="isProdutosActiveMobile" value="${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/'}" />
                            <c:choose>
                                <c:when test="${isProdutosActiveMobile}">
                                    <span class="nav-link active">
                                        <i class="bi bi-box-seam"></i>
                                        Produtos
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/produtos" class="nav-link">
                                        <i class="bi bi-box-seam"></i>
                                        Produtos
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link ${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/' ? 'active' : ''}">
                                <i class="bi bi-person-vcard"></i>
                                Funcionários
                            </a>
                        </li>
                        <li class="nav-item">
                            <%-- Caminho para Pedidos corrigido para /pedidos no mobile --%>
                            <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
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
                </div>
            </div>

            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 class="fw-bold mb-0">Lista de Produtos</h2>
                        <p class="text-muted mb-0">Visualize e gerencie todos os produtos disponíveis.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/produto/update" class="btn btn-primary d-flex align-items-center">
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
                                <div class="card-body p-0"> <%-- Removido padding do card-body para controlar melhor o espaçamento --%>
                                    <p class="card-text">
                                        <i class="bi bi-file-text-fill"></i> ${produto.descricao}
                                    </p>
                                    <p class="card-text">
                                        <i class="bi bi-cash-coin"></i> R$ ${produto.preco}
                                    </p>
                                </div>
                                <div class="card-footer d-flex justify-content-end gap-2 bg-transparent border-0"> <%-- Ajuste para remover borda e background do footer --%>
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
                        <div class="col-12"> <%-- Manter col-12 para ocupar a largura total --%>
                            <div class="order-list-container text-center text-muted py-3 px-3">
                                Nenhum produto cadastrado ainda. <a href="${pageContext.request.contextPath}/produto/update" class="alert-link">Cadastre um novo produto!</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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