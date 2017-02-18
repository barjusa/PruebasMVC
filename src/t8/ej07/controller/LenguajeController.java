package t8.ej07.controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Lenguaje;
import t8.ej07.model.LenguajeModel;

@SuppressWarnings("serial")
@WebServlet({"/lenguaje","/lenguaje/","/lenguaje/*"})
public class LenguajeController extends Controller{
	
	public void indexGet(){
		view("lenguaje/crearGet.jsp");
	}
	public void crearGet(){
		view("lenguaje/crearGet.jsp");
	}
	public void crearPost(){
		String nombre = request.getParameter("nombre");
		Lenguaje lenguaje = new Lenguaje(nombre);
		LenguajeModel model = new LenguajeModel();
		datos.put("nombreLenguaje",nombre);
		try {
			model.guardarLenguaje(lenguaje);
			view("lenguaje/crearPost.jsp");
		} catch (Exception e) {
			datos.put("nombreLenguaje",nombre);
			view("lenguaje/crearError.jsp");
		}
	}
	
	public void listarGet(){
		LenguajeModel model = new LenguajeModel();
		List<Lenguaje> lenguajes = model.getTodos();
		datos.put("lenguajes", lenguajes);
		view("lenguaje/listarGet.jsp");
		
	}
	
	public void modificarGet() {
		LenguajeModel model = new LenguajeModel();
		List<Lenguaje> lenguajes = model.getTodos();
		datos.put("lenguajes", lenguajes);
		view("lenguaje/modificarGet.jsp");
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
}
