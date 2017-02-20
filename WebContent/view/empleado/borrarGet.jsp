<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h3>Borrar empleados</h3>
	<form action="${baseURL}empleado/borrar" method="post" name="form">
		<table class="table table-striped">
			<thead>

				<tr>
					<th>Nombre</th>
					<th>Primer apellido</th>
					<th>Segundo apellido</th>
					<th>Teléfono</th>
					<th>Ciudad</th>
					<th>Lenguajes de programación</th>
					<th>¿Borrar?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="empleado" items="${empleados}">
					<tr>
						<td>${empleado.nombre}</td>
						<td>${empleado.ape1}</td>
						<td>${empleado.ape2}</td>
						<td>${empleado.tlf}</td>
						<td>${empleado.ciudad.nombre}</td>
						<td><c:forEach var="lenguaje" items="${empleado.lenguajes}">
					${lenguaje.nombre}
					</c:forEach></td>
						<td><li class="list-group-item"><input type="checkbox"
								value="${empleado.id}" name="empDel[]"></td>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<button type="submit" class="btn btn-primary btn-lg">
			<span class="glyphicon glyphicon-erase"></span>
		</button>
		<button type="button" class="btn btn-primary btn-lg"
			onclick="seleccionar_todo()">Seleccionar todos</button>

		<button type="button" class="btn btn-primary btn-lg"
			onclick="deseleccionar_todo()">Deseleccionar todos</button>

	</form>
</div>
<script type="text/javascript">
	function seleccionar_todo() {
		for (i = 0; i < document.form.elements.length; i++)
			if (document.form.elements[i].type == "checkbox")
				document.form.elements[i].checked = 1
	}
	function deseleccionar_todo() {
		for (i = 0; i < document.form.elements.length; i++)
			if (document.form.elements[i].type == "checkbox")
				document.form.elements[i].checked = 0
	}
</script>