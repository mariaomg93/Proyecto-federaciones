<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/fede.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Federación</title>
</head>
<body>

	<h3 class="text-center">Federaciones</h3><br>
	
	<table class="table table-hover">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>País</th>
			<th>Ver equipos</th>
			<th>Editar</th>
			<th>Borrar</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${federaciones}" var="federacion">
		<tr data-id="${federacion.id }">
			<td >${federacion.id}</td>
			<td>${federacion.nombre}</td>
			<td>${federacion.pais}</td>
			<td><a href="<c:url value="/federaciones/federacion/${federacion.id}"/>">Ver</a></td>
			<td><a class="editar-fede btn btn-warning">Editar</a></td>
			<td><a data-id="${federacion.id }" class="btn btn-danger open-Modal" data-nombre="${federacion.nombre}" data-toggle="modal" href="#modal-borrar">Borrar</a></td>

		</tr>
		</c:forEach>
		<tr ><td colspan="5"><a class="btn btn-primary" data-toggle="modal" href="#modal-federacion">Añadir federacion</a></td></tr>
		
	</tbody>
</table>

<!-- Empieza la diversión -->
<div class="modal fade" id="modal-federacion">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Añadir federacion</h4>
			</div>
			<div class="modal-body">
			
			
			
			
			
				<form action="<c:url value="/federaciones"/>" method="POST" role="form">
	<legend>Federación</legend>

	<div class="form-group">
		<label for="">Nombre</label>
		<input type="text" class="form-control" id="nombre-fede" placeholder="Nombre" name="nombre">
	</div>
	<div class="form-group">
		<label for="">País</label>
		<input type="text" class="form-control" id="pais-fede" placeholder="País" name="pais">
	</div>
	
	<div class="form-group">
		<label for="">Imagen</label>
		<input type="url" class="form-control" id="imagen-fede" name="imagen">
	</div>

	<input type="hidden" id="id-fede" name="id">
	

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
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">¿Estás seguro de que quieres borrar la federación?</h4>
			</div>
			<div class="modal-body">
				¿Seguro segurísimo de borrar? <input type="hidden" id="Fede"><br><br><strong><span id="fedenombre"></span></strong>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
				<button type="button" class="btn btn-primary btn-borrar" data-dismiss="modal">Sí</button>
			</div>
		</div>
	</div>
</div>

	
	
</body>
</html>