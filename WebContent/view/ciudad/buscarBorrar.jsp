<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<script type="text/javascript">
	function buscar() {
		conector = new XMLHttpRequest();
		filtro = document.getElementById('q').value;
		conector.open("POST", ${baseURL}ciudad/borrarBuscados, true);
		conector.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		conector.send('q=' + filtro);

		conector.onreadystatechange = function() {
			if (conector.readyState == 4 && conector.status == 200) {

				document.getElementById('resultados').innerHTML = conector.responseText;
			}
		}

	}

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

<div class="container">

	<form>

		<label>Busqueda de ciudades</label> <input type="text" name="q" id="q">
		<input type="button" onclick="buscar()" value="buscar">
	</form>

	<div id="resultados"></div>


</div>
<script type="text/javascript">
	function editar(ciudad) {
		document.getElementById('edicion').value = ciudad;
		document.getElementById('hid').value = ciudad;

	}
</script>

