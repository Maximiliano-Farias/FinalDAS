package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ListadoSorteosPendientes extends DynaActionForm {

	private LinkedList<SorteosPendientes> sorteos;
	

	public LinkedList<SorteosPendientes> getSorteos() {
		return sorteos;
	}


	public void setSorteos(LinkedList<SorteosPendientes> sorteos) {
		this.sorteos = sorteos;
	}


	public ListadoSorteosPendientes() { }

	


}
