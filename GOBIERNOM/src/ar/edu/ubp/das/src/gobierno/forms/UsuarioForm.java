package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class UsuarioForm extends DynaActionForm {

	private String    Nombre_Usuario;
	private String    Nombre;
	private String    Apellido;
	private String    Permiso;
	private String    Dni;
	private String    Direccion;
	private String    Mail;
	private String    Telefono;
	private String    Id_Plan;
	
	
	public String getId_Plan() {
		return Id_Plan;
	}

	public void setId_Plan(String id_Plan) {
		Id_Plan = id_Plan;
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

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}

	public String getDni() {
		return Dni;
	}

	public void setDni(String dni) {
		Dni = dni;
	}

	public String getPermiso() {
		return Permiso;
	}

	public void setPermiso(String permiso) {
		Permiso = permiso;
	}
   
	public UsuarioForm() { }

	public String getNombre_Usuario() {
		return Nombre_Usuario;
	}


	public void setNombre_Usuario(String Nombre_Usuario) {
		this.Nombre_Usuario = Nombre_Usuario;
	}


}
