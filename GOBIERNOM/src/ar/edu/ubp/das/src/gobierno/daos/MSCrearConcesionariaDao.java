package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;
import java.util.List;

import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.gobierno.forms.AutoForm;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariasCabecera;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariasDetalles;
import ar.edu.ubp.das.src.gobierno.forms.EstadisticasForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariasCabecera;


public class MSCrearConcesionariaDao extends DaoImpl {

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
		
		this.setProcedure("dbo.Insertar_Concesionaria ( ?, ? , ?, ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
		  if(form.getItem("nombre_concesionaria_nueva").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"Error al obtener datos concesionaria nueva", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.TINYINT);	
	        
	        }
	        else {
	        	JOptionPane.showMessageDialog(null,"Error al obtener datos concesionaria nueva", "ERROR", JOptionPane.ERROR_MESSAGE);
	        	this.setParameter(1,(form.getItem("id_concesionaria_nueva")));
	        	this.setParameter(2,(form.getItem("nombre_concesionaria_nueva")));
	        	this.setParameter(3,(form.getItem("Habilitado_nueva")));
	        	this.setParameter(4,(form.getItem("direccion_concesionaria_nueva")));
	        	this.setParameter(5,(form.getItem("telefono_concesionaria_nueva")));
	        	
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
