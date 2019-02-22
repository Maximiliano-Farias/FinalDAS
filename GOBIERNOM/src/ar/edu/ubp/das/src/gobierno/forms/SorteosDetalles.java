package ar.edu.ubp.das.src.gobierno.forms;

import java.util.Date;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class SorteosDetalles extends DynaActionForm {

	private String    Estado;
	private String    Concesionaria;
	private String    Nombre_Auto;
	private String    Tipo_Modelo;
	private Date    Fecha_Notificacion;
	private String    Ganador;
	private String    Error;
	
	
   
	public SorteosDetalles() { }



	public String getEstado() {
		return Estado;
	}



	public void setEstado(String estado) {
		Estado = estado;
	}



	public String getConcesionaria() {
		return Concesionaria;
	}



	public void setConcesionaria(String concesionaria) {
		Concesionaria = concesionaria;
	}



	public String getNombre_Auto() {
		return Nombre_Auto;
	}



	public void setNombre_Auto(String nombre_Auto) {
		Nombre_Auto = nombre_Auto;
	}



	public String getTipo_Modelo() {
		return Tipo_Modelo;
	}



	public void setTipo_Modelo(String tipo_Modelo) {
		Tipo_Modelo = tipo_Modelo;
	}



	public Date getFecha_Notificacion() {
		return Fecha_Notificacion;
	}



	public void setFecha_Notificacion(Date fecha_Notificacion) {
		Fecha_Notificacion = fecha_Notificacion;
	}



	public String getGanador() {
		return Ganador;
	}



	public void setGanador(String ganador) {
		Ganador = ganador;
	}



	public String getError() {
		return Error;
	}



	public void setError(String error) {
		Error = error;
	}



}
