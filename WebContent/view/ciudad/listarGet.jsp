<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container">
	<h3>Lista de ciudades</h3>

	<table>

		<tr>
			<th>Nombre</th>
		</tr>

		<c:forEach var="ciudad" items="${ciudades}">
			<tr>
				<td>${ciudad.nombre}</td>
			</tr>
		</c:forEach>

	</table>


</div>