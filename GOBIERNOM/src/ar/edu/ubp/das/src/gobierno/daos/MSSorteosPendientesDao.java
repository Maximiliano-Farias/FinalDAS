package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;
import java.util.List;

import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.AutoForm;
import ar.edu.ubp.das.src.gobierno.forms.EstadisticasForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoSorteosCabecera;
import ar.edu.ubp.das.src.gobierno.forms.ListadoSorteosPendientes;
import ar.edu.ubp.das.src.gobierno.forms.SorteosPendientes;


public class MSSorteosPendientesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
    	return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DynaActionForm select(DynaActionForm form) throws SQLException {
    	
		LinkedList<SorteosPendientes> sorteos;
    	sorteos= new LinkedList<SorteosPendientes>();
    	SorteosPendientes sorteo;
    	ListadoSorteosPendientes  Listado;
    	Listado = new ListadoSorteosPendientes();
    	
		
		this.connect();
		
		this.setProcedure("dbo.SORTEOS_PENDIENTES()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0)
        	{	
	            sorteo = new SorteosPendientes();
	        	sorteo.setFecha(result.getString("Fecha_sorteo"));
	        	sorteo.setNro_sorteo(result.getString("nro_sorteo"));
	        	sorteo.setDescripcion(result.getString("Descripcion"));
	        	sorteo.setDescripcion(result.getString("Estado"));
	        	sorteos.add(sorteo);
	        	result.next();
        	}
        	
               
		this.disconnect();
		Listado.setSorteos(sorteos);
		return  Listado;
    	
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
