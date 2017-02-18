<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container list-group">
	<h2>Borrar ciudades</h2>
	<form action="${baseURL}ciudad/borrar" method="post" name="form">

		<c:forEach var="ciudad" items="${ciudades}">
			<tr>
				<td><li class="list-group-item"><input type="checkbox"
						value="${ciudad.id}" name="ciuDel[]"></td>
				<td><label for="${ciudad.nombre}">${ciudad.nombre}</label>
				</td>
				</li>
			</tr>
		</c:forEach>
		<button type="submit" class="btn btn-primary btn-lg">
			<span class="glyphicon glyphicon-erase"></span>
		</button>
		<button type="button" class="btn btn-primary btn-lg"
			onclick="seleccionar_todo()">Seleccionar todos</button>

		<button type="button" class="btn btn-primary btn-lg"
			onclick="deseleccionar_todo()">Deseleccionar todos</button>

	</form>
</div>

<script type="text/javascript">

	function seleccionar_todo() {
		for (i = 0; i < document.form.elements.length; i++)
			if (document.form.elements[i].type == "checkbox")
				document.form.elements[i].checked = 1
	}
	function deseleccionar_todo() {
		for (i = 0; i < document.form.elements.length; i++)
			if (document.form.elements[i].type == "checkbox")
				document.form.elements[i].checked = 0
	}
</script>