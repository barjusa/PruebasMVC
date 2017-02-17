
package t8.ej07.beans;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Lenguaje {
	private String nombre;
	private Long id;
	private Collection<Empleado> empleados;
	
	
	


	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Lenguaje(){
		this.empleados = new ArrayList<Empleado>();
	}
	
	public Lenguaje(String nombre) {
		super();
		this.nombre = nombre;
		this.empleados = new ArrayList<Empleado>();
	}
	
	@Column(unique=true)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@ManyToMany(mappedBy="lenguajes")
	public Collection<Empleado> getEmpleados() {
		return empleados;
	}

	public void setEmpleados(Collection<Empleado> empleados) {
		this.empleados = empleados;
	}
	public void addToEmpleados(Empleado empleado){
		this.empleados.add(empleado);
	}
}
