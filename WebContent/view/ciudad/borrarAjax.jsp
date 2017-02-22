<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:forEach var="ciudad" items="${ciudades}">
	<tr>
		<td><li class="list-group-item"><input type="checkbox"
				value="${ciudad.id}" name="ciuDel[]"></td>
		<td><label for="${ciudad.nombre}">${ciudad.nombre}</label></td>
		</li>
	</tr>
</c:forEach>