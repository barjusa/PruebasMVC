package t8.ej07.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Empleado;
import t8.ej07.beans.Lenguaje;
import t8.ej07.model.CiudadModel;
import t8.ej07.model.EmpleadoModel;
import t8.ej07.model.LenguajeModel;

@SuppressWarnings("serial")
@WebServlet({ "/empleado", "/empleado/", "/empleado/*" })
public class EmpleadoController extends Controller {
	public void indexGet() {
		view("empleado/crearGet.jsp");
	}

	public void crearGet() {
		CiudadModel ciudadModel = new CiudadModel();
		LenguajeModel lenguajeModel = new LenguajeModel();
		
		List<Ciudad> ciudades = ciudadModel.getTodas();
		List<Lenguaje> lenguajes = lenguajeModel.getTodos();
		
		datos.put("ciudades", ciudades);
		datos.put("lenguajes", lenguajes);
		
		view("empleado/crearGet.jsp");
	}

	public void crearPost() {
		String nombre = request.getParameter("nombre");
		String ape1 = request.getParameter("ape1");
		String ape2 = request.getParameter("ape2");
		String pwd = request.getParameter("pwd");
		String tlf= request.getParameter("tlf");
		Ciudad ciudad = new CiudadModel().getCiudadPorId(Long.parseLong(request.getParameter("idCiudad")));
		
		List<Lenguaje> lenguajes = new ArrayList<Lenguaje>();
		LenguajeModel lenguajeModel = new LenguajeModel();
		for(String idLenguajesString:request.getParameterValues("idsLenguaje[]")){
			Long idLenguajeLong = Long.parseLong(idLenguajesString);
			Lenguaje lenguaje = lenguajeModel.getLenguajePorId(idLenguajeLong);
			lenguajes.add(lenguaje);
		}
		
		Empleado empleado = new Empleado(nombre, ape1, ape2, pwd, tlf, ciudad, lenguajes);
		
		EmpleadoModel model = new EmpleadoModel();
		try {
			model.guardarEmpleado(empleado);
			datos.put("nombreEmpleado", nombre);
			view("empleado/crearPost.jsp");
		} catch (Exception e) {
			datos.put("nombreEmpleado", nombre);
			view("empleado/crearError.jsp");
		}
	}

	public void listarGet() {
		EmpleadoModel model = new EmpleadoModel();
		List<Empleado> empleados = model.getTodos();
		datos.put("empleados", empleados);
		view("empleado/listarGet.jsp");

	}
	
	public void modificarGet() {
		EmpleadoModel model = new EmpleadoModel();
		List<Empleado> empleados = model.getTodos();
		datos.put("empleados", empleados);
		view("empleado/modificarGet.jsp");
	}
	
	public void modificarEmpleadoPost(){
		EmpleadoModel model = new EmpleadoModel();
		Long idEmpleado = (Long.parseLong(request.getParameter("idEmple")));
		Empleado empleado = model.getEmpleadoPorId(idEmpleado);
		String nombre = empleado.getNombre();
		String ape1 = empleado.getApe1();
		String ape2= empleado.getApe2();
		String tlf = empleado.getTlf();
		String pwd = empleado.getPwd();
		Ciudad ciudad = empleado.getCiudad();
		Collection<Lenguaje> lenguajesElegidos= empleado.getLenguajes();
		String nombreCiudad = ciudad.getNombre();
		CiudadModel ciudadModel = new CiudadModel();
		LenguajeModel lenguajeModel = new LenguajeModel();
		List<Ciudad> ciudades = ciudadModel.getTodas();
		List<Lenguaje> lenguajes = lenguajeModel.getTodos();
		
		
		datos.put("nombre", nombre);
		datos.put("ape1", ape1);
		datos.put("ape2", ape2);
		datos.put("pwd", pwd);
		datos.put("tlf", tlf);
		datos.put("nombreCiudad", nombreCiudad);
		datos.put("lenguajesElegidos", lenguajesElegidos);
		datos.put("ciudades", ciudades);
		datos.put("lenguajes", lenguajes);
		view("empleado/modificarEmpleado.jsp");
	}

	public void modificarPost() {
		//TODO
		String nombreAntiguo = request.getParameter("antiguo");
		String nombreNuevo = request.getParameter("ciudad");
		EmpleadoModel model = new EmpleadoModel();
		List<Empleado> empleadoAntiguo = model.getEmpleadoPorNombre(nombreAntiguo);
		Object[] empleados = empleadoAntiguo.toArray();
		for (int i = 0; i < empleados.length; i++) {
			Long id = ((Ciudad) empleados[i]).getId();
			model.modificarEmpleado(nombreNuevo, id);
		}
		
		datos.put("nombreCiudad", nombreNuevo);
		view("ciudad/modificarPost.jsp");

	}
}
