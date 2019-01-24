package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;

public class MSGuardarNotificacionDao extends DaoImpl {

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
		String error="";
		this.connect();
		this.setProcedure("dbo.Set_Notificado (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	       if(form.getItem("ganador").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"Error al obtener el ID GANADOR", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.CHAR);		        	
	        }
	        else {
	        	this.setParameter(1,(form.getItem("ganador")));        	
	        }
        	try
        	{	this.executeUpdate();
        	    this.disconnect();
        		this.connect();
        		this.setProcedure("dbo.Set_Estado_Sorteo (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        	       if(form.getItem("ganador").isEmpty()) {
        			  JOptionPane.showMessageDialog(null,"Error al obtener ID GANADOR", "ERROR", JOptionPane.ERROR_MESSAGE);
        			  this.setNull(1, Types.CHAR);		        	
        	        }
        	        else {
        	        	this.setParameter(1,"F");        	
        	        }
        	       
        	       this.executeUpdate();
           	       this.disconnect();
	       }catch(SQLException e){
		         error=e.getMessage();
        	}
        	
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
