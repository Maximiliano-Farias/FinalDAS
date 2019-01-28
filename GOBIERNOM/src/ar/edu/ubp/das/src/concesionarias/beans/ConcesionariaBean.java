package ar.edu.ubp.das.src.concesionarias.beans;

import java.util.LinkedList;

public class ConcesionariaBean {

	private String id_concesionaria;
	private String nombre;
	private String habilitado;
	private String direccion;
	private String telefono;
	private String email;
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
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getHabilitado() {
		return habilitado;
	}

	public void setHabilitado(String habilitado) {
		this.habilitado = habilitado;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
