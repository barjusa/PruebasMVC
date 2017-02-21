<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container">
	<h2>Modificar Ciudades</h2>
	<script type="text/javascript">
		window.onload = function() {
			document.miForm.filtro.focus();
		}
	
	
	</script>
	<form name="miForm" action="${baseURL}ciudad/modificar">
		<input type="text" name="filtro" id="idFiltro" value="${filtro}" onkeyup="this.form.submit();">
		<input type="submit" value="Filtrar">
	</form>
	<hr>
	<table>
		<c:forEach var="ciudad" items="${ciudades}">

		<tr>
			<td><h3>
					${ciudad.nombre}
				</h3></td>
			<td style="padding-left: 20px;"><button data-toggle="modal"
					data-target="#myModal" onclick="editar('${ciudad.nombre}')"
					class="btn btn-primary btn-md">
					Editar <span class="glyphicon glyphicon-edit"></span>
				</button></td>
		</tr>

		</c:forEach>
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
							id="edicion" name="ciudad" class="form-control" required><br>
						<input type="hidden" name="antigua" id="hid" value="">
						<button type="submit" class="btn btn-primary btn-md">
							Enviar <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</form>


			</div>

		</div>

	</div>
</div>


<script type="text/javascript">

	function editar (ciudad){
document.getElementById('edicion').value=ciudad;
document.getElementById('hid').value=ciudad;

	}

</script>
