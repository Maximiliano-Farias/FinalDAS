package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ListadoSorteosCabecera extends DynaActionForm {

	private LinkedList<SorteosCabecera> sorteos;
	
	
   
	public ListadoSorteosCabecera() { }



	public LinkedList<SorteosCabecera> getSorteos() {
		return sorteos;
	}



	public void setSorteos(LinkedList<SorteosCabecera> sorteos) {
		this.sorteos = sorteos;
	}



	


}
