<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:forEach var="lenguaje" items="${lenguajes}">
	<tr>
		<td><li class="list-group-item"><input type="checkbox"
				value="${lenguaje.id}" name="lengDel[]"></td>
		<td><label for="${lenguaje.nombre}">${lenguaje.nombre}</label></td>
		</li>
	</tr>
</c:forEach>