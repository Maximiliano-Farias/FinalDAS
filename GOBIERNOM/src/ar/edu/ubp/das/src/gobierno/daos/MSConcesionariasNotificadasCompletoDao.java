package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;

public class MSConcesionariasNotificadasCompletoDao extends DaoImpl {

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
		
		RespuestaForm respuesta = new RespuestaForm();
        respuesta.setRespuesta("SI");
		this.connect();
		
		this.setProcedure("dbo.Concesionarias_Sin_Notificar()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0 )
        	{	
        		respuesta.setRespuesta("NO");
        	   
        	    result.next();
    
        	}
        	
        	this.disconnect();
 	
        return respuesta;
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		String Respuesta = "SI";
		
                     //       INSERTO LA ACTUALIZACION
 		
 		this.connect();
 		this.setProcedure("dbo.notificada_con_ganador(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);   
 	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria()); 
 	    this.executeUpdate();            
 		this.disconnect();		
   		return Respuesta;
   		
	}
		

	

}
