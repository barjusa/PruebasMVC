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
		Ciudad ciudadAntigua= model.getCiudadPorNombre(nombreAntiguo);
		Long id = ciudadAntigua.getId();
		ciudadAntigua.setNombre(nombreNuevo);
		System.out.println("El id de la ciudad es "+id);
		System.out.println("el nombre es"+nombreNuevo);
		model.modificarCiudad(nombreNuevo, id);
		view("ciudad/modificarPost.jsp");
		
		// Ciudad ciudad = new
		// CiudadModel().getCiudadPorId(Long.parseLong(request.getParameter("antigua")));
		// Long idCiudad = model.getCiudadPorId(Long.parseLong(nuevaCiudad));
		// Ciudad ciudad = model.getCiudadPorId(idCiudad);
	}
}
