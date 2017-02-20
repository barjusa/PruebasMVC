package t8.ej07.model;

import java.util.List;

import org.hibernate.Transaction;
import org.mvc.Model;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Empleado;

public class EmpleadoModel extends Model {
	public void guardarEmpleado(Empleado empleado) {
		Transaction t = ss.beginTransaction();
		ss.save(empleado);
		t.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Empleado> getTodos() {
		return ss.createQuery("from Empleado").list();
	}

	public List<Empleado> getEmpleadosFiltrados(String filtro) {
		String patronFiltro = "%" + filtro + "%";
		return ss.createQuery("from Empleado where nombre like :filtro").setParameter("filtro", patronFiltro).list();
	}
	
	public Empleado getEmpleadoPorId(Long id) {
		return ss.get(Empleado.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Empleado> getEmpleadoPorNombre(String nombre) {
		return ss.createQuery("from Empleado where nombre = :nombre").setParameter("nombre", nombre).list();
		//TODO
	}

	public void modificarEmpleado(String nombreNuevo, Long id) {
		Transaction t = ss.beginTransaction();
		Empleado p = (Empleado) ss.get(Empleado.class, id);
		p.setNombre(nombreNuevo);
		ss.merge(p);
		t.commit();
		//TODO
	}
	
	public void borrarEmpleado(Long id) {
		Transaction t = ss.beginTransaction();
		Empleado p = (Empleado) ss.load(Empleado.class, id);
		ss.delete(p);
		t.commit();
	}

}
