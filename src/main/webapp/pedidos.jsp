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
    <style>
        /* Estilos globais do Body (copiados das outras páginas) */
        body {
            background-color: #f0f2f5; /* Fundo cinza claro consistente */
        }
        /* Estilos da Sidebar (copiados das outras páginas) */
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
        /* Estilo para o botão de Funcionários (com background menor) */
        .funcionarios-badge-link {
            display: inline-flex; /* Para que o background se ajuste ao conteúdo */
            padding: 0.25rem 0.75rem; /* Padding interno menor */
            border-radius: 50rem; /* Borda bem arredondada para o efeito "pill" */
            background-color: #0d6efd; /* Cor azul primária */
            color: #ffffff; /* Texto branco */
            font-weight: 600; /* Texto em negrito */
            transition: all 0.2s ease-in-out;
            align-items: center; /* Centraliza o ícone e texto verticalmente */
            justify-content: center; /* Centraliza o ícone e texto horizontalmente */
            text-decoration: none; /* Remove sublinhado */
            /* margin-left: 0.5rem; Removido para ser controlado pela classe w-100 */
        }
        .funcionarios-badge-link:hover {
            background-color: #0a58ca; /* Tom mais escuro no hover */
            color: #ffffff;
            transform: scale(1.02); /* Pequeno zoom no hover */
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.1); /* Sombra sutil no hover */
        }
        .funcionarios-badge-link.active {
            background-color: #0a58ca; /* Mantém a cor mais escura quando ativo */
            color: #ffffff;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.1);
        }
        .funcionarios-badge-link i {
            font-size: 1.1rem; /* Tamanho do ícone */
            margin-right: 0.5rem; /* Espaçamento entre ícone e texto */
            color: #ffffff; /* Cor do ícone branco */
        }
        /* Ajuste para links no sidebar-footer e offcanvas-body para não pegarem estilo de botão */
        .sidebar-footer .nav-link,
        .offcanvas-body .nav-link {
            padding: 0.75rem 1rem; /* Resetar padding do nav-link */
            margin-bottom: 0.5rem; /* Espaçamento entre eles */
        }
        .sidebar-footer .nav-link:hover,
        .offcanvas-body .nav-link:hover {
            background-color: #e9ecef;
            color: #0d6efd;
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

        /* Estilos da lista de pedidos (reutilizados para produtos) */
        .order-list-container {
            background-color: #ffffff; /* White background for the main list area */
            border-radius: 0.75rem; /* Rounded corners for the entire list block */
            padding: 1.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Subtle shadow */
        }
        .order-row {
            background-color: #f8f9fa; /* Light gray background for each row */
            border-radius: 0.5rem;
            margin-bottom: 0.75rem; /* Space between rows */
            display: flex; /* Mantém flexbox */
            align-items: center;
            border: 1px solid #e9ecef; /* Very subtle border for separation */
        }
        .order-row:last-child {
            margin-bottom: 0; /* No margin for the last row */
        }
        .order-header {
            font-weight: 500;
            color: #6c757d; /* Muted color for headers */
            text-transform: uppercase;
            font-size: 0.85rem;
            padding-bottom: 0.5rem;
            margin-bottom: 0.5rem;
            border-bottom: 1px solid #dee2e6; /* Separator for headers */
        }
        .order-header .col, .order-header .col-auto, .order-header [class*="col-ped-"] {
            padding-left: 0.75rem; /* px-3 no cabeçalho (0.75rem) */
            padding-right: 0.75rem; /* px-3 no cabeçalho (0.75rem) */
            white-space: nowrap; /* Prevent headers from wrapping too early */
        }

        /* Custom styles for columns to match width distribution */
        .col-ped-id { flex: 0 0 9%; max-width: 9%; }
        .col-ped-cliente { flex: 0 0 17%; max-width: 17%; }
        .col-ped-produto { flex: 0 0 24%; max-width: 24%; }
        .col-ped-qty { flex: 0 0 8%; max-width: 8%; }
        .col-ped-preco-unit { flex: 0 0 12%; max-width: 12%; }
        .col-ped-total { flex: 0 0 12%; max-width: 12%; }
        .col-ped-data { flex: 0 0 13%; max-width: 13%; }
        .col-ped-actions { flex: 0 0 50px; max-width: 50px; display: flex; justify-content: flex-end; align-items: center; }

        /* Aplica padding horizontal às colunas dentro das linhas de pedido */
        .order-row > div {
            padding-top: 0.75rem; /* py-3 (0.75rem) */
            padding-bottom: 0.75rem; /* py-3 (0.75rem) */
            padding-left: 0.75rem; /* px-3 (0.75rem) */
            padding-right: 0.75rem; /* px-3 (0.75rem) */
        }

        /* Small adjustments for responsiveness on smaller screens */
        @media (max-width: 991.98px) { /* Breakpoint para esconder a sidebar em telas menores que lg */
            .sidebar-toggle {
                display: block !important; /* Mostra o botão do menu hamburger */
                margin-bottom: 1rem;
            }
            .sidebar {
                position: fixed;
                top: 0;
                left: -250px; /* Esconde a sidebar fora da tela */
                width: 250px;
                height: 100vh; /* Mantém 100% da altura para mobile também */
                z-index: 1050;
                transition: left 0.3s ease-in-out;
                padding-top: 5rem;
                border-radius: 0; /* Remove todos os arredondamentos para mobile */
            }
            .sidebar.show {
                left: 0; /* Mostra a sidebar */
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
                margin-left: 0 !important; /* Remove margem do conteúdo principal em mobile */
                padding: 0; /* Remover padding geral para mobile */
            }
            #page-content-wrapper .container-fluid {
                padding: 1rem; /* Padding uniforme para o conteúdo principal em mobile */
                min-height: auto; /* Remover min-height em mobile */
            }
            .order-list-container {
                padding: 1rem;
            }
            .order-row {
                flex-wrap: wrap;
                padding: 0;
            }
            .order-header {
                display: none;
            }
            .order-row > div {
                flex: 0 0 auto;
                width: 50%;
                margin-bottom: 0.25rem;
                padding: 0.5rem 0.75rem;
            }
            .order-row .col-ped-id,
            .order-row .col-ped-qty {
                width: 33%;
            }
            .order-row .col-ped-actions {
                width: auto;
                margin-left: auto;
                justify-content: flex-end;
            }
            .order-row .col-ped-total {
                width: 100%;
                text-align: right;
            }
            /* Estilo para o botão de Funcionários no offcanvas */
            .offcanvas-body .funcionarios-badge-link {
                background-color: #0d6efd;
                color: #ffffff;
                width: 100%; /* Ocupa a largura total no offcanvas */
                margin-bottom: 0.5rem; /* Espaçamento abaixo */
            }
            .offcanvas-body .funcionarios-badge-link:hover {
                background-color: #0a58ca;
            }
            .offcanvas-body .funcionarios-badge-link.active {
                background-color: #0a58ca;
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
                <li class="nav-item me-4"> <%-- Adicionado me-4 aqui --%>
                    <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' || pageContext.request.servletPath eq '/pedido/list' || pageContext.request.servletPath eq '/pedido/list/' ? 'active' : ''}">
                        <i class="bi bi-receipt"></i>
                        Pedidos
                    </a>
                </li>
            </ul>
            <div class="mt-auto sidebar-footer">
                <%-- Botão Funcionários (personalizado como link de navegação com badge) --%>
                <c:set var="isFuncionariosActive" value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                <c:choose>
                    <c:when test="${isFuncionariosActive}">
                        <span class="funcionarios-badge-link active w-100 mb-2">
                            <i class="bi bi-person-vcard"></i>Funcionários
                        </span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/funcionarios" class="funcionarios-badge-link w-100 mb-2">
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
                            <%-- Verifica se a página atual é /pedido/list ou /pedido/list/ --%>
                            <c:set var="isPedidosActiveMobile" value="${pageContext.request.servletPath eq '/pedido/list' || pageContext.request.servletPath eq '/pedido/list/' || pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/'}" />
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
                                    <a href="${pageContext.request.contextPath}/pedidos" class="nav-link">
                                        <i class="bi bi-receipt"></i>
                                        Pedidos
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                    <div class="mt-auto sidebar-footer">
                        <%-- Botão Funcionários no Mobile --%>
                        <c:set var="isFuncionariosActiveMobile" value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                        <c:choose>
                            <c:when test="${isFuncionariosActiveMobile}">
                                <span class="funcionarios-badge-link active w-100 mb-2">
                                    <i class="bi bi-person-vcard"></i>Funcionários
                                </span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/funcionarios" class="funcionarios-badge-link w-100 mb-2">
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