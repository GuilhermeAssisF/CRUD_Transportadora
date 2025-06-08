<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<title>Cadastro Cliente</title>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-2"></div>

            <!-- Formulário de Cliente -->
            <form action="${pageContext.request.contextPath}/cliente/save" method="POST" class="col-8">
                <h1>Cadastro de Cliente</h1>

                <input type="hidden" id="cliente_id" name="cliente_id"
                    value="${cliente != null ? cliente.id : ''}">

                <div class="mb-3">
                    <label for="cliente_name_id" class="form-label">Nome</label>
                    <input type="text" id="cliente_name_id" name="cliente_name"
                        class="form-control" value="${cliente != null ? cliente.name : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="cliente_email_id" class="form-label">Email</label>
                    <input type="email" id="cliente_email_id" name="cliente_email"
                        class="form-control" value="${cliente != null ? cliente.email : ''}">
                </div>

                <div class="mb-3">
                    <label for="cliente_telefone_id" class="form-label">Telefone</label>
                    <input type="text" id="cliente_telefone_id" name="cliente_telefone"
                        class="form-control" value="${cliente != null ? cliente.telefone : ''}">
                </div>

                <button type="submit" class="btn btn-primary">Salvar</button>
                <a href="${pageContext.request.contextPath}/clientes" class="btn btn-secondary">Cancelar</a>
            </form>

            <div class="col-2"></div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>
