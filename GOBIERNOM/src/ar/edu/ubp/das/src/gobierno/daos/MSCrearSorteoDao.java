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
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;


public class MSCrearSorteoDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		 JOptionPane.showMessageDialog(null,"PASA 1", "ERROR", JOptionPane.ERROR_MESSAGE);
		  
    	return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
		 JOptionPane.showMessageDialog(null,"PASA 2", "ERROR", JOptionPane.ERROR_MESSAGE);
    	
	}

	@Override
	public void update(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		JOptionPane.showMessageDialog(null,"PASA3", "ERROR", JOptionPane.ERROR_MESSAGE);
		
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		 JOptionPane.showMessageDialog(null,"PASA 4", "ERROR", JOptionPane.ERROR_MESSAGE);
		
	}

	
		
	

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		 JOptionPane.showMessageDialog(null,"PASA 5", "ERROR", JOptionPane.ERROR_MESSAGE);
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

}
