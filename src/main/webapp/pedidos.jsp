<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
    <title>Transportadora - Pedidos</title>
</head>

<body>
    <div class="container">
        <div class="row pt-5">
            <div class="col-md-1"></div>
            <div class="col-md-10">

                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
                    <i class="bi bi-house"></i>
                </a>

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h1 class="m-0">Pedidos</h1>

                    <a href="${pageContext.request.contextPath}/pedido/update" class="btn btn-primary">
                        Novo Pedido
                    </a>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Cliente Id</th>
                            <th scope="col">Produto Id</th>
                            <th scope="col">Quantidade</th>
                            <th scope="col">Data Pedido</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Remover</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pedido" items="${pedidos}">
                            <tr>
                                <th scope="row">${pedido.id}</th>
                                <td>${pedido.clienteId}</td>
                                <td>${pedido.produtoId}</td>
                                <td>${pedido.quantidade}</td>
                                <td>${pedido.dataPedido}</td>
                                <td>
                                    <a class="bi bi-pencil-square"
                                       href="${pageContext.request.contextPath}/pedido/update?pedidoId=${pedido.id}">
                                    </a>
                                </td>
                                <td>
                                    <a class="bi bi-trash"
                                       href="${pageContext.request.contextPath}/pedido/delete?pedidoId=${pedido.id}"
                                       onclick="return confirm('Deseja realmente excluir este pedido?');">
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
