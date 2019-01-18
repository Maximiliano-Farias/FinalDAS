package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;

public class MSConcesionariasActualizadasDao extends DaoImpl {

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
		String condicion ="SI";
		String error="";

		this.connect();
		
		this.setProcedure("dbo.concesionarias_en_condiciones", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0)
        	{	
	            condicion= result.getString("actualizada");
	            if(condicion.equals("SI")) 
	            {
	            	condicion="SI";
	            }
	            else
	            {
	            	error = error + result.getString("id_concesionaria");
	            }
	        	result.next();
        	}     
		this.disconnect();

        if (error == "")
        {
        	respuesta.setRespuesta("SI");
        }
        else{
        	respuesta.setRespuesta(error);
        }

		return  respuesta;
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
