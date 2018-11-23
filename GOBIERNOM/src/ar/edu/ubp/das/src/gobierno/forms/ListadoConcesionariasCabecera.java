package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ListadoConcesionariasCabecera extends DynaActionForm {

	private LinkedList<ConcesionariasCabecera> concesionarias;
	
	
   
	public ListadoConcesionariasCabecera() { }



	public LinkedList<ConcesionariasCabecera> getConcesionarias() {
		return concesionarias;
	}



	public void setConcesionarias(LinkedList<ConcesionariasCabecera> concesionarias) {
		this.concesionarias = concesionarias;
	}



	


}
