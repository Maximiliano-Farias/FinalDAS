package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ResultadoSorteoForm extends DynaActionForm {

	
	private String    Fecha_Sorteo;
	private String    Descripcion;
	private String    Estado;
	private String    Ganador;
	private String    Nombre_Auto;
	private String    Consesionaria;
	private String    Marca;
	private String    Tipo_Modelo;
	private String    Identificador;
	private String    Email_Ganador;
	private String    Email_Concesionaria;
	private String    Telefono;
	private String    Direccion_Ganador;
	private String    Direccion_Concesionaria;
	private String    Respuesta;
	
	public String getRespuesta() {
		return Respuesta;
	}


	public void setRespuesta(String respuesta) {
		Respuesta = respuesta;
	}


	public String getIdentificador() {
		return Identificador;
	}


	public void setIdentificador(String identificador) {
		Identificador = identificador;
	}


	public String getEmail_Ganador() {
		return Email_Ganador;
	}


	public void setEmail_Ganador(String email_Ganador) {
		Email_Ganador = email_Ganador;
	}


	public String getEmail_Concesionaria() {
		return Email_Concesionaria;
	}


	public void setEmail_Concesionaria(String email_Concesionaria) {
		Email_Concesionaria = email_Concesionaria;
	}


	public String getTelefono() {
		return Telefono;
	}


	public void setTelefono(String telefono) {
		Telefono = telefono;
	}


	public String getDireccion_Ganador() {
		return Direccion_Ganador;
	}


	public void setDireccion_Ganador(String direccion_Ganador) {
		Direccion_Ganador = direccion_Ganador;
	}


	public String getDireccion_Concesionaria() {
		return Direccion_Concesionaria;
	}


	public void setDireccion_Concesionaria(String direccion_Concesionaria) {
		Direccion_Concesionaria = direccion_Concesionaria;
	}


	public ResultadoSorteoForm() { }
	
	
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
