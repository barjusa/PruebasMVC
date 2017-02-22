<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<c:forEach var="ciudad" items="${ciudades}">

	<tr>
		<td><h3>${ciudad.nombre}</h3></td>
		<td style="padding-left: 20px;"><button data-toggle="modal"
				data-target="#myModal" onclick="editar('${ciudad.nombre}')"
				class="btn btn-primary btn-md">
				Editar <span class="glyphicon glyphicon-edit"></span>
			</button></td>
	</tr>

</c:forEach>