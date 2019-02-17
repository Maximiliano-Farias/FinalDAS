package ar.edu.ubp.das.src.gobierno.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class EstadisticasForm extends DynaActionForm {

	private int    Cantidad_Concesionarias_Activas;
	private int    Cantidad_Concesionarias_No_Activas;
	private int    Total_Concesionarias;
	private String    Total_Planes;
	private LinkedList<AutoForm> Autos;



	public EstadisticasForm() { }

	
	public LinkedList<AutoForm> getAutos() {
		return Autos;
	}



	public void setAutos(LinkedList<AutoForm> autos) {
		Autos = autos;
	}
	
	
	public int getCantidad_Concesionarias_Activas() {
		return Cantidad_Concesionarias_Activas;
	}



	public void setCantidad_Concesionarias_Activas(int cantidad_Concesionarias_Activas) {
		Cantidad_Concesionarias_Activas = cantidad_Concesionarias_Activas;
	}



	public int getCantidad_Concesionarias_No_Activas() {
		return Cantidad_Concesionarias_No_Activas;
	}



	public void setCantidad_Concesionarias_No_Activas(int cantidad_Concesionarias_No_Activas) {
		Cantidad_Concesionarias_No_Activas = cantidad_Concesionarias_No_Activas;
	}



	public int getTotal_Concesionarias() {
		return Total_Concesionarias;
	}



	public void setTotal_Concesionarias(int total_Concesionarias) {
		Total_Concesionarias = total_Concesionarias;
	}



	public String getTotal_Planes() {
		return Total_Planes;
	}



	public void setTotal_Planes(String total_Planes) {
		Total_Planes = total_Planes;
	}






}
