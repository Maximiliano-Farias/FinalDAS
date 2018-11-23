package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class AutoForm extends DynaActionForm {

	private String    Nombre_Auto;
	private String    Tipo_Auto;
	private String    Marca;
	private int       Cantidad;
	

	public AutoForm() { }
	
	
	public int getCantidad() {
		return Cantidad;
	}


	public void setCantidad(int cantidad) {
		Cantidad = cantidad;
	}


	public String getNombre_Auto() {
		return Nombre_Auto;
	}



	public void setNombre_Auto(String nombre_Auto) {
		Nombre_Auto = nombre_Auto;
	}



	public String getTipo_Auto() {
		return Tipo_Auto;
	}



	public void setTipo_Auto(String tipo_Auto) {
		Tipo_Auto = tipo_Auto;
	}



	public String getMarca() {
		return Marca;
	}



	public void setMarca(String marca) {
		Marca = marca;
	}

	

}
