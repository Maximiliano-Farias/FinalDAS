package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.GanadorForm;
import ar.edu.ubp.das.src.gobierno.forms.UsuarioForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MSOpcionesDao extends DaoImpl {

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
    	

    	GanadorForm ganador = null;
		
		this.connect();
	
		this.setProcedure("dbo.Ultimo_Sorteo ( ) ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	ganador = new GanadorForm();
        	if(result.getRow() > 0)
        	{	
        	ganador.setGanador(result.getString("Ganador"));
        	ganador.setDescripcion(result.getString("Descripcion"));
        	ganador.setFecha_Sorteo(result.getString("Fecha_sorteo"));
        	ganador.setEstado(result.getString("Estado"));
        	ganador.setNombre_Auto(result.getString("Nombre_Auto"));
        	ganador.setConsesionaria(result.getString("Consesionaria"));
        	ganador.setMarca(result.getString("Marca"));
        	ganador.setTipo_Modelo(result.getString("Tipo_Modelo"));
        	
        	}
        	
		this.disconnect();
		return  ganador;
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
