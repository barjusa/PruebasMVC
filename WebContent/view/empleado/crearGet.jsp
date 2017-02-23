<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Introduce los datos del nuevo empleado</h2>

	<form class="form" method="post" id="formularioCrear">

		<div class="form-group">
			<label for="idNombre">Nombre *</label> <input class="form-control"
				type="text" name="nombre" id="idNombre">
		</div>

		<div class="form-group">
			<label for="idApe1">Primer apellido *</label> <input
				class="form-control" type="text" name="ape1" id="idApe1">
		</div>

		<div class="form-group">
			<label for="idApe2">Segundo apellido</label> <input
				class="form-control" type="text" name="ape2" id="idApe2">
		</div>
		<div class="form-group">
			<label for="idUsu">Usuario *</label> <input class="form-control"
				type="text" name="usuario" id="idUsu">
		</div>

		<div class="form-group">
			<label for="idPwd">Contrase�a *</label> <input class="form-control"
				type="password" name="pwd" id="idPwd">
		</div>

		<div class="form-group">
			<label for="idTlf">Tel�fono</label> <input class="form-control"
				type="text" name="tlf" id="idTlf">
		</div>



		<div class="form-group">
			<label for="idCiudad">Ciudad de nacimiento</label> <select
				name="idCiudad">
				<c:forEach var="ciudad" items="${ciudades}">
     				${objeto.atributo}
					<option value="${ciudad.id}">${ciudad.nombre}</option>
				</c:forEach>
			</select>
		</div>


		<div class="form-group">
			<fieldset>
				<legend>Lenguajes de programaci�n que conoce</legend>
				<c:forEach var="lenguaje" items="${lenguajes}">
					<input id="id${lenguaje.id}" type="checkbox" value="${lenguaje.id}"
						name="idsLenguaje[]">
					<label for="id${lenguaje.id}">${lenguaje.nombre}</label>
				</c:forEach>

			</fieldset>
		</div>


		<div class="form-group">
			<input class="form-control" type="submit" value="Enviar">
		</div>
	</form>