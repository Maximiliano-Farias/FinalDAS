package ar.edu.ubp.das.forms;



public class FacturasBean   {

	private int nro_factura;
	private String Estado;
	private float Monto;
	private String Identificador;
	private String Fecha;
	private String Cobro;
	
	public String getCobro() {
		return Cobro;
	}

	public void setCobro(String cobro) {
		Cobro = cobro;
	}

	public FacturasBean() { }

	public int getNro_factura() {
		return nro_factura;
	}

	public void setNro_factura(int nro_factura) {
		this.nro_factura = nro_factura;
	}

	public String getEstado() {
		return Estado;
	}

	public void setEstado(String estado) {
		Estado = estado;
	}

	public float getMonto() {
		return Monto;
	}

	public void setMonto(float monto) {
		Monto = monto;
	}

	public String getIdentificador() {
		return Identificador;
	}

	public void setIdentificador(String identificador) {
		Identificador = identificador;
	}

	public String getFecha() {
		return Fecha;
	}

	public void setFecha(String fecha) {
		Fecha = fecha;
	}
	
	
	
}
