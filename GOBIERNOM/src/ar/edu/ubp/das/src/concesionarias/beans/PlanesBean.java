package ar.edu.ubp.das.src.concesionarias.beans;


public class PlanesBean {

	private int id_plan;
	private String id_concesionaria;
	private String identificador;
	private int id_persona;
	private int nro_marca;
	private String nombre_Auto;
	private String tipo_Modelo;
	
	

	public PlanesBean() { }



	public int getId_plan() {
		return id_plan;
	}



	public void setId_plan(int id_plan) {
		this.id_plan = id_plan;
	}



	public String getId_concesionaria() {
		return id_concesionaria;
	}



	public void setId_concesionaria(String id_concesionaria) {
		this.id_concesionaria = id_concesionaria;
	}



	public String getIdentificador() {
		return identificador;
	}



	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}



	public int getId_persona() {
		return id_persona;
	}



	public void setId_persona(int id_persona) {
		this.id_persona = id_persona;
	}



	public int getNro_marca() {
		return nro_marca;
	}



	public void setNro_marca(int nro_marca) {
		this.nro_marca = nro_marca;
	}



	public String getNombre_Auto() {
		return nombre_Auto;
	}



	public void setNombre_Auto(String nombre_Auto) {
		this.nombre_Auto = nombre_Auto;
	}



	public String getTipo_Modelo() {
		return tipo_Modelo;
	}



	public void setTipo_Modelo(String tipo_Modelo) {
		this.tipo_Modelo = tipo_Modelo;
	}


		
}
