<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
    <title>Transportadora - Cadastro de Cliente</title>
    <style>
        body {
            background-color: #f0f2f5; /* Fundo cinza claro para a página */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Ocupa a altura total da viewport */
            padding: 20px; /* Adiciona um padding geral para telas menores */
        }
        .form-container-card {
            background-color: #ffffff;
            border-radius: 0.75rem;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1); /* Sombra mais pronunciada para destaque */
            padding: 2.5rem; /* Aumenta o padding interno do card */
            max-width: 600px; /* Largura máxima para o formulário */
            width: 100%; /* Garante que o formulário ocupe a largura disponível até o max-width */
        }
        .form-container-card h1 {
            color: #343a40; /* Cor do título */
            margin-bottom: 1.5rem;
            font-weight: 600; /* Deixa o título mais encorpado */
            text-align: center; /* Centraliza o título */
        }
        .btn-primary {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem; /* Espaço entre ícone e texto */
        }
    </style>
</head>

<body>
    <div class="form-container-card">
        <form action="${pageContext.request.contextPath}/cliente/save" method="POST">
            <h1 class="display-5">Cadastro de Cliente</h1>

            <input type="hidden" id="cliente_id" name="cliente_id"
                value="${cliente != null ? cliente.id : ''}">

            <div class="mb-3">
                <label for="cliente_name_id" class="form-label"><i class="bi bi-person me-2"></i>Nome Completo</label>
                <input type="text" id="cliente_name_id" name="cliente_name"
                    class="form-control" value="${cliente != null ? cliente.name : ''}" placeholder="Digite o nome do cliente" required>
            </div>

            <div class="mb-3">
                <label for="cliente_email_id" class="form-label"><i class="bi bi-envelope me-2"></i>Email</label>
                <input type="email" id="cliente_email_id" name="cliente_email"
                    class="form-control" value="${cliente != null ? cliente.email : ''}" placeholder="Digite o email do cliente">
            </div>

            <div class="mb-4"> <%-- Aumentado o mb para o último campo antes dos botões --%>
                <label for="cliente_telefone_id" class="form-label"><i class="bi bi-telephone me-2"></i>Telefone</label>
                <input type="text" id="cliente_telefone_id" name="cliente_telefone"
                    class="form-control" value="${cliente != null ? cliente.telefone : ''}" placeholder="Digite o telefone do cliente">
            </div>

            <div class="d-grid gap-2 d-md-flex justify-content-md-end"> <%-- Botões alinhados à direita e empilhados em mobile --%>
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-save me-2"></i>Salvar
                </button>
                <a href="${pageContext.request.contextPath}/clientes" class="btn btn-secondary btn-lg">
                    <i class="bi bi-x-circle me-2"></i>Cancelar
                </a>
            </div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>