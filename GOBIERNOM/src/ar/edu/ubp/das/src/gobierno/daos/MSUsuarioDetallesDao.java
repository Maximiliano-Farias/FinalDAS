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
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariasDetalles;
import ar.edu.ubp.das.src.gobierno.forms.EstadisticasForm;
import ar.edu.ubp.das.src.gobierno.forms.UsuarioForm;






public class MSUsuarioDetallesDao extends DaoImpl {

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
    	
		UsuarioForm detalles;
		detalles=null;
		this.connect();
		
		this.setProcedure("dbo.Obtener_Datos_personales (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

	       if(form.getItem("Id_plan").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"ERROR ID PLAN", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.TINYINT);	
	        	
	        }
	        else {
	        	this.setParameter(1,(form.getItem("Id_plan")));
	        	
	        }
		
		
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	if(result.getRow() > 0)
        	{	
	            detalles = new UsuarioForm();
	        	detalles.setNombre(result.getString("Nombre"));
	        	detalles.setApellido(result.getString("Apellido"));
	        	detalles.setDireccion(result.getString("Direccion"));
	        	detalles.setTelefono(result.getString("Telefono"));
	        	detalles.setMail(result.getString("Mail"));
	        	detalles.setDni(result.getString("id_persona"));
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
