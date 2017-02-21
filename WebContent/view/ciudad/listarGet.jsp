<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h3>Lista de ciudades</h3>
	<script type="text/javascript">
		
		
		var XMLHttpRequestObject = false;
		if (window.XMLHttpRequest) {
				XMLHttpRequestObject = new XMLHttpRequest();
			  } else if (window.ActiveXObject) {
				XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
			  }


		function compruebaDatos(){
			datos= document.getElementById('idFiltro').value;
			if(datos==null){
				pedirDatos(${baseURL}ciudad/listar,datos);
			}
			else{
				pedirDatos(${baseURL}ciudad/listar,datos);
			}
		}

		function pedirDatos(fuenteDatos,valorParam){
			if(XMLHttpRequestObject) {
				XMLHttpRequestObject.open("GET", fuenteDatos+'?filtro='+valorParam);
				XMLHttpRequestObject.onreadystatechange = tratarRespuesta;
				XMLHttpRequestObject.send(null);
			}
				
		} 
			  
		function tratarRespuesta(){
			if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
				listaCiudades=XMLHttpRequestObject.responseText.split(",");
				lista='';
				for(i=0;i<listaCiudades.length;i++){
					lista+='<td>'+listaCiudades[i]+'</td>';
					document.getElementById("ciudades").innerHTML = lista;
				}
			}
		}
	</script>
	<form name="miForm">
		<input type="text" name="filtro" id="idFiltro" value="${filtro}" onkeyup="compruebaDatos();"> <input type="submit"
			value="Filtrar">
	</form>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Nombre</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ciudad" items="${ciudades}">
				<tr id="ciudades">
					<td>${ciudad.nombre}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>