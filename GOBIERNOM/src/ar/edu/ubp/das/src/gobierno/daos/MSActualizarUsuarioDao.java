package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariasDetalles;






public class MSActualizarUsuarioDao extends DaoImpl {

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
    	
		ConcesionariasDetalles detalles;
		detalles = null;
		this.connect();
		this.setProcedure("dbo.Actualizar_Datos_personales (?, ? , ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
		  if(form.getItem("Id_plan").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"Error al obtener datos de la persona", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.TINYINT);	
	        
	        }
	        else {
	        	
	        	this.setParameter(1,(form.getItem("Id_plan")));
	        	this.setParameter(2,(form.getItem("Direccion")));
	        	this.setParameter(3,(form.getItem("Mail")));
	        	this.setParameter(4,(form.getItem("Telefono")));
	        	
	        	
	        }
		
		
		this.executeQuery();
       
		this.disconnect();

		return detalles;
    	
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
