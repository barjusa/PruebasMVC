package t8.ej07.model;

import java.util.List;

import org.hibernate.Transaction;
import org.mvc.Model;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Empleado;
import t8.ej07.beans.Lenguaje;

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

	@SuppressWarnings("unchecked")
	public List<Empleado> getEmpleadosFiltrados(String filtro) {
		String patronFiltro = "%" + filtro + "%";
		return ss
				.createQuery(
						"from Empleado e where nombre like :filtro or ape1 like :filtro or ape2 like :filtro or tlf like :filtro or e.ciudad.nombre like :filtro or (select count(*) from e.lenguajes where nombre like :filtro)>0")
				.setParameter("filtro", patronFiltro).list();
	}

	public Empleado getEmpleadoPorId(Long id) {
		return ss.get(Empleado.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Empleado> getEmpleadoPorNombre(String nombre) {
		return ss.createQuery("from Empleado where nombre = :nombre").setParameter("nombre", nombre).list();
	}

	public void modificarEmpleado(String nombre, String ape1, String ape2, String pwd, String tlf, Ciudad ciudad,
			List<Lenguaje> lenguajes, Long id) {
		Transaction t = ss.beginTransaction();
		Empleado p = (Empleado) ss.get(Empleado.class, id);
		p.setNombre(nombre);
		p.setApe1(ape1);
		p.setApe2(ape2);
		p.setPwd(pwd);
		p.setTlf(tlf);
		p.setCiudad(ciudad);
		p.setLenguajes(lenguajes);
		ss.merge(p);
		t.commit();
	}

	public void borrarEmpleado(Long id) {
		Transaction t = ss.beginTransaction();
		Empleado p = (Empleado) ss.load(Empleado.class, id);
		ss.delete(p);
		t.commit();
	}

}
