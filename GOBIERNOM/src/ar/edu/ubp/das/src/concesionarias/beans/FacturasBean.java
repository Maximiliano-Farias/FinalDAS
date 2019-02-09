package ar.edu.ubp.das.src.concesionarias.beans;


public class FacturasBean {

	private int nro_factura;
	private String estado;
	private float monto;
	private String identificador;
	private String fecha;
	private String cobro;
	
	public String getCobro() {
		return cobro;
	}

	public void setCobro(String Cobro) {
		cobro = Cobro;
	}

	public FacturasBean() { }

	public int getNro_factura() {
		return nro_factura;
	}

	public void setNro_factura(int nro_factura) {
		this.nro_factura = nro_factura;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public float getMonto() {
		return monto;
	}

	public void setMonto(float monto) {
		this.monto = monto;
	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	
}
