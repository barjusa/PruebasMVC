
package t8.ej07.beans;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Ciudad {
	private String nombre;
	private Long id;
	private Collection<Empleado> empleados;
	
	public Ciudad(){
		
	}
	public Ciudad(String nombre) {
		super();
		this.nombre = nombre;
		this.empleados=new ArrayList<Empleado>();
	}
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@OneToMany (cascade ={CascadeType.ALL},fetch=FetchType.LAZY,mappedBy="ciudad")
	public Collection<Empleado> getEmpleados(){
		return empleados;
	}
	
	public void setEmpleados(Collection<Empleado> empleados){
		this.empleados = empleados;
		
	}
	
	public void addToEmpleados(Empleado empleado){
		this.empleados.add(empleado);
	}
	

	@Column(unique=true)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
