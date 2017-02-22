<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<tr>
	<th>Nombre</th>
	<th>Primer apellido</th>
	<th>Segundo apellido</th>
	<th>Teléfono</th>
	<th>Ciudad de nacimiento</th>
	<th>Lenguajes de programación</th>
	<th>Modificar</th>
</tr>
<tbody>
	<c:forEach var="empleado" items="${empleados}">

		<!--<input name="idEmple" type="hidden" value=" //$empleado['id'] ">-->
		<tr>
			<td>${empleado.nombre}</td>
			<td>${empleado.ape1}</td>
			<td>${empleado.ape2}</td>
			<td>${empleado.tlf}</td>
			<td>${empleado.ciudad.nombre}</td>
			<td><c:forEach var="lenguaje" items="${empleado.lenguajes}">
					${lenguaje.nombre}
					</c:forEach></td>
			<td><input type="radio" value="${empleado.id}" name="idEmple"></td>

		</tr>

	</c:forEach>
</tbody>