<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<c:choose>
	<c:when test="${empty empleadoNombre}">
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
							<li><a href="${baseURL}ciudad/listar">Listar</a></li>

							<!-- MÃ¯Â¿Â½s beans y mÃ¯Â¿Â½s acciones -->

						</ul></li>


					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> Lenguaje programaci�n<span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">Lenguaje programaci�n</li>
							<li><a href="${baseURL}lenguaje/listar">Listar</a></li>


							<!-- MÃ¯Â¿Â½s beans y mÃ¯Â¿Â½s acciones -->

						</ul></li>


					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> Empleado<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">Empleado</li>
							<li><a href="${baseURL}empleado/listar">Listar</a></li>

							<!-- MÃ¯Â¿Â½s beans y mÃ¯Â¿Â½s acciones -->

						</ul></li>









					<!-- Mas menus -->

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">

							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"> Acceso<span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li class="dropdown-header">Usuario</li>
									<li>
										<form class="form" action="${baseURL}empleado/login"
											method="post" id="formulario">
											<div class="form-group">
												<label for="idNombre">Usuario</label> <input
													class="form-control" type="text" name="nombre"
													id="idNombre">
											</div>
											<div class="form-group">
												<label for="idpwd">Contrase�a</label> <input
													class="form-control" type="password" name="pass" id="idPwd">
											</div>
											<div class="form-group">
												<input class="form-control" type="submit" value="Login">
											</div>
										</form>
									</li>
								</ul></li>
						</ul>
					</div>
				</ul>
			</div>
		</nav>
	</c:when>
	<c:otherwise>
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




							<!-- Mï¿½s beans y mï¿½s acciones -->

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


							<!-- Mas beans y mas acciones -->

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


							<!-- Mï¿½s beans y mï¿½s acciones -->

						</ul></li>


					<!-- Mas menus -->

				</ul>


				<ul class="nav navbar-nav navbar-right">
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">


							<ul class="nav navbar-nav navbar-right">
								<div class="collapse navbar-collapse" id="myNavbar">
									<ul class="nav navbar-nav">

										<li class="dropdown"><a class="dropdown-toggle"
											data-toggle="dropdown" href="#"> ${empleadoNombre}
												${empleadoApe1}<span class="caret"></span>
										</a>
											<ul class="dropdown-menu">
												<li class="dropdown-header">Usuario</li>
												<li>
													<form class="form" action="${baseURL}empleado/logout"
														id="formulario">
														<div class="form-group">
															<input class="form-control" type="submit" value="Logout">
														</div>
													</form>
												</li>
											</ul></li>
									</ul>
								</div>
							</ul>
						</ul>
					</div>
				</ul>
			</div>
		</nav>
	</c:otherwise>
</c:choose>