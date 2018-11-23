package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class RespuestaForm extends DynaActionForm {

	private String    Respuesta;
	
	
	
	public RespuestaForm() { }

	public String getRespuesta() {
		return Respuesta;
	}

	public void setRespuesta(String respuesta) {
		Respuesta = respuesta;
	}


}
