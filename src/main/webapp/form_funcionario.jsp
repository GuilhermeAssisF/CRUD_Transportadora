<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_funcionario.css">
        <title>Transportadora - Cadastro de Funcionário</title>
    </head>

    <body>
        <div class="form-container-card">
            <form action="${pageContext.request.contextPath}/funcionario/save" method="POST">
                <h1 class="display-5">Cadastro de Funcionário</h1>

                <input type="hidden" id="funcionario_id" name="funcionario_id"
                    value="${funcionario != null ? funcionario.id : ''}">

                <div class="mb-3">
                    <label for="funcionario_name_id" class="form-label"><i class="bi bi-person me-2"></i>Nome
                        Completo</label>
                    <input type="text" id="funcionario_name_id" name="funcionario_name" class="form-control"
                        value="${funcionario != null ? funcionario.name : ''}"
                        placeholder="Digite o nome do funcionário" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="bi bi-gender-ambiguous me-2"></i>Gênero</label>
                    <div class="d-flex gap-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="funcionario_gender" value="M"
                                    id="funcionario_gender_m" ${funcionario !=null && funcionario.gender=='M'
                                    ? 'checked' : '' } required>
                                <label class="form-check-label" for="funcionario_gender_m"> Masculino </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="funcionario_gender" value="F"
                                    id="funcionario_gender_f" ${funcionario !=null && funcionario.gender=='F'
                                    ? 'checked' : '' } required>
                                <label class="form-check-label" for="funcionario_gender_f"> Feminino </label>
                            </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="funcionario_email_id" class="form-label"><i
                            class="bi bi-envelope me-2"></i>Email</label>
                    <input type="email" id="funcionario_email_id" name="funcionario_email" class="form-control"
                        value="${funcionario != null ? funcionario.email : ''}" placeholder="Digite o email" required>
                </div>

                <div class="mb-4">
                        <label for="funcionario_pw_id" class="form-label"><i class="bi bi-key me-2"></i>Senha</label>
                        <input type="password" id="funcionario_pw_id" name="funcionario_pw" class="form-control"
                            placeholder="${funcionario == null ? 'Crie uma senha' : 'Deixe em branco para manter a atual'}"
                            ${funcionario==null ? 'required' : '' }>
                        <small class="form-text text-muted">
                            ${funcionario != null ? 'Deixe em branco para manter a senha atual.' : ''}
                        </small>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-save me-2"></i>Salvar
                        </button>
                        <a href="${pageContext.request.contextPath}/funcionarios" class="btn btn-secondary btn-lg">
                            <i class="bi bi-x-circle me-2"></i>Cancelar
                        </a>
                </div>
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>