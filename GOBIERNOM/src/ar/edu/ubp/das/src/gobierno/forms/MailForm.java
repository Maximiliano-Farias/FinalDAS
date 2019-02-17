package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;
import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class MailForm extends DynaActionForm {

	private String    fecha;
	private String    ganador;
	private String    identificador;
	private String    auto;
	private String    modelo;
	private String    concesionaria;
	private String    direccion_concesionaria;
	private LinkedList<String>  mails;
	

	public String getFecha() {
		return fecha;
	}


	public void setFecha(String fecha) {
		this.fecha = fecha;
	}


	public String getGanador() {
		return ganador;
	}


	public void setGanador(String ganador) {
		this.ganador = ganador;
	}


	public String getIdentificador() {
		return identificador;
	}


	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}


	public String getAuto() {
		return auto;
	}


	public void setAuto(String auto) {
		this.auto = auto;
	}


	public String getModelo() {
		return modelo;
	}


	public void setModelo(String modelo) {
		this.modelo = modelo;
	}


	public String getConcesionaria() {
		return concesionaria;
	}


	public void setConcesionaria(String concesionaria) {
		this.concesionaria = concesionaria;
	}


	public String getDireccion_concesionaria() {
		return direccion_concesionaria;
	}


	public void setDireccion_concesionaria(String direccion_concesionaria) {
		this.direccion_concesionaria = direccion_concesionaria;
	}


	public LinkedList<String> getMails() {
		return mails;
	}

	public void setMails(LinkedList<String> mails) {
		this.mails = mails;
	}


	public MailForm() { }
	
   


}
