package ar.edu.ubp.das.forms;

import java.util.LinkedList;

public class ConcesionariaBean {

	private String id_concesionaria;
	private String Nombre;
	private String Habilitado;
	private String Direccion;
	private String Telefono;
	private String Email;
	private LinkedList<PersonasBean> personas;
	private LinkedList<PlanesBean> planes;
	private LinkedList<FacturasBean> facturas;
	
	public ConcesionariaBean() { }

	public String getId_concesionaria() {
		return id_concesionaria;
	}

	public void setId_concesionaria(String id_concesionaria) {
		this.id_concesionaria = id_concesionaria;
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

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public LinkedList<PersonasBean> getPersonas() {
		return personas;
	}

	public void setPersonas(LinkedList<PersonasBean> personas) {
		this.personas = personas;
	}

	public LinkedList<PlanesBean> getPlanes() {
		return planes;
	}

	public void setPlanes(LinkedList<PlanesBean> planes) {
		this.planes = planes;
	}

	public LinkedList<FacturasBean> getFacturas() {
		return facturas;
	}

	public void setFacturas(LinkedList<FacturasBean> facturas) {
		this.facturas = facturas;
	}

	
	
	
}
