<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Borrar empleados</h2>
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
				pedirDatos("${baseURL}empleado/modificarAjax", datos);
			} else {
				pedirDatos("${baseURL}empleado/modificarAjax", datos);
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
	<form action="${baseURL}empleado/modificarEmpleado" method="post">
		<table class="table table-striped">
			<thead id="empleados">
				
			</thead>
			
		</table>
		<button type="submit" class="btn btn-primary btn-md">
			Modificar <span class="glyphicon glyphicon-edit"></span>
		</button>
	</form>

</div>
<script>
	compruebaDatos();
</script>