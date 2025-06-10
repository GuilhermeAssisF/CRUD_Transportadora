<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_produto.css">
        <title>Transportadora - Cadastro de Produto</title>
    </head>

    <body>
        <div class="form-container-card">
            <form action="${pageContext.request.contextPath}/produto/save" method="post">
                <h1 class="display-5">Cadastro de Produto</h1>

                <input type="hidden" name="produto_id" value="${produto.id}" />

                <div class="mb-3">
                    <label for="produto_nome" class="form-label"><i class="bi bi-box-seam me-2"></i>Nome do
                        Produto</label>
                    <input type="text" class="form-control" id="produto_nome" name="produto_nome"
                        value="${produto.nome}" placeholder="Digite o nome do produto" required maxlength="100" />
                </div>

                <div class="mb-3">
                    <label for="produto_descricao" class="form-label"><i
                            class="bi bi-file-text me-2"></i>Descrição</label>
                    <textarea class="form-control" id="produto_descricao" name="produto_descricao" rows="3"
                        placeholder="Descreva o produto (opcional)" maxlength="500">${produto.descricao}</textarea>
                </div>

                <div class="mb-4"> <%-- Aumentado o mb para o último campo antes dos botões --%>
                        <label for="produto_preco" class="form-label"><i class="bi bi-cash-coin me-2"></i>Preço
                            (R$)</label>
                        <input type="number" step="0.01" min="0" class="form-control" id="produto_preco"
                            name="produto_preco" value="${produto.preco}" placeholder="Ex: 99.99" required />
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end"> <%-- Botões alinhados à direita e empilhados
                        em mobile --%>
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-save me-2"></i>Salvar
                        </button>
                        <a href="${pageContext.request.contextPath}/produtos" class="btn btn-secondary btn-lg">
                            <i class="bi bi-x-circle me-2"></i>Cancelar
                        </a>
                </div>
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>