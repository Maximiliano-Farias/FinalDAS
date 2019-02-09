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
    	respuesta= new ResultadoSorteoForm();
    	
		
		this.connect();
		
		this.setProcedure("dbo.Ganador_Sorteo ()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        respuesta.setRespuesta("NO");
        	while(result.getRow() > 0)
        	{	
	            respuesta.setIdentificador(result.getString("Identificador"));
	            respuesta.setGanador(result.getString("Ganador"));
	            respuesta.setNombre_Auto(result.getString("Nombre_Auto"));
	            respuesta.setTipo_Modelo(result.getString("Tipo_modelo"));
	            respuesta.setConsesionaria(result.getString("Nombre"));
	            respuesta.setEmail_Ganador(result.getString("Mail"));
	            respuesta.setEmail_Concesionaria(result.getString("EMail"));
	            respuesta.setTelefono(result.getString("Telefono"));
	            respuesta.setDireccion_Ganador(result.getString("Direccion_Ganador"));
	            respuesta.setDireccion_Concesionaria(result.getString("Direccion_Concesionaria"));
	            respuesta.setFecha_Sorteo(form.getItem("fecha"));
	            respuesta.setRespuesta("SI");
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
