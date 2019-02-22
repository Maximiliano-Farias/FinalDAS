package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;

public class EstadoCuentaForm extends DynaActionForm {

	private LinkedList<FacturaForm> Facturas;
	private Integer Monto_Adeudado;
	private String Nombre_Auto;
	private String Tipo_Modelo;
	private String Nombre;
	private String Fecha_actualizada;
	private String Dominio;
	private String Chasis;
	private String Motor;
	
	
	
	
	public String getDominio() {
		return Dominio;
	}

	public void setDominio(String dominio) {
		Dominio = dominio;
	}

	public String getChasis() {
		return Chasis;
	}

	public void setChasis(String chasis) {
		Chasis = chasis;
	}

	public String getMotor() {
		return Motor;
	}

	public void setMotor(String motor) {
		Motor = motor;
	}

	private LinkedList<ConcesionariaBean> Concesionarias;
	
	public LinkedList<ConcesionariaBean> getConcesionarias() {
		return Concesionarias;
	}

	public void setConcesionarias(LinkedList<ConcesionariaBean> concesionarias) {
		Concesionarias = concesionarias;
	}

	public String getFecha_actualizada() {
		return Fecha_actualizada;
	}

	public void setFecha_actualizada(String fecha_actualizada) {
		Fecha_actualizada = fecha_actualizada;
	}

	public EstadoCuentaForm() { }

	public LinkedList<FacturaForm> getFacturas() {
		return Facturas;
	}

	public void setFacturas(LinkedList<FacturaForm> facturas) {
		Facturas = facturas;
	}

	public Integer getMonto_Adeudado() {
		return Monto_Adeudado;
	}

	public void setMonto_Adeudado(Integer monto_Adeudado) {
		Monto_Adeudado = monto_Adeudado;
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

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}




	


}
