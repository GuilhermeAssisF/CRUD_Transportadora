<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<title>Cadastro Funcionario</title>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-2"></div>

            <!-- IMPORTANTE: agora usando POST + contextPath correto -->
            <form action="${pageContext.request.contextPath}/funcionario/save" method="POST" class="col-8">
                <h1>Cadastro de Funcionário</h1>

                <input type="hidden" id="funcionario_id" name="funcionario_id"
                    value="${funcionario != null ? funcionario.id : ''}">

                <div class="mb-3">
                    <label for="funcionario_name_id" class="form-label">Nome</label>
                    <input type="text" id="funcionario_name_id" name="funcionario_name"
                        class="form-control" value="${funcionario != null ? funcionario.name : ''}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Gênero</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="funcionario_gender"
                            value="M" id="funcionario_gender_m"
                            ${funcionario != null && funcionario.gender == 'M' ? 'checked' : ''} required>
                        <label class="form-check-label" for="funcionario_gender_m"> Masculino </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="funcionario_gender"
                            value="F" id="funcionario_gender_f"
                            ${funcionario != null && funcionario.gender == 'F' ? 'checked' : ''} required>
                        <label class="form-check-label" for="funcionario_gender_f"> Feminino </label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="funcionario_email_id" class="form-label">Email</label>
                    <input type="email" id="funcionario_email_id" name="funcionario_email"
                        class="form-control" value="${funcionario != null ? funcionario.email : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="funcionario_pw_id" class="form-label">Senha</label>
                    <input type="password" id="funcionario_pw_id" name="funcionario_pw"
                        class="form-control" ${funcionario == null ? 'required' : ''}>
                    <small class="form-text text-muted">
                        ${funcionario != null ? 'Deixe em branco para manter a senha atual.' : ''}
                    </small>
                </div>

                <button type="submit" class="btn btn-primary">Salvar</button>
                <a href="${pageContext.request.contextPath}/funcionarios" class="btn btn-secondary">Cancelar</a>
            </form>

            <div class="col-2"></div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>

</html>
