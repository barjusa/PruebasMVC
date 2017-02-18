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
			/*datos.put("ape1Empleado", ape1);
			datos.put("ape2Empleado", ape2);
			datos.put("pwdEmpleado", pwd);
			datos.put("tlfEmpleado", tlf);
			datos.put("ciudadEmpleado", ciudad);
			datos.put("lenguajesEmpleado", lenguajes);*/
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
}
