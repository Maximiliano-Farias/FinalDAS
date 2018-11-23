package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariasCabecera extends DynaActionForm {

	private String    id_concesionarias;
	private String    Descripcion;
	

	public ConcesionariasCabecera() { }
	
   
	public String getId_concesionarias() {
		return id_concesionarias;
	}




	public void setId_concesionarias(String id_concesionarias) {
		this.id_concesionarias = id_concesionarias;
	}




	public String getDescripcion() {
		return Descripcion;
	}




	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}




}
