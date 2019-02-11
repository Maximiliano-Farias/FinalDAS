package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.ResultadoSorteoForm;


public class MSGanadorSorteoDao extends DaoImpl {

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
    	
		ResultadoSorteoForm respuesta;
		String res;
    	respuesta= new ResultadoSorteoForm();
    	
    	this.connect();
        this.setProcedure("dbo.Hay_ganador", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0)
        	{	
	            res= result.getString("Respuesta");
	            if(res.equals("SI")) 
	            {
	            	
                   this.connect();
	        		
	        		this.setProcedure("dbo.datos_ganador ()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	                
	        		ResultSet result2 = this.getStatement().executeQuery();

	                result2.next();
	                respuesta.setRespuesta("NO");
	                	while(result2.getRow() > 0)
	                	{	
	        	            respuesta.setIdentificador(result2.getString("Identificador"));
	        	            respuesta.setGanador(result2.getString("Ganador"));
	        	            respuesta.setNombre_Auto(result2.getString("Nombre_Auto"));
	        	            respuesta.setTipo_Modelo(result2.getString("Tipo_modelo"));
	        	            respuesta.setConsesionaria(result2.getString("Nombre"));
	        	            respuesta.setEmail_Ganador(result2.getString("Mail"));
	        	            respuesta.setEmail_Concesionaria(result2.getString("EMail"));
	        	            respuesta.setTelefono(result2.getString("Telefono"));
	        	            respuesta.setDireccion_Ganador(result2.getString("Direccion_Ganador"));
	        	            respuesta.setDireccion_Concesionaria(result2.getString("Direccion_Concesionaria"));
	        	            respuesta.setFecha_Sorteo(form.getItem("fecha"));
	        	            respuesta.setRespuesta("SI");
	        	        	result2.next();
	                	}
	                	
	                       
	        		this.disconnect();
	            	
	            	
	            	
	            	
	            }
	            else
	            {
	            	
	            	this.connect();
	        		
	        		this.setProcedure("dbo.Ganador_Sorteo ()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	                
	        		ResultSet result2 = this.getStatement().executeQuery();

	                result2.next();
	                respuesta.setRespuesta("NO");
	                	while(result2.getRow() > 0)
	                	{	
	        	            respuesta.setIdentificador(result2.getString("Identificador"));
	        	            respuesta.setGanador(result2.getString("Ganador"));
	        	            respuesta.setNombre_Auto(result2.getString("Nombre_Auto"));
	        	            respuesta.setTipo_Modelo(result2.getString("Tipo_modelo"));
	        	            respuesta.setConsesionaria(result2.getString("Nombre"));
	        	            respuesta.setEmail_Ganador(result2.getString("Mail"));
	        	            respuesta.setEmail_Concesionaria(result2.getString("EMail"));
	        	            respuesta.setTelefono(result2.getString("Telefono"));
	        	            respuesta.setDireccion_Ganador(result2.getString("Direccion_Ganador"));
	        	            respuesta.setDireccion_Concesionaria(result2.getString("Direccion_Concesionaria"));
	        	            respuesta.setFecha_Sorteo(form.getItem("fecha"));
	        	            respuesta.setRespuesta("SI");
	        	        	result2.next();
	                	}
	                	
	                       
	        		this.disconnect();
	        		
	        		
                    this.connect();
	        		
	        		this.setProcedure("dbo.Insertar_resultado ( ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	                
	        		this.setParameter(1,respuesta.getIdentificador());        	
		         	this.executeUpdate();
	        	    this.disconnect();

	            }
	        	result.next();
        	}     
		this.disconnect();
    	
    	
		
		
		return  respuesta;
    	
		
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
