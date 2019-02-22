package ar.edu.ubp.das.src.gobierno.forms;

import java.util.Date;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class GanadorForm extends DynaActionForm {

	private String    Fecha_Sorteo;
	private Date      Fecha_original;
	private String    Descripcion;
	private String    Estado;
	private String    Ganador;
	private String    Nombre_Auto;
	private String    Consesionaria;
	private String    Marca;
	private String    Tipo_Modelo;
	private String    nro_sorteo;
	private String    id_persona;
	private String    Identificador;
	private String    Id_Concesioria;
	private String    Nro_marca;
	private String    Nombre;
	private String    Apellido;
	

	public Date getFecha_original() {
		return Fecha_original;
	}


	public void setFecha_original(Date fecha_original) {
		Fecha_original = fecha_original;
	}
	
	public String getNro_sorteo() {
		return nro_sorteo;
	}


	public void setNro_sorteo(String nro_sorteo) {
		this.nro_sorteo = nro_sorteo;
	}


	public String getId_persona() {
		return id_persona;
	}


	public void setId_persona(String id_persona) {
		this.id_persona = id_persona;
	}


	public String getIdentificador() {
		return Identificador;
	}


	public void setIdentificador(String identificador) {
		Identificador = identificador;
	}


	public String getId_Concesioria() {
		return Id_Concesioria;
	}


	public void setId_Concesioria(String id_Concesioria) {
		Id_Concesioria = id_Concesioria;
	}


	public String getNro_marca() {
		return Nro_marca;
	}


	public void setNro_marca(String nro_marca) {
		Nro_marca = nro_marca;
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


	public GanadorForm() { }
	
	
	public String getFecha_Sorteo() {
		return Fecha_Sorteo;
	}
	public void setFecha_Sorteo(String fecha_Sorteo) {
		Fecha_Sorteo = fecha_Sorteo;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public String getGanador() {
		return Ganador;
	}
	public void setGanador(String ganador) {
		Ganador = ganador;
	}
	public String getNombre_Auto() {
		return Nombre_Auto;
	}
	public void setNombre_Auto(String nombre_Auto) {
		Nombre_Auto = nombre_Auto;
	}
	public String getConsesionaria() {
		return Consesionaria;
	}
	public void setConsesionaria(String consesionaria) {
		Consesionaria = consesionaria;
	}
	public String getMarca() {
		return Marca;
	}
	public void setMarca(String marca) {
		Marca = marca;
	}
	public String getTipo_Modelo() {
		return Tipo_Modelo;
	}
	public void setTipo_Modelo(String tipo_Modelo) {
		Tipo_Modelo = tipo_Modelo;
	}

	
	
 

}
