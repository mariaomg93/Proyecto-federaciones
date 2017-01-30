<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/jugador.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jugadores</title>
</head>
<body>

<c:if test="${not empty jugadorUnico}">
<h3 class="text-center">
	${jugadorUnico.nombre}
</h3><br><br>
<div class="container">
<div class="row">
<div class="media">
	<a class="pull-left" href="#">
		<img class="media-object" src="${jugadorUnico.imagen}" alt="Image" width="240" height="240">
	</a>
	<div class="media-body">
		<h4 class="media-heading">${jugadorUnico.nombre}</h4>
		<p>${jugadorUnico.pais}</p>
	</div>
</div>
</div>
</div>
</c:if>


<c:if test="${not empty pichichi }">
	<h3>Hay pichichi</h3>
	<p>${pichichi.goles} - ${pichichi.nombre}</p>
	</c:if>

	<strong><h3 class=text-center>Jugadores</h3></strong>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nombre</th>
				<th>Edad</th>
				<th>Goles</th>
				<th>Equipo</th>
				<th>Editar</th>
				<th>Borrar</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${jugadores}" var="jugador">
				<tr data-id="${jugador.id}">
					<td>${jugador.id}</td>
					<td><a href=" <c:url value="/jugadores/jugador/${jugador.id}" /> ">${jugador.nombre}</a></td>    
					<td>${jugador.edad}</td>
					<td>${jugador.goles}</td>
					<td><a href=" <c:url value="/equipos/equipo/${jugador.equi.id}" /> ">${jugador.equi.nombre}</a></td>    
					<td><a class="editar-jugador btn btn-warning">Editar</a></td>
					<td><a data-id="${jugador.id }"
						class="btn btn-danger open-Modal" data-nombre="${jugador.nombre}"
						data-toggle="modal" href="#modal-borrar">Borrar</a></td>
				</tr>

			</c:forEach>
			<tr>
				<td colspan="8"><a class="btn btn-primary" data-toggle="modal"
					href='#modal-jugador'>Añadir jugador</a></td>
			</tr>
		</tbody>
	</table>





	<div class="modal fade" id="modal-jugador">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Añadir jugador</h4>
				</div>
				<div class="modal-body">
				
				
				
					<form action="<c:url value="/jugadores"/>" method="POST" role="form">
						<legend>Jugador</legend>
						<div class="form-group">
							<label for="Nombre">Nombre</label> <input type="text"
								class="form-control" id="nombre-jugador" placeholder="Nombre"
								name="nombre">
						</div>

						<div class="form-group">
							<label for="Edad">Edad</label> <input type="number"
								class="form-control" id="edad-jugador" placeholder="Edad"
								name="edad">
						</div>

						<div class="form-group">
							<label for="Goles">Goles</label> <input type="number"
								class="form-control" id="goles-jugador" placeholder="Goles"
								name="goles">
						</div>


						<input type="hidden" name="id" id="input" class="form-control"
							value="">


						<div class="form-group">
							<label for="Equipo">Equipo</label> <select name="equi"
								id="input" class="form-control">

								<c:forEach items="${equipos}" var="equipo">

									<option value="${equipo.id}">${equipo.nombre}</option>

								</c:forEach>

							</select>
						</div>
						
						<div class="form-group">
		<label for="imagen">imagen</label>
		<input type="url" class="form-control" id="imagen-jugador" placeholder="imagen" name="imagen">
	</div>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-primary">Guardar</button>
				</div>
			</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="modal-borrar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">¿Estás seguro de que quieres borrar la
						federación?</h4>
				</div>
				<div class="modal-body">
					¿Seguro segurísimo de borrar? <input type="hidden" id="Jugador"><br>
					<br>
					<strong><span id="jugnombre"></span></strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					<button type="button" class="btn btn-primary btn-borrar"
						data-dismiss="modal">Sí</button>
				</div>
			</div>
		</div>
</body>
</html>