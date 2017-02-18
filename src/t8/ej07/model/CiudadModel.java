package t8.ej07.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;
import org.mvc.Model;

import t8.ej07.beans.Ciudad;

public class CiudadModel extends Model {

	public void guardarCiudad(Ciudad ciudad) {
		Transaction t = ss.beginTransaction();
		ss.save(ciudad);
		t.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Ciudad> getTodas() {
		return ss.createQuery("from Ciudad").list();
	}

	@SuppressWarnings("unchecked")
	public List<Ciudad> getCiudadesFiltradas(String filtro) {
		String patronFiltro = "%" + filtro + "%";
		return ss.createQuery("from Ciudad where nombre like :filtro").setParameter("filtro", patronFiltro).list();
	}

	@SuppressWarnings("unchecked")
	public List<Ciudad> getCiudadPorNombre(String nombre) {
		return ss.createQuery("from Ciudad where nombre = :nombre").setParameter("nombre", nombre).list();
	}

	public Ciudad getCiudadPorId(Long id) {
		return ss.get(Ciudad.class, id);
	}

	public void modificarCiudad(String nombreNuevo, Long idCiudad) {
		Transaction t = ss.beginTransaction();
		// Ciudad ciudad = (Ciudad) ss.createQuery("from Ciudad where nombre
		// like :nombreAntiguo").uniqueResult();
		// Long id = ciudad.getId();
		Ciudad p = (Ciudad) ss.get(Ciudad.class, idCiudad);
		p.setNombre(nombreNuevo);
		ss.merge(p);
		t.commit();
	}

}
