package ar.edu.ubp.das.src.gobierno.forms;

import java.sql.Date;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class SorteosPendientes extends DynaActionForm {

	private String    nro_sorteo;
	private String    Fecha;
	private Date      Fecha_original;
	private String    Descripcion;
	private String    Estado;
	private String    Permiso;
	


	public Date getFecha_original() {
		return Fecha_original;
	}



	public void setFecha_original(Date date) {
		Fecha_original = date;
	}



	public String getEstado() {
		return Estado;
	}



	public void setEstado(String estado) {
		Estado = estado;
	}



	public SorteosPendientes() { }



	public String getNro_sorteo() {
		return nro_sorteo;
	}



	public void setNro_sorteo(String nro_sorteo) {
		this.nro_sorteo = nro_sorteo;
	}



	public String getFecha() {
		return Fecha;
	}



	public void setFecha(String fecha) {
		Fecha = fecha;
	}



	public String getDescripcion() {
		return Descripcion;
	}



	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}


	   
	public String getPermiso() {
		return Permiso;
	}



	public void setPermiso(String permiso) {
		Permiso = permiso;
	}



}
