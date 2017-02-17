<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<nav class="container navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">CRUD Empleados</a>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Ciudad<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">Ciudad</li>
					<li><a href="${baseURL}ciudad/crear">Crear</a></li>
					<li><a href="${baseURL}ciudad/listar">Listar</a></li>
					<li><a href="${baseURL}ciudad/modificar">Modificar</a></li>
					<li><a href="${baseURL}ciudad/borrar">Borrar</a></li>




					<!-- M�s beans y m�s acciones -->

				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Lenguaje programaci�n<span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">Lenguaje programaci�n</li>
					<li><a href="${baseURL}lenguaje/crear">Crear</a></li>
					<li><a href="${baseURL}lenguaje/listar">Listar</a></li>
					<li><a href="${baseURL}lenguaje/modificar">Modificar</a></li>
					<li><a href="${baseURL}lenguaje/borrar">Borrar</a></li>


					<!-- M�s beans y m�s acciones -->

				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Empleado<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">Empleado</li>
					<li><a href="${baseURL}empleado/crear">Crear</a></li>
					<li><a href="${baseURL}empleado/listar">Listar</a></li>
					<li><a href="${baseURL}empleado/modificar">Modificar</a></li>
					<li><a href="${baseURL}empleado/borrar">Borrar</a></li>


					<!-- M�s beans y m�s acciones -->

				</ul></li>









			<!-- M�s men�s -->

		</ul>
		


	</div>
</nav>