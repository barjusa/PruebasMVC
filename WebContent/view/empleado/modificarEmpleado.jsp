<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="container">
	<h2>Introduce los datos del nuevo empleado</h2>
	<form class="form" action="${baseURL}empleado/modificarPost" method="post">
		<div class="form-group">
			<label for="idNombre">Nombre</label> <input class="form-control"
				type="text" name="nombre" id="idNombre" value="${empleado.nombre}">
		</div>
		<div class="form-group">
			<label for="idApe1">Primer apellido</label> <input
				class="form-control" type="text" name="ape1" id="idApe1" value="${empleado.ape1}">
		</div>
		<div class="form-group">
			<label for="idApe2">Segundo apellido</label> <input
				class="form-control" type="text" name="ape2" id="idApe2" value="${empleado.ape2}">
		</div>
		<div class="form-group">
			<label for="idTlf">Teléfono</label> <input class="form-control"
				type="text" name="tlf" id="idTlf" value="${empleado.tlf}">
		</div>
		<input type="hidden" name="empMod" value="${empleado.id}">
		<div class="form-group">
			<label for="idCiudad">Ciudad de nacimiento</label> 
			<select	name="idCiudad">
			<c:forEach var="ciudad" items="${ciudades}">
			 ${select} = ${ciudad.nombre}==${empleado.ciudad.nombre}?"selected='selected'":''
				<option ${select}>value="${ciudad.id}"> ${ciudad.nombre}</option>
			</c:forEach>
			
			</select>
			
			
			<div class="form-group">
				<fieldset>
					<legend>Lenguajes de programación que conoce</legend>
					<?php foreach ($body['lenguajes']as $lenguaje):?>
						<?php
						$check ='';
						foreach ($body['empleado']->sharedLenguajeList as $leng){
						if($lenguaje->nombre == $leng->nombre){
							$check='checked="checked"';	
						}
						}?>
					<input id="id<?=$lenguaje['id']?>" <?=$check?> type="checkbox" value="<?= $lenguaje['id'] ?>" name="idsLenguaje[]">
					<label for="id<?= $lenguaje['id']?>"><?=$lenguaje['nombre'] ?></label>
					<?php endforeach;?>
				</fieldset>
			</div>
		</div>



		<div class="form-group">
			<input class="form-control" type="submit">
		</div>
	</form>
</div>