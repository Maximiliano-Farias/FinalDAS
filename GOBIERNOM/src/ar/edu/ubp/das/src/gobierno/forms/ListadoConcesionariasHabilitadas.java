package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ListadoConcesionariasHabilitadas extends DynaActionForm {

	private LinkedList<ConcesionariasDetalles> concesionarias;
	
	
   
	public ListadoConcesionariasHabilitadas() { }



	public LinkedList<ConcesionariasDetalles> getConcesionarias() {
		return concesionarias;
	}



	public void setConcesionarias(LinkedList<ConcesionariasDetalles> concesionarias) {
		this.concesionarias = concesionarias;
	}



	


}
