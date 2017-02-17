<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container">
	<h3>Lista de lenguajes</h3>

	<table>

		<tr>
			<th>Nombre</th>
		</tr>

		<c:forEach var="lenguaje" items="${lenguajes}">
			<tr>
				<td>${lenguaje.nombre}</td>
			</tr>
		</c:forEach>

	</table>


</div>