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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_pedido.css">
            <title>Transportadora - Cadastro de Pedido</title>
        </head>

        <body>
            <div class="form-container-card">
                <form action="${pageContext.request.contextPath}/pedido/save" method="POST">
                    <h1 class="display-5">Cadastro de Pedido</h1>

                    <input type="hidden" id="pedido_id" name="pedido_id" value="${pedido != null ? pedido.id : ''}">

                    <div class="mb-3">
                        <label for="cliente_id" class="form-label"><i class="bi bi-person me-2"></i>Cliente</label>
                        <select id="cliente_id" name="cliente_id" class="form-select" required>
                            <option value="">Selecione um Cliente</option>
                            <c:forEach var="cliente" items="${clientes}">
                                <option value="${cliente.id}" ${pedido !=null && cliente.id==pedido.clienteId
                                    ? 'selected' : '' }>
                                    ${cliente.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="produto_id" class="form-label"><i class="bi bi-box-seam me-2"></i>Produto</label>
                        <select id="produto_id" name="produto_id" class="form-select" required>
                            <option value="">Selecione um Produto</option>
                            <c:forEach var="produtoItem" items="${produtos}">
                                    <option value="${produtoItem.id}" ${pedido !=null &&
                                        produtoItem.id==pedido.produtoId ? 'selected' : '' }>
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

                    <div class="mb-4">
                            <label for="data_pedido" class="form-label"><i class="bi bi-calendar-date me-2"></i>Data do
                                Pedido</label>
                                <input type="date" class="form-control" id="data_pedido" name="data_pedido"
                                    value="<fmt:formatDate value='${pedido.dataPedido}' pattern='yyyy-MM-dd' />"
                                    required />
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