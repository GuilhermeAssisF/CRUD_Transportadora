<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Transportadora - Funcionários</title>
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
					<h1 class="m-0">Funcionários</h1>
				
					<a href="${pageContext.request.contextPath}/funcionario/update" class="btn btn-primary">
						Novo Funcionário
					</a>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">Sexo</th>
							<th scope="col">E-mail</th>
							<th scope="col">Editar</th>
							<th scope="col">Remover</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="funcionario" items="${funcionarios}">
							<tr>
								<th scope="row">${funcionario.id}</th>
								<td>${funcionario.name}</td>
								<td>${funcionario.gender}</td>
								<td>${funcionario.email}</td>
								<td>
									<a class="bi bi-pencil-square" 
									   href="${pageContext.request.contextPath}/funcionario/update?funcionarioId=${funcionario.id}">
									</a>
								</td>
								<td>
									<a class="bi bi-trash" 
									   href="${pageContext.request.contextPath}/funcionario/delete?funcionarioId=${funcionario.id}"
									   onclick="return confirm('Deseja realmente excluir este funcionário?');">
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
