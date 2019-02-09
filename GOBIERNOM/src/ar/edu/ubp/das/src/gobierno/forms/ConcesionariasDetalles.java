package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariasDetalles extends DynaActionForm {

	private String    Nombre;
	private String    Habilitado;
	private String    Direccion;
	private String    Telefono;
	private String    Fecha_actualizacion;
	private String    Id_concesionaria;
	private String    Direccion_url;
	private String    Metodo;
	private String    Metodo_pago;
	private String    Servicio;
	
	
	
	public String getServicio() {
		return Servicio;
	}

	public void setServicio(String servicios) {
		Servicio = servicios;
	}

	public String getDireccion_url() {
		return Direccion_url;
	}

	public void setDireccion_url(String direccion_url) {
		Direccion_url = direccion_url;
	}

	public String getMetodo() {
		return Metodo;
	}

	public void setMetodo(String metodo) {
		Metodo = metodo;
	}

	public String getMetodo_pago() {
		return Metodo_pago;
	}

	public void setMetodo_pago(String metodo_pago) {
		Metodo_pago = metodo_pago;
	}

	private String    Permiso;
	
   
	public String getPermiso() {
		return Permiso;
	}

	public void setPermiso(String permiso) {
		Permiso = permiso;
	}

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
