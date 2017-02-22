<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h3>Lista de lenguajes</h3>
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
				pedirDatos("${baseURL}lenguaje/listarAjax", datos);
			} else {
				pedirDatos("${baseURL}lenguaje/listarAjax", datos);
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
				//listaCiudades = XMLHttpRequestObject.responseText.split(",");
				//lista = '';
				//console.log(listaCiudades);
				//for (i = 0; i < listaCiudades.length; i++) {
					//lista += '<td>' + listaCiudades[i] + '</td>';
					//document.getElementById("ciudades").innerHTML = lista;
			//	}
			}
		}
	</script>
	<form name="miForm">
		<input type="text" name="filtro" id="idFiltro" value="${filtro}"
			onkeyup="compruebaDatos();">
	</form>
	<table>
		<thead>
			<tr>
				<th>Nombre</th>
			</tr>
		</thead>
		<tbody id="lenguajes">

		</tbody>
	</table>
<script>compruebaDatos();</script>

</div>