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
import ar.edu.ubp.das.src.gobierno.forms.UsuarioForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MSUsuarioDao extends DaoImpl {

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
    	

    	UsuarioForm usuario = null;
    	
		
		this.connect();
		
		this.setProcedure("dbo.Logueo ( ?, ? ) ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
       
		
		
		if(form.getItem("usuario").isEmpty() || form.getItem("contrasena").isEmpty() ) {
        	this.setNull(1, Types.TINYINT);
        	this.setNull(2, Types.TINYINT);
        }
        else {
        	this.setParameter(1,(form.getItem("usuario")));
        	this.setParameter(2, form.getItem("contrasena"));
        }
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	usuario = new UsuarioForm();
        	if(result.getRow() > 0)
        	{	
        	usuario.setNombre_Usuario(result.getString("usuario"));
        	usuario.setPermiso(result.getString("permiso"));
        	usuario.setDni(result.getString("id_persona"));
        	usuario.setId_Plan(result.getString("Identificador"));
        	}
        	else
        	{
        		usuario.setNombre_Usuario("Error");
        	}
               
		this.disconnect();
		return  usuario;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
