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

        /* Estilos customizados para os cards de funcionário (do seu código original) */
        .card-funcionario {
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px rgba(0,0,0,.08);
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .card-funcionario:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0,0,0,.12);
        }
        .card-header-funcionario {
            background-color: #6f42c1; /* Cor roxa para cabeçalho de funcionário (exemplo) */
            color: white;
            border-top-left-radius: 0.75rem;
            border-top-right-radius: 0.75rem;
            padding: 1rem;
        }
        .card-body p {
            margin-bottom: 0.5rem;
        }
        .card-body p:last-child {
            margin-bottom: 0;
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
                <li class="nav-item">
                    <%-- Lógica para o item "Funcionários" --%>
                    <c:set var="isFuncionariosActive" value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                    <c:choose>
                        <c:when test="${isFuncionariosActive}">
                            <span class="nav-link active">
                                <i class="bi bi-person-vcard"></i>
                                Funcionários
                            </span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link">
                                <i class="bi bi-person-vcard"></i>
                                Funcionários
                            </a>
                        </c:otherwise>
                    </c:choose>
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
                            <a href="${pageContext.request.contextPath}/produtos" class="nav-link ${pageContext.request.servletPath eq '/produtos' || pageContext.request.servletPath eq '/produtos/' ? 'active' : ''}">
                                <i class="bi bi-box-seam"></i>
                                Produtos
                            </a>
                        </li>
                        <li class="nav-item">
                            <%-- Lógica para o item "Funcionários" no mobile --%>
                            <c:set var="isFuncionariosActiveMobile" value="${pageContext.request.servletPath eq '/funcionarios' || pageContext.request.servletPath eq '/funcionarios/'}" />
                            <c:choose>
                                <c:when test="${isFuncionariosActiveMobile}">
                                    <span class="nav-link active">
                                        <i class="bi bi-person-vcard"></i>
                                        Funcionários
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/funcionarios" class="nav-link">
                                        <i class="bi bi-person-vcard"></i>
                                        Funcionários
                                    </a>
                                </c:otherwise>
                            </c:choose>
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
                        <h1 class="m-0 display-4">Funcionários</h1>
                    </div>
                    <a href="${pageContext.request.contextPath}/funcionario/update" class="btn btn-primary d-flex align-items-center">
                        <i class="bi bi-person-plus-fill me-2"></i> Novo Funcionário
                    </a>
                </div>

                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="funcionario" items="${funcionarios}">
                        <div class="col">
                            <div class="card h-100 card-funcionario">
                                <div class="card-header card-header-funcionario d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0 text-truncate">${funcionario.name}</h5>
                                    <small class="text-white-50">ID: ${funcionario.id}</small>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">
                                        <i class="bi bi-gender-ambiguous me-2 text-muted"></i> Sexo: ${funcionario.gender}
                                    </p>
                                    <p class="card-text">
                                        <i class="bi bi-envelope-fill me-2 text-info"></i> Email: ${funcionario.email}
                                    </p>
                                </div>
                                <div class="card-footer d-flex justify-content-end gap-2 bg-transparent border-top-0 pt-0 pb-3 pe-3">
                                    <a class="btn btn-sm btn-outline-primary"
                                        href="${pageContext.request.contextPath}/funcionario/update?funcionarioId=${funcionario.id}"
                                        title="Editar Funcionário">
                                        <i class="bi bi-pencil-square"></i> Editar
                                    </a>
                                    <a class="btn btn-sm btn-outline-danger"
                                        href="${pageContext.request.contextPath}/funcionario/delete?funcionarioId=${funcionario.id}"
                                        onclick="return confirm('Deseja realmente excluir este funcionário?');"
                                        title="Remover Funcionário">
                                        <i class="bi bi-trash"></i> Remover
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty funcionarios}">
                        <div class="col-12 text-center py-5">
                            <div class="alert alert-info" role="alert">
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