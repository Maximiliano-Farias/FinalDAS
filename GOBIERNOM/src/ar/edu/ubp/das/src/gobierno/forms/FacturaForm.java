package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class FacturaForm extends DynaActionForm {

	private Integer   nro_factura;
	private String    estado;
	private String    Fecha;
	private Integer   Monto;

	
   
	public FacturaForm() { }



	public Integer getNro_factura() {
		return nro_factura;
	}



	public void setNro_factura(Integer nro_factura) {
		this.nro_factura = nro_factura;
	}



	public String getEstado() {
		return estado;
	}



	public void setEstado(String estado) {
		this.estado = estado;
	}



	public String getFecha() {
		return Fecha;
	}



	public void setFecha(String fecha) {
		Fecha = fecha;
	}



	public Integer getMonto() {
		return Monto;
	}



	public void setMonto(Integer monto) {
		Monto = monto;
	}

	
}
