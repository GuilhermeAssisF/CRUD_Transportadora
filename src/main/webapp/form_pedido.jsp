<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <title>Cadastro de Pedido</title>
</head>

<body>
    <div class="container">
        <div class="row pt-5">
            <div class="col-md-2"></div>
            <form action="${pageContext.request.contextPath}/pedido/save" method="POST" class="col-md-8">
                <h1>Cadastro de Pedido</h1>

                <input type="hidden" id="pedido_id" name="pedido_id"
                       value="${pedido != null ? pedido.id : ''}">

                <div class="mb-3">
                    <label for="cliente_id" class="form-label">Cliente</label>
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
                    <label for="produto_id" class="form-label">Produto</label>
                    <select id="produto_id" name="produto_id" class="form-select" required>
                        <option value="">Selecione um Produto</option>
                        <c:forEach var="produto" items="${produtos}">
                            <option value="${produto.id}"
                                ${pedido != null && produto.id == pedido.produtoId ? 'selected' : ''}>
                                ${produto.nome}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="quantidade" class="form-label">Quantidade</label>
                    <input type="number" id="quantidade" name="quantidade" class="form-control"
                           value="${pedido != null ? pedido.quantidade : ''}" required>
                </div>

                <button type="submit" class="btn btn-primary">Salvar</button>
                <a href="${pageContext.request.contextPath}/pedidos" class="btn btn-secondary">Voltar</a>
            </form>
            <div class="col-md-2"></div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
