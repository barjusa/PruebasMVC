<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Modificar lenguajes</h2>
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
				pedirDatos("${baseURL}lenguaje/modificarAjax", datos);
			} else {
				pedirDatos("${baseURL}lenguaje/modificarAjax", datos);
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
	<table>
		<thead id="lenguajes"></thead>
	</table>

</div>

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">

			<div>
				<form class="modal-body" method="post">
					<div class="form-group">
						<label for="edicion">Modificar</label> <input type="text"
							id="edicion" name="lenguaje" class="form-control" required><br>
						<input type="hidden" name="antiguo" id="hid" value="">
						<button type="submit" class="btn btn-primary btn-md">
							Enviar <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</form>


			</div>

		</div>

	</div>
</div>
<script>
	compruebaDatos();
</script>

<script type="text/javascript">
	function editar(lenguaje) {
		document.getElementById('edicion').value = lenguaje;
		document.getElementById('hid').value = lenguaje;

	}
</script>
