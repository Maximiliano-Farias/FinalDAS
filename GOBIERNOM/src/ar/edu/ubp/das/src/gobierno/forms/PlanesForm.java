package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class PlanesForm extends DynaActionForm {

	private LinkedList<PlanForm> planes;
	




	public LinkedList<PlanForm> getPlanes() {
		return planes;
	}





	public void setPlanes(LinkedList<PlanForm> planes) {
		this.planes = planes;
	}





	public PlanesForm() { }

	


}
