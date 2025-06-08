<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Transportadora - Clientes</title>
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
					<h1 class="m-0">Clientes</h1>
				
					<a href="${pageContext.request.contextPath}/cliente/update" class="btn btn-primary">
						Novo Cliente
					</a>
				</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">E-mail</th>
							<th scope="col">Telefone</th>
							<th scope="col">Editar</th>
							<th scope="col">Remover</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cliente" items="${clientes}">
							<tr>
								<th scope="row">${cliente.id}</th>
								<td>${cliente.name}</td>
								<td>${cliente.email}</td>
								<td>${cliente.telefone}</td>
								<td>
									<a class="bi bi-pencil-square" 
									   href="${pageContext.request.contextPath}/cliente/update?clienteId=${cliente.id}">
									</a>
								</td>
								<td>
									<a class="bi bi-trash" 
									   href="${pageContext.request.contextPath}/cliente/delete?clienteId=${cliente.id}"
									   onclick="return confirm('Deseja realmente excluir este cliente?');">
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
