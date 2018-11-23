package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariasDetalles extends DynaActionForm {

	private String    Nombre;
	private String    Habilitado;
	private String    Direccion;
	private String    Telefono;
	private String    Fecha_actualizacion;
	private String    Id_concesionaria;
   
	public String getId_concesionaria() {
		return Id_concesionaria;
	}

	public void setId_concesionaria(String id_concesionaria) {
		Id_concesionaria = id_concesionaria;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getHabilitado() {
		return Habilitado;
	}

	public void setHabilitado(String habilitado) {
		Habilitado = habilitado;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String direccion) {
		Direccion = direccion;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}

	public String getFecha_actualizacion() {
		return Fecha_actualizacion;
	}

	public void setFecha_actualizacion(String fecha_actualizacion) {
		Fecha_actualizacion = fecha_actualizacion;
	}

	public ConcesionariasDetalles() { }


}
