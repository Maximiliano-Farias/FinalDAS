package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariasDetalles;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariasHabilitadas;

public class MSConcesionariasHabilitadasDao extends DaoImpl {

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
    	
		LinkedList<ConcesionariasDetalles> concesionarias;
    	concesionarias= new LinkedList<ConcesionariasDetalles>();
    	ConcesionariasDetalles concesionaria;
    	ListadoConcesionariasHabilitadas  Listado;
    	Listado = new ListadoConcesionariasHabilitadas();
    	
		
		this.connect();
		
		this.setProcedure("dbo.Obtener_Concesionarias_habilitadas()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0)
        	{	
	            concesionaria = new ConcesionariasDetalles();
	            concesionaria.setTelefono(result.getString("Telefono"));
	            concesionaria.setNombre(result.getString("Nombre"));
	            concesionaria.setDireccion(result.getString("Direccion"));
	        	concesionarias.add(concesionaria);
	        	result.next();
        	}
        	
               
		this.disconnect();
		Listado.setConcesionarias(concesionarias);
	
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
