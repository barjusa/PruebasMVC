package t8.ej07.controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

import t8.ej07.beans.Empleado;
import t8.ej07.beans.Lenguaje;
import t8.ej07.model.EmpleadoModel;
import t8.ej07.model.LenguajeModel;

@SuppressWarnings("serial")
@WebServlet({ "/lenguaje", "/lenguaje/", "/lenguaje/*" })
public class LenguajeController extends Controller {

	public void indexGet() {
		view("lenguaje/crearGet.jsp");
	}

	public void crearGet() {
		view("lenguaje/crearGet.jsp");
	}

	public void crearPost() {
		String nombre = request.getParameter("nombre");
		Lenguaje lenguaje = new Lenguaje(nombre);
		LenguajeModel model = new LenguajeModel();
		datos.put("nombreLenguaje", nombre);
		try {
			model.guardarLenguaje(lenguaje);
			view("lenguaje/crearPost.jsp");
		} catch (Exception e) {
			datos.put("nombreLenguaje", nombre);
			view("lenguaje/crearError.jsp");
		}
	}

	public void listarGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);

		datos.put("filtro", filtro);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/listarGet.jsp");

	}

	public void listarAjaxGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);

		datos.put("filtro", filtro);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/listarAjax.jsp", false);

	}

	public void modificarGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);
		
		datos.put("filtro", filtro);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/modificarGet.jsp");
	}

	public void modificarAjaxGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);
		
		datos.put("filtro", filtro);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/modificarAjax.jsp", false);
	}

	public void modificarPost() {
		String nombreAntiguo = request.getParameter("antiguo");
		String nombreNuevo = request.getParameter("lenguaje");
		LenguajeModel model = new LenguajeModel();
		List<Lenguaje> lenguajeAntigua = model.getLenguajePorNombre(nombreAntiguo);
		Object[] lenguajes = lenguajeAntigua.toArray();
		for (int i = 0; i < lenguajes.length; i++) {
			Long id = ((Lenguaje) lenguajes[i]).getId();
			model.modificarLenguaje(nombreNuevo, id);
		}

		datos.put("nombreLenguaje", nombreNuevo);
		view("lenguaje/modificarPost.jsp");

	}

	public void borrarGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);
		
		datos.put("filtro", filtro);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/borrarGet.jsp");
	}
	public void borrarAjaxGet() {
		LenguajeModel model = new LenguajeModel();
		String filtro = request.getParameter("filtro");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(filtro == null ? "" : filtro);
		
		datos.put("filtro", filtro);

		datos.put("lenguajes", lenguajes);
		view("lenguaje/borrarAjax.jsp",false);
	}

	public void borrarBuscadosPost() {
		LenguajeModel model = new LenguajeModel();
		String nombre = request.getParameter("q");
		List<Lenguaje> lenguajes = model.getLenguajeFiltrados(nombre);
		datos.put("lenguajes", lenguajes);
		view("lenguaje/borrar.jsp");
	}

	public void borrarPost() {
		LenguajeModel model = new LenguajeModel();
		EmpleadoModel modelEmp = new EmpleadoModel();
		for (String idLenguajesString : request.getParameterValues("lengDel[]")) {
			Long idLenguajeLong = Long.parseLong(idLenguajesString);
			model.borrarLenguaje(idLenguajeLong);
		}

		List<Empleado> empleados = modelEmp.getTodos();

		view("lenguaje/borrarPost.jsp");

	}
}
