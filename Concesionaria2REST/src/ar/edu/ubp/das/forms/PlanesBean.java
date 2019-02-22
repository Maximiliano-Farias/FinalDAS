package ar.edu.ubp.das.forms;


public class PlanesBean {

	private int id_plan;
	private String id_concesionaria;
	private String Identificador;
	private int id_persona;
	private int nro_marca;
	private String Nombre_Auto;
	private String Tipo_Modelo;
	private String    Dominio;
	private String    Chasis;
	private String    Motor;
	

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
		return Identificador;
	}



	public void setIdentificador(String identificador) {
		Identificador = identificador;
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
	
		
}
