package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;


public class MSCrearSorteoDao extends DaoImpl {

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
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public DynaActionForm select(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		

		if(form.getItem("fecha_sorteo_crear").isEmpty()) {
			JOptionPane.showMessageDialog(null,"Error al obtener datos concesionaria nueva", "ERROR", JOptionPane.ERROR_MESSAGE);
			
		}
		
		else {
			
			this.connect();
			this.setProcedure("dbo.Insertar_Sorteo ( ? , ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		        	this.setParameter(1,(form.getItem("fecha_sorteo_crear")));
		        	this.setParameter(2,(form.getItem("descripcion_sorteo_crear")));
		        	this.setParameter(3,(form.getItem("Estado_sorteo_crear")));
		        	this.executeQuery();
					this.disconnect(); 	
		        	
		        	
		        }
	   return null;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
