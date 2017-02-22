<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<c:forEach var="ciudad" items="${ciudades}">
	<tr>
		<td>${ciudad.nombre}</td>
	</tr>
</c:forEach>