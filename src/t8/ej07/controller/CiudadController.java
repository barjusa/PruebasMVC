package t8.ej07.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Lenguaje;
import t8.ej07.model.CiudadModel;
import t8.ej07.model.LenguajeModel;

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
		String filtro = request.getParameter("filtro");
		List<Ciudad> ciudades = model.getCiudadesFiltradas(filtro);
		
		datos.put("filtro", filtro);
		datos.put("ciudades", ciudades);
		view("ciudad/listarGet.jsp");

	}

	public void modificarGet() {
		CiudadModel model = new CiudadModel();
		String filtro = request.getParameter("filtro");
		List<Ciudad> ciudades = model.getCiudadesFiltradas(filtro);
		
		datos.put("filtro", filtro);
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
	
	public void borrarGet(){
		CiudadModel model = new CiudadModel();
		List<Ciudad> ciudades = model.getTodas();
		datos.put("ciudades", ciudades);
		view("ciudad/borrarGet.jsp");
	}
	public void borrarBuscadosPost(){
		CiudadModel model = new CiudadModel();
		String nombre = request.getParameter("q");
		List<Ciudad> ciudades = model.getCiudadesFiltradas(nombre);
		datos.put("ciudades", ciudades);
		view("ciudad/borrar.jsp");
	}
	
	public void borrarPost(){
		CiudadModel model = new CiudadModel();
		for(String idCiudadesString:request.getParameterValues("ciuDel[]")){
			Long idCiudadLong = Long.parseLong(idCiudadesString);
			model.borrarCiudad(idCiudadLong);
		}
		view("ciudad/borrarPost.jsp");
		
	}
	
}
