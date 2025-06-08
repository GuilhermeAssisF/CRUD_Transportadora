<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css" />
    <title>Transportadora - Produto</title>
</head>

<body>
    <div class="container">
        <div class="row pt-5">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                
                <a href="${pageContext.request.contextPath}/produtos" class="btn btn-secondary mb-3">
                    <i class="bi bi-arrow-left"></i> Voltar
                </a>

                <h1 class="mb-4">Produto</h1>

                <form action="${pageContext.request.contextPath}/produto/save" method="post">
                    
                    <input type="hidden" name="produto_id" value="${produto.id}" />
                    
                    <div class="mb-3">
                        <label for="produto_nome" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="produto_nome" name="produto_nome" 
                               value="${produto.nome}" required maxlength="100" />
                    </div>
                    
                    <div class="mb-3">
                        <label for="produto_descricao" class="form-label">Descrição</label>
                        <textarea class="form-control" id="produto_descricao" name="produto_descricao" rows="3"
                                  maxlength="500">${produto.descricao}</textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label for="produto_preco" class="form-label">Preço (R$)</label>
                        <input type="number" step="0.01" min="0" class="form-control" id="produto_preco" 
                               name="produto_preco" value="${produto.preco}" required />
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </form>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>
