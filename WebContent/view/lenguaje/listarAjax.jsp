<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<c:forEach var="lenguaje" items="${lenguajes}">
	<tr>
		<td>${lenguaje.nombre}</td>
	</tr>
</c:forEach>