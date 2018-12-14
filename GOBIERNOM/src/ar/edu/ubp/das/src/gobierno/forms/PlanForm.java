package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class PlanForm extends DynaActionForm {

	private String    id_persona;
	private String    Identificador;
	private String    Apellido;
	private String    Nombre;
	private String    Nombre_Auto;
	private String    Tipo_modelo;
	

	public PlanForm() { }


	public String getId_persona() {
		return id_persona;
	}



	public void setId_persona(String id_persona) {
		this.id_persona = id_persona;
	}



	public String getIdentificador() {
		return Identificador;
	}



	public void setIdentificador(String identificador) {
		Identificador = identificador;
	}



	public String getApellido() {
		return Apellido;
	}



	public void setApellido(String apellido) {
		Apellido = apellido;
	}



	public String getNombre() {
		return Nombre;
	}



	public void setNombre(String nombre) {
		Nombre = nombre;
	}



	public String getNombre_Auto() {
		return Nombre_Auto;
	}



	public void setNombre_Auto(String nombre_Auto) {
		Nombre_Auto = nombre_Auto;
	}



	public String getTipo_modelo() {
		return Tipo_modelo;
	}



	public void setTipo_modelo(String tipo_modelo) {
		Tipo_modelo = tipo_modelo;
	}
	
	
}
