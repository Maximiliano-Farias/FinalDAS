package ar.edu.ubp.das.src.gobierno.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class DatosNotificaGanadorForm extends DynaActionForm {

	private GanadorForm    Ganador;
	private ListadoConcesionariaConsumo Concesionarias;

	

	public DatosNotificaGanadorForm() { }



	public GanadorForm getGanador() {
		return Ganador;
	}



	public void setGanador(GanadorForm ganador) {
		Ganador = ganador;
	}



	public ListadoConcesionariaConsumo getConcesionarias() {
		return Concesionarias;
	}



	public void setConcesionarias(ListadoConcesionariaConsumo concesionarias) {
		Concesionarias = concesionarias;
	}
	
	

}
