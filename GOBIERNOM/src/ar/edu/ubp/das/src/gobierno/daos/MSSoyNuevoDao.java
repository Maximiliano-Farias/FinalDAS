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
import ar.edu.ubp.das.src.gobierno.forms.GanadorForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariasCabecera;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;


public class MSSoyNuevoDao extends DaoImpl {

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
		
        RespuestaForm respuesta;
        respuesta = new RespuestaForm();
        respuesta.setRespuesta("OK");
	    return respuesta;
	}

}
