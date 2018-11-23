package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class GanadorForm extends DynaActionForm {

	
	private String    Fecha_Sorteo;
	private String    Descripcion;
	private String    Estado;
	private String    Ganador;
	private String    Nombre_Auto;
	private String    Consesionaria;
	private String    Marca;
	private String    Tipo_Modelo;
	
	
	public GanadorForm() { }
	
	
	public String getFecha_Sorteo() {
		return Fecha_Sorteo;
	}
	public void setFecha_Sorteo(String fecha_Sorteo) {
		Fecha_Sorteo = fecha_Sorteo;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public String getGanador() {
		return Ganador;
	}
	public void setGanador(String ganador) {
		Ganador = ganador;
	}
	public String getNombre_Auto() {
		return Nombre_Auto;
	}
	public void setNombre_Auto(String nombre_Auto) {
		Nombre_Auto = nombre_Auto;
	}
	public String getConsesionaria() {
		return Consesionaria;
	}
	public void setConsesionaria(String consesionaria) {
		Consesionaria = consesionaria;
	}
	public String getMarca() {
		return Marca;
	}
	public void setMarca(String marca) {
		Marca = marca;
	}
	public String getTipo_Modelo() {
		return Tipo_Modelo;
	}
	public void setTipo_Modelo(String tipo_Modelo) {
		Tipo_Modelo = tipo_Modelo;
	}

	
	
 

}
