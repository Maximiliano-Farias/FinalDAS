package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.SorteosPendientes;




public class MSSorteosPendientesDetallesDao extends DaoImpl {

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
    	
		SorteosPendientes detalles = new SorteosPendientes();
		
		
		if (form.getItem("Sorteo_Pendiente_Elegido").equals("SS"))
		{
			detalles.setDescripcion("SS");
			detalles.setPermiso(form.getItem("permiso"));
		}
		else{
		
		this.connect();
		
		this.setProcedure("dbo.SORTEOS_PENDIENTES_DETALLES (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	       if(form.getItem("Sorteo_Pendiente_Elegido").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"Error al obtener sorteo elegido", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.TINYINT);	
	        	
	        }
	        else {
	        	this.setParameter(1,(form.getItem("Sorteo_Pendiente_Elegido")));
	        	
	        }
		
		
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	if(result.getRow() > 0)
        	{	
	            detalles = new SorteosPendientes();
	        	detalles.setNro_sorteo(result.getString("nro_sorteo"));
	        	detalles.setFecha(result.getString("Fecha_sorteo"));
	        	detalles.setDescripcion(result.getString("Descripcion"));
	        	detalles.setEstado(result.getString("Estado"));
	        	detalles.setFecha_original(result.getString("Fecha_original"));
        	}
      
        detalles.setPermiso(form.getItem("permiso"));
		this.disconnect();
		}
		
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
