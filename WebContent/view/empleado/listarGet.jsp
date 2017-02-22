<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Listado de empleados</h2>
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
				pedirDatos("${baseURL}empleado/listarAjax", datos);
			} else {
				pedirDatos("${baseURL}empleado/listarAjax", datos);
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
				document.getElementById("empleados").innerHTML = XMLHttpRequestObject.responseText;
			}
		}
	</script>
	<form name="miForm">
		Filtrar: <input type="text" name="filtro" id="idFiltro"
			value="${filtro}" onkeyup="compruebaDatos();">
	</form>
	<table class="table table-striped">
		<thead id="empleados">

			
		</thead>
		
	</table>


</div>
<script>
	compruebaDatos();
</script>