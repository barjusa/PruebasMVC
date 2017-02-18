package t8.ej07.model;

import java.util.List;

import org.hibernate.Transaction;
import org.mvc.Model;

import t8.ej07.beans.Ciudad;
import t8.ej07.beans.Lenguaje;

public class LenguajeModel extends Model {

	public void guardarLenguaje(Lenguaje lenguaje) {
		Transaction t = ss.beginTransaction();
		ss.save(lenguaje);
		t.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Lenguaje> getTodos() {
		return ss.createQuery("from Lenguaje").list();
	}

	@SuppressWarnings("unchecked")
	public List<Lenguaje> getLenguajeFiltrados(String filtro) {
		String patronFiltro = "%" + filtro + "%";
		return ss.createQuery("from lenguaje where nombre like:filtro").setParameter("filtro", patronFiltro).list();

	}

	public Lenguaje getLenguajePorId(Long idLenguajeLong) {
		return ss.get(Lenguaje.class, idLenguajeLong);
	}

	public List<Lenguaje> getLenguajePorNombre(String nombre) {
		return ss.createQuery("from Lenguaje where nombre = :nombre").setParameter("nombre", nombre).list();
	}

	public void modificarLenguaje(String nombreNuevo, Long id) {
		Transaction t = ss.beginTransaction();
		Lenguaje p = (Lenguaje) ss.get(Lenguaje.class, id);
		p.setNombre(nombreNuevo);
		ss.merge(p);
		t.commit();
	}

}
