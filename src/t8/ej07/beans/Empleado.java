package t8.ej07.beans;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Empleado {
	private Long id;
	private String nombre;
	private String ape1;
	private String ape2;
	private String pwd;
	private String usu;
	private String tlf;
	private Ciudad ciudad;
	private Collection<Lenguaje> lenguajes;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Empleado() {
		this.lenguajes = new ArrayList<Lenguaje>();
	}

	public Empleado(String nombre, String ape1, String ape2, String pwd, String tlf, String usu, Ciudad ciudad,
			Collection<Lenguaje> lenguajes) {
		super();
		this.nombre = nombre;
		this.ape1 = ape1;
		this.ape2 = ape2;
		this.pwd = pwd;
		
		this.tlf = tlf;
		this.usu = usu;
		this.ciudad = ciudad;
		this.ciudad.addToEmpleados(this);
		this.lenguajes = lenguajes;
		for (Lenguaje lenguaje : lenguajes) {
			lenguaje.addToEmpleados(this);
		}
	}
	@Column(unique = true)
	public String getUsu() {
		return usu;
	}

	public void setUsu(String usu) {
		this.usu = usu;
	}

	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApe1() {
		return ape1;
	}

	public void setApe1(String ape1) {
		this.ape1 = ape1;
	}

	public String getApe2() {
		return ape2;
	}

	public void setApe2(String ape2) {
		this.ape2 = ape2;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTlf() {
		return tlf;
	}

	public void setTlf(String tlf) {
		this.tlf = tlf;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Ciudad getCiudad() {
		return ciudad;
	}

	public void setCiudad(Ciudad ciudad) {
		this.ciudad = ciudad;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	public Collection<Lenguaje> getLenguajes() {
		return lenguajes;
	}

	public void setLenguajes(Collection<Lenguaje> lenguajes) {
		this.lenguajes = lenguajes;
	}
}
