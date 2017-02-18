<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container list-group">
	<h2>Modificar Empleados</h2>
<form action="${baseURL}empleado/modificarEmpleado" method="post">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Nombre</th>
				<th>Primer apellido</th>
				<th>Segundo apellido</th>
				<th>Teléfono</th>
				<th>Ciudad de nacimiento</th>
				<th>Lenguajes de programación</th>
				<th>Modificar</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="empleado" items="${empleados}">
		
				<!--<input name="idEmple" type="hidden" value=" //$empleado['id'] ">-->
				<tr>
					<td>${empleado.nombre}</td>
					<td>${empleado.ape1}</td>
					<td>${empleado.ape2}</td>
					<td>${empleado.tlf}</td>
					<td>${empleado.ciudad.nombre}
			</td>
					<td> <c:forEach var="lenguaje" items="${empleado.lenguajes}">
					${lenguaje.nombre}
					</c:forEach>
						</td>
					<td><input type="radio" value="${empleado.id}" name="idEmple"></td>

				</tr>
				
			</c:forEach>
		</tbody>
	</table>
	<button type="submit" class="btn btn-primary btn-md">Modificar <span class="glyphicon glyphicon-edit"></span></button>
	</form>

</div>
<script>


</script>