<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_cliente.css">
        <title>Transportadora - Cadastro de Cliente</title>
    </head>

    <body>
        <div class="form-container-card">
            <form action="${pageContext.request.contextPath}/cliente/save" method="POST">
                <h1 class="display-5">Cadastro de Cliente</h1>

                <input type="hidden" id="cliente_id" name="cliente_id" value="${cliente != null ? cliente.id : ''}">

                <div class="mb-3">
                    <label for="cliente_name_id" class="form-label"><i class="bi bi-person me-2"></i>Nome
                        Completo</label>
                    <input type="text" id="cliente_name_id" name="cliente_name" class="form-control"
                        value="${cliente != null ? cliente.name : ''}" placeholder="Digite o nome do cliente" required>
                </div>

                <div class="mb-3">
                    <label for="cliente_email_id" class="form-label"><i class="bi bi-envelope me-2"></i>Email</label>
                    <input type="email" id="cliente_email_id" name="cliente_email" class="form-control"
                        value="${cliente != null ? cliente.email : ''}" placeholder="Digite o email do cliente">
                </div>

                <div class="mb-4"> <%-- Aumentado o mb para o último campo antes dos botões --%>
                        <label for="cliente_telefone_id" class="form-label"><i
                                class="bi bi-telephone me-2"></i>Telefone</label>
                        <input type="text" id="cliente_telefone_id" name="cliente_telefone" class="form-control"
                            value="${cliente != null ? cliente.telefone : ''}"
                            placeholder="Digite o telefone do cliente">
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end"> <%-- Botões alinhados à direita e empilhados
                        em mobile --%>
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