package t8.ej07.controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

import t8.ej07.beans.Ciudad;
import t8.ej07.model.CiudadModel;

@SuppressWarnings("serial")
@WebServlet({ "/ciudad", "/ciudad/", "/ciudad/*" })
public class CiudadController extends Controller {

	public void indexGet() {
		view("ciudad/crearGet.jsp");
	}

	public void crearGet() {
		view("ciudad/crearGet.jsp");
	}

	public void crearPost() {
		String nombre = request.getParameter("nombre");
		Ciudad ciudad = new Ciudad(nombre);
		CiudadModel model = new CiudadModel();
		datos.put("nombreCiudad", nombre);
		try {
			model.guardarCiudad(ciudad);
			view("ciudad/crearPost.jsp");
		} catch (Exception e) {
			datos.put("nombreCiudad", nombre);
			view("ciudad/crearError.jsp");
		}
	}

	public void listarGet() {
		CiudadModel model = new CiudadModel();
		List<Ciudad> ciudades = model.getTodas();
		datos.put("ciudades", ciudades);
		view("ciudad/listarGet.jsp");

	}

	public void modificarGet() {
		CiudadModel model = new CiudadModel();
		List<Ciudad> ciudades = model.getTodas();
		datos.put("ciudades", ciudades);
		view("ciudad/modificarGet.jsp");
	}

	public void modificarPost() {
		String nombreAntiguo = request.getParameter("antigua");
		String nombreNuevo = request.getParameter("ciudad");
		CiudadModel model = new CiudadModel();
		List<Ciudad> ciudadAntigua = model.getCiudadPorNombre(nombreAntiguo);
		Object[] ciudades = ciudadAntigua.toArray();
		for (int i = 0; i < ciudades.length; i++) {
			Long id = ((Ciudad) ciudades[i]).getId();
			model.modificarCiudad(nombreNuevo, id);
		}
		
		datos.put("nombreCiudad", nombreNuevo);
		view("ciudad/modificarPost.jsp");

	}
}
