<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h3>Listado de empleados</h3>
	<script type="text/javascript">
                 window.onload= function(){
                         document.miForm.filtro.focus();
                     }
	
</script>
<form name="miForm">
	<input type="text" name="filtro" id="idFiltro" onkeyup="this.form.submit()">
	<input type="submit" value="Filtrar">
</form>
	<table class="table table-striped">
		<thead>

			<tr>
				<th>Nombre</th>
				<th>Primer apellido</th>
				<th>Segundo apellido</th>
				<th>Tel�fono</th>
				<th>Ciudad</th>
				<th>Lenguajes de programaci�n</th>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>