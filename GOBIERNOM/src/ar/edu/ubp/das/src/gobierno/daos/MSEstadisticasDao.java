package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.AutoForm;
import ar.edu.ubp.das.src.gobierno.forms.EstadisticasForm;




public class MSEstadisticasDao extends DaoImpl {

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
    	

    	EstadisticasForm estadisticas = null;
    	AutoForm auto = null;
    	LinkedList<AutoForm> autos;
    	autos= new LinkedList<AutoForm>();
    	estadisticas = new EstadisticasForm();
		
    	
    	/**************************CANTIDAD DE CONCESIONARIAS*************************************/
		this.connect();
		this.setProcedure("Cantidad_Concesionarios() ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        while(result.getRow() > 0)
        	{	
        	        if (result.getString("habilitado").equals("1") )
	        		{
	        			estadisticas.setCantidad_Concesionarias_Activas(result.getInt("Cantidad"));
	        		}
        		else
	        		{
	        			estadisticas.setCantidad_Concesionarias_No_Activas(result.getInt("Cantidad"));
	        		}
        	
        		result.next();
        	} 	
            
            estadisticas.setTotal_Concesionarias(estadisticas.getCantidad_Concesionarias_Activas() + estadisticas.getCantidad_Concesionarias_No_Activas());
		this.disconnect();
		
		
		/**************************CANTIDAD DE CONCESIONARIAS*************************************/
		this.connect();
		this.setProcedure("Cantidad_Planes() ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		ResultSet result1 = this.getStatement().executeQuery();

		result1.next();
        	
         if(result1.getRow() > 0)
        	{	
        		estadisticas.setTotal_Planes(result1.getString("Cantidad_Planes"));
        	
        	} 	            
         this.disconnect();
         
         /**************************CANTIDAD DE AUTOS*************************************/
 		this.connect();
 		this.setProcedure("Autos_Vendidos() ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
 		ResultSet result2 = this.getStatement().executeQuery();

 		result2.next();
         	
 		while(result2.getRow() > 0 )
         	{	
 			    auto = new AutoForm();
 			    auto.setMarca(result2.getString("Nombre"));
 			    auto.setNombre_Auto(result2.getString("Nombre_Auto"));
 			    auto.setTipo_Auto(result2.getString("Tipo_modelo"));
 			    auto.setCantidad(result2.getInt("Cantidad"));
         		autos.add(auto);
         		result2.next();
         	} 	            
          this.disconnect();
		
		estadisticas.setAutos(autos);
		
		return estadisticas;
		
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
