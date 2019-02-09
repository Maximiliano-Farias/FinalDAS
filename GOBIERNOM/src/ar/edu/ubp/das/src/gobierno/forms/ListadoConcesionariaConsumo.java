package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ListadoConcesionariaConsumo extends DynaActionForm {

	private LinkedList<ConcesionariaConsumo> concesionarias;
	
	public LinkedList<ConcesionariaConsumo> getConcesionarias() {
		return concesionarias;
	}

	public void setConcesionarias(LinkedList<ConcesionariaConsumo> concesionarias) {
		this.concesionarias = concesionarias;
	}

	public ListadoConcesionariaConsumo() { }


}
