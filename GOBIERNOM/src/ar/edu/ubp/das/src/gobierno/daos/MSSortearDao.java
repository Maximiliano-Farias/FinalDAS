package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.SorteosPendientes;




public class MSSortearDao extends DaoImpl {

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
    	
		SorteosPendientes detalles = new SorteosPendientes();
		this.connect();
		
		this.setProcedure("A_Sortear() ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	if(result.getRow() > 0)
        	{	
	            detalles = new SorteosPendientes();
	        	detalles.setFecha(result.getString("Fecha_sorteo"));
	        	detalles.setDescripcion(result.getString("Descripcion"));
	        	detalles.setNro_sorteo(result.getString("nro_sorteo"));
	        	
        	}
        	else{
        		detalles.setFecha("SS");
        	}
        	      
		this.disconnect();
		return  detalles;
    	
		
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
