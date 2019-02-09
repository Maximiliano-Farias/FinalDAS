package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariaConsumo extends DynaActionForm {

	private String    Id_concesionaria;
	private String    Direccion_url;
	private String    Metodo;
	private String    Servicio;
	
	
	public String getServicio() {
		return Servicio;
	}




	public void setServicio(String servicio) {
		Servicio = servicio;
	}




	public String getId_concesionaria() {
		return Id_concesionaria;
	}




	public void setId_concesionaria(String id_concesionaria) {
		Id_concesionaria = id_concesionaria;
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



	public ConcesionariaConsumo() { }


}
