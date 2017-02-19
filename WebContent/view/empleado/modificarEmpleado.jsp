<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Introduce los datos del nuevo empleado</h2>
	<form class="form" action="${baseURL}empleado/modificarPost"
		method="post">
		<div class="form-group">
			<label for="idNombre">Nombre</label> <input class="form-control"
				type="text" name="nombre" id="idNombre" value="${nombre}">
		</div>
		<div class="form-group">
			<label for="idApe1">Primer apellido</label> <input
				class="form-control" type="text" name="ape1" id="idApe1"
				value="${ape1}">
		</div>
		<div class="form-group">
			<label for="idApe2">Segundo apellido</label> <input
				class="form-control" type="text" name="ape2" id="idApe2"
				value="${ape2}">
		</div>
		<div class="form-group">
			<label for="idTlf">Teléfono</label> <input class="form-control"
				type="text" name="tlf" id="idTlf" value="${tlf}">
		</div>
		<input type="hidden" name="empMod" value="${id}">
		<div class="form-group">
			<label for="idCiudad">Ciudad de nacimiento</label> <select
				name="idCiudad">
				<c:forEach var="ciudad" items="${ciudades}">

					<c:choose>
						<c:when test="${nombreCiudad==ciudad.nombre}">
							<option value="${ciudad.id}" selected="selected">${nombreCiudad}</option>
						</c:when>
						<c:when test="${nombreCiudad!=ciudad.nombre}">
							<option value="${ciudad.id}">${ciudad.nombre}</option>
						</c:when>
					</c:choose>

				</c:forEach>

			</select>


			<div class="form-group">
				<fieldset>
					<legend>Lenguajes de programación que conoce</legend>

					<c:forEach var="lenguaje" items="${lenguajes}">

						<c:forEach var="lengEleg" items="${lenguajesElegidos}">

							<c:if test="${lenguaje.nombre==lengEleg.nombre}">
								<input id="id${lengEleg.id}" type="checkbox"
									value="${lengEleg.id}" name="idsLenguaje[]" checked="checked">
								<label for="id${lengEleg.id}">${lengEleg.nombre}</label>
							</c:if>

						</c:forEach>
						<input id="id${lenguaje.id}" type="checkbox"
							value="${lenguaje.id}" name="idsLenguaje[]">
						<label for="id${lenguaje.id}">${lenguaje.nombre}</label>
					</c:forEach>

				</fieldset>
			</div>
		</div>



		<div class="form-group">
			<input class="form-control" type="submit">
		</div>
	</form>
</div>