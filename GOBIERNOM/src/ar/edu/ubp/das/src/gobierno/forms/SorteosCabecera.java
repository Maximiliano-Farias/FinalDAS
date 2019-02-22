package ar.edu.ubp.das.src.gobierno.forms;


import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class SorteosCabecera extends DynaActionForm {

	private String    nro_sorteo;
	private String    Fecha;
	private String    Descripcion;
	
	
   
	public SorteosCabecera() { }



	public String getNro_sorteo() {
		return nro_sorteo;
	}



	public void setNro_sorteo(String nro_sorteo) {
		this.nro_sorteo = nro_sorteo;
	}



	public String getFecha() {
		return Fecha;
	}



	public void setFecha(String string) {
		Fecha = string;
	}



	public String getDescripcion() {
		return Descripcion;
	}



	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

	


}
