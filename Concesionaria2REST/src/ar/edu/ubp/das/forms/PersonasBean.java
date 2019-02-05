package ar.edu.ubp.das.forms;


public class PersonasBean {

	private int id_persona;
	private String Nombre;
	private String Apellido;
	private String Direccion;
	private String Mail;
	private int nro_identificador;
	private String Telefono;
	private String Identificador;
	
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

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getApellido() {
		return Apellido;
	}

	public void setApellido(String apellido) {
		Apellido = apellido;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String direccion) {
		Direccion = direccion;
	}

	public String getMail() {
		return Mail;
	}

	public void setMail(String mail) {
		Mail = mail;
	}

	public int getNro_identificador() {
		return nro_identificador;
	}

	public void setNro_identificador(int nro_identificador) {
		this.nro_identificador = nro_identificador;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}

	public PersonasBean() { }
	
	
	
}
