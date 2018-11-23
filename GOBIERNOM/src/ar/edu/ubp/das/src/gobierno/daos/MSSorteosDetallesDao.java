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
import ar.edu.ubp.das.src.gobierno.forms.EstadisticasForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoSorteosCabecera;
import ar.edu.ubp.das.src.gobierno.forms.SorteosCabecera;
import ar.edu.ubp.das.src.gobierno.forms.SorteosDetalles;




public class MSSorteosDetallesDao extends DaoImpl {

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
    	
		SorteosDetalles detalles;
		detalles=null;
		this.connect();
		
		this.setProcedure("dbo.Detalle_Sorteo (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

	       if(form.getItem("Sorteo_Elegido").isEmpty()) {
			  JOptionPane.showMessageDialog(null,"Error al obtener sorteo elegido", "ERROR", JOptionPane.ERROR_MESSAGE);
			  this.setNull(1, Types.TINYINT);	
	        	
	        }
	        else {
	        	this.setParameter(1,(form.getItem("Sorteo_Elegido")));
	        	
	        }
		
		
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	if(result.getRow() > 0)
        	{	
	            detalles = new SorteosDetalles();
	        	detalles.setConcesionaria(result.getString("Concesionaria"));
	        	detalles.setNombre_Auto(result.getString("Nombre_Auto"));
	        	detalles.setTipo_Modelo(result.getString("Tipo_Modelo"));
	        	detalles.setFecha_Notificacion(result.getString("Fecha_notificacion"));
	        	detalles.setGanador(result.getString("Ganador"));
	        	detalles.setGanador(result.getString("Ganador"));
	        	detalles.setError(result.getString("Error"));
        	}
        	
               
		this.disconnect();
		return  detalles;
    	
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
