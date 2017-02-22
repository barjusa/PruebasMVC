<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Borrar lenguajes</h2>
	<script type="text/javascript">
		var XMLHttpRequestObject = false;
		if (window.XMLHttpRequest) {
			XMLHttpRequestObject = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
		}

		function compruebaDatos() {
			datos = document.getElementById('idFiltro').value;
			if (datos == null) {
				pedirDatos("${baseURL}lenguaje/borrarAjax", datos);
			} else {
				pedirDatos("${baseURL}lenguaje/borrarAjax", datos);
			}
		}

		function pedirDatos(fuenteDatos, valorParam) {
			if (XMLHttpRequestObject) {
				XMLHttpRequestObject.open("GET", fuenteDatos + '?filtro='
						+ valorParam);
				XMLHttpRequestObject.onreadystatechange = tratarRespuesta;
				XMLHttpRequestObject.send(null);
			}

		}

		function tratarRespuesta() {
			if (XMLHttpRequestObject.readyState == 4
					&& XMLHttpRequestObject.status == 200) {
				document.getElementById("lenguajes").innerHTML = XMLHttpRequestObject.responseText;
			}
		}
	</script>
	<form name="miForm">
		Filtrar: <input type="text" name="filtro" id="idFiltro"
			value="${filtro}" onkeyup="compruebaDatos();">
	</form>
	<form action="${baseURL}lenguaje/borrar" method="post" name="form">
		<table>
			<thead id="lenguajes"></thead>
		</table>
		<button type="submit" class="btn btn-primary btn-lg">
			<span class="glyphicon glyphicon-erase"></span>
		</button>
		<button type="button" class="btn btn-primary btn-lg"
			onclick="seleccionar_todo()">Seleccionar todos</button>

		<button type="button" class="btn btn-primary btn-lg"
			onclick="deseleccionar_todo()">Deseleccionar todos</button>

	</form>
</div>
<script>
	compruebaDatos();
</script>
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