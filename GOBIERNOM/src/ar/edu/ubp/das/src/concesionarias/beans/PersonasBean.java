package ar.edu.ubp.das.src.concesionarias.beans;


public class PersonasBean {

	private int id_persona;
	private String nombre;
	private String apellido;
	private String direccion;
	private String identificador;
	private String mail;
	private int nro_identificador;
	private String telefono;
	

	public int getId_persona() {
		return id_persona;
	}


	public void setId_persona(int id_persona) {
		this.id_persona = id_persona;
	}


	public String getIdentificador() {
		return identificador;
	}


	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public int getNro_identificador() {
		return nro_identificador;
	}


	public void setNro_identificador(int nro_identificador) {
		this.nro_identificador = nro_identificador;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public PersonasBean() { }
	
	
	
}
