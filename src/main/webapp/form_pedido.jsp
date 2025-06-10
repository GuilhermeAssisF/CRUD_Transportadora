<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
    <title>Transportadora - Cadastro de Pedido</title>
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
        /* Ajuste para o input de data para garantir alinhamento */
        input[type="date"] {
            padding-right: calc(1.5em + 0.75rem); /* Espaço para o ícone de calendário nativo */
        }
    </style>
</head>

<body>
    <div class="form-container-card">
        <form action="${pageContext.request.contextPath}/pedido/save" method="POST">
            <h1 class="display-5">Cadastro de Pedido</h1>

            <input type="hidden" id="pedido_id" name="pedido_id"
                   value="${pedido != null ? pedido.id : ''}">

            <div class="mb-3">
                <label for="cliente_id" class="form-label"><i class="bi bi-person me-2"></i>Cliente</label>
                <select id="cliente_id" name="cliente_id" class="form-select" required>
                    <option value="">Selecione um Cliente</option>
                    <c:forEach var="cliente" items="${clientes}">
                        <option value="${cliente.id}"
                            ${pedido != null && cliente.id == pedido.clienteId ? 'selected' : ''}>
                            ${cliente.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="produto_id" class="form-label"><i class="bi bi-box-seam me-2"></i>Produto</label>
                <select id="produto_id" name="produto_id" class="form-select" required>
                    <option value="">Selecione um Produto</option>
                    <c:forEach var="produtoItem" items="${produtos}"> <%-- Renomeado para produtoItem para evitar conflito de var 'produto' no select --%>
                        <option value="${produtoItem.id}"
                            ${pedido != null && produtoItem.id == pedido.produtoId ? 'selected' : ''}>
                            ${produtoItem.nome}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="quantidade" class="form-label"><i class="bi bi-hash me-2"></i>Quantidade</label>
                <input type="number" id="quantidade" name="quantidade" class="form-control"
                       value="${pedido != null ? pedido.quantidade : ''}" min="1" placeholder="Ex: 1" required>
            </div>

            <div class="mb-4"> <%-- Aumentado o mb para o último campo antes dos botões --%>
                <label for="data_pedido" class="form-label"><i class="bi bi-calendar-date me-2"></i>Data do Pedido</label>
                <%-- Assumindo que seu objeto 'pedido' tem uma propriedade 'dataPedido' do tipo Date/LocalDate/LocalDateTime --%>
                <input type="date" class="form-control" id="data_pedido" name="data_pedido"
                       value="<fmt:formatDate value='${pedido.dataPedido}' pattern='yyyy-MM-dd' />" required />
            </div>

            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-primary btn-lg">
                    <i class="bi bi-save me-2"></i>Salvar Pedido
                </button>
                <a href="${pageContext.request.contextPath}/pedidos" class="btn btn-secondary btn-lg">
                    <i class="bi bi-x-circle me-2"></i>Cancelar
                </a>
            </div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>