package ar.edu.ubp.das.src.tags.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;

public class MSLogueoDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();
		               form.setItem("Nombre_Usuario", result.getString("usuario"));
		               	   
		               
		return form;
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
		return null;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
