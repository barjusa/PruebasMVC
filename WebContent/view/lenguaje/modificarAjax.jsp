<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:forEach var="lenguaje" items="${lenguajes}">

	<tr>
		<td><h3>${lenguaje.nombre}</h3></td>
		<td style="padding-left: 20px;"><button data-toggle="modal"
				data-target="#myModal" onclick="editar('${lenguaje.nombre}')"
				class="btn btn-primary btn-md">
				Editar <span class="glyphicon glyphicon-edit"></span>
			</button></td>
	</tr>

</c:forEach>