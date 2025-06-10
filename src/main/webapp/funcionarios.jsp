<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportadora - Funcionários</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* Estilos globais para o layout */
        body {
            background-color: #f0f2f5; /* Light gray background for the page */
        }

        /* Estilos da Sidebar (copiados das páginas anteriores) */
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
        /* Estilo para o botão de Funcionários (com background menor, badge-like) */
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

        /* Estilos dos cards de funcionário (adaptados das páginas de produtos/clientes) */
        .card-funcionario {
            background-color: #ffffff; /* Fundo branco, como o container da lista de pedidos */
            border-radius: 0.75rem;
            padding: 1.5rem; /* Padding interno */
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075); /* Sombra sutil */
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .card-funcionario:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1); /* Sombra um pouco mais forte no hover */
        }
        /* Estilos para o conteúdo dentro do card */
        .card-funcionario .card-title-id {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem; /* Espaço abaixo do título/ID */
        }
        .card-funcionario .card-title-id h5 {
            margin-bottom: 0;
            font-weight: bold;
            color: #343a40; /* Cor mais escura para o título */
        }
        .card-funcionario .card-title-id small {
            color: #6c757d; /* Cor mais suave para o ID */
        }
        .card-funcionario .card-text {
            margin-bottom: 0.75rem; /* Espaço entre os parágrafos de texto */
            color: #495057; /* Cor do texto */
        }
        .card-funcionario .card-text i {
            font-size: 1rem;
            margin-right: 0.5rem;
            color: #0d6efd; /* Cor azul primária para os ícones */
        }
        .card-funcionario .card-footer {
            padding-top: 1rem; /* Espaço acima do footer */
            border-top: 1px solid #dee2e6; /* Borda sutil */
            margin-top: 1rem; /* Margem acima da borda */
        }

        /* Estilo para a mensagem de nenhum funcionário encontrado (reutilizado do pedido/cliente) */
        .empty-state-message {
            background-color: #ffffff; /* Fundo branco para a caixa de mensagem */
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
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
            .card-funcionario {
                padding: 1rem;
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
                    <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                        <i class="bi bi-person-check"></i>
                        Clientes
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
                        <i class="bi bi-box-seam"></i>
                        Produtos
                    </a>
                </li>
                <li class="nav-item me-4"> <%-- Adicionado me-4 para espaçamento antes do botão Funcionários --%>
                    <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
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
                            <a href="${pageContext.request.contextPath}/clientes" class="nav-link ${pageContext.request.servletPath eq '/clientes' || pageContext.request.servletPath eq '/clientes/' ? 'active' : ''}">
                                <i class="bi bi-person-check"></i>
                                Clientes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
                                <i class="bi bi-box-seam"></i>
                                Produtos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/pedidos" class="nav-link ${pageContext.request.servletPath eq '/pedidos' || pageContext.request.servletPath eq '/pedidos/' ? 'active' : ''}">
                                <i class="bi bi-receipt"></i>
                                Pedidos
                            </a>
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
                        <h2 class="fw-bold mb-0">Lista de Funcionários</h2>
                        <p class="text-muted mb-0">Gerencie todos os funcionários da transportadora.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/funcionario/update" class="btn btn-primary d-flex align-items-center">
                        <i class="bi bi-plus-circle me-2"></i> Novo Funcionário
                    </a>
                </div>

                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="funcionario" items="${funcionarios}">
                        <div class="col">
                            <div class="card h-100 card-funcionario">
                                <div class="card-title-id">
                                    <h5 class="text-truncate">${funcionario.name}</h5>
                                    <small>ID: ${funcionario.id}</small>
                                </div>
                                <div class="card-body p-0">
                                    <p class="card-text">
                                        <i class="bi bi-gender-ambiguous text-primary"></i> Sexo: ${funcionario.gender}
                                    </p>
                                    <p class="card-text">
                                        <i class="bi bi-envelope-fill text-primary"></i> Email: ${funcionario.email}
                                    </p>
                                </div>
                                <div class="card-footer d-flex justify-content-end gap-2 bg-transparent border-0">
                                    <a class="btn btn-sm btn-outline-primary"
                                        href="${pageContext.request.contextPath}/funcionario/update?funcionarioId=${funcionario.id}"
                                        title="Editar Funcionário">
                                        <i class="bi bi-pencil-square me-1"></i> Editar
                                    </a>
                                    <a class="btn btn-sm btn-outline-danger"
                                        href="${pageContext.request.contextPath}/funcionario/delete?funcionarioId=${funcionario.id}"
                                        onclick="return confirm('Deseja realmente excluir este funcionário?');"
                                        title="Remover Funcionário">
                                        <i class="bi bi-trash me-1"></i> Remover
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty funcionarios}">
                        <div class="col-12">
                            <div class="empty-state-message text-center text-muted py-3 px-3">
                                Nenhum funcionário cadastrado ainda. <a href="${pageContext.request.contextPath}/funcionario/update" class="alert-link">Cadastre um novo funcionário!</a>
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