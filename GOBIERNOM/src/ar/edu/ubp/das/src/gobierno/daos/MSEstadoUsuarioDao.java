package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;


public class MSEstadoUsuarioDao extends DaoImpl {

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
		if(form.getItem("usuario").isEmpty()) {
			JOptionPane.showMessageDialog(null,"Error al obtener usuario", "ERROR", JOptionPane.ERROR_MESSAGE);
			respuesta.setRespuesta("1");
		}		
		else {
			
			this.connect();
			this.setProcedure("Valida_Usuario( ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		        	this.setParameter(1,(form.getItem("usuario")));
		        	 ResultSet result = this.getStatement().executeQuery();

		             result.next();
		             	if(result.getRow() > 0)
		             	{
		             		respuesta.setRespuesta(result.getString("Existe"));
		             	}
		             	
		        }
	   return respuesta;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
