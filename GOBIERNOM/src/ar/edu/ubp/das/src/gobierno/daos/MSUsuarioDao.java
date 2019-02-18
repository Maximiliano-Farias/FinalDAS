package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.UsuarioForm;

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
    	String existe_persona="";
    	String existe_identificador="";
    	String usuario_error="NO";

    	
   //**********************    VERIFICA SI PUEDE INGRESAR CON USUARIO Y CONTRASENA
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
        		usuario_error= "SI";
        	}
        
		this.disconnect();
		
//******************** VERIFICO SI LA PERSONA EXISTE Y ES PRIMER LOGUEO ***************
	if (usuario_error.equals("SI")){
		
        this.connect();
		
		this.setProcedure("dbo.EXISTE_PERSONA  (?, ?) ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
       
		 try {
				if(form.getItem("usuario").isEmpty() || form.getItem("contrasena").isEmpty() ) {
		        	this.setNull(1, Types.TINYINT);
		        	this.setNull(2, Types.TINYINT);
		        }
		        else {
		        	this.setParameter(1,form.getItem("usuario"));
		        	this.setParameter(2,Integer.parseInt(form.getItem("contrasena")) );
		        	
		        }
		 }
		 catch (NumberFormatException excepcion){
			 this.setNull(1, Types.TINYINT);
	         this.setNull(2, Types.TINYINT);
		 }
	
        
        result = this.getStatement().executeQuery();

        result.next();
        	usuario = new UsuarioForm();
        	if(result.getRow() > 0)
        	{	
        	existe_persona=(result.getString("EXISTE"));

        	}
        	else
        	{
        		existe_persona = "NO";
        	}
               
		this.disconnect();
		
		
		//******************** VERIFICO SI NO EXISTE USUARIO PARA ESE IDENTIFICADOR ***************
		
      this.connect();
		
		this.setProcedure("dbo.EXISTE_USUARIO ( ? ) ", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
      
		
		
		if(form.getItem("usuario").isEmpty() || form.getItem("contrasena").isEmpty() ) {
       	this.setNull(1, Types.TINYINT);
       }
       else {
       	this.setParameter(1,(form.getItem("usuario")));
       }
       
       result = this.getStatement().executeQuery();

       result.next();
       	usuario = new UsuarioForm();
       	if(result.getRow() > 0)
       	{	
       	  existe_identificador=(result.getString("EXISTE"));

       	}
       	else
       	{
       		existe_identificador= "NO";
       	}   
       	
		this.disconnect();
		
		

		
		if (usuario_error.equals("SI"))
		{
			if (existe_persona.equals("SI"))
			{
				if(existe_identificador.equals("SI"))
				{
					usuario.setPermiso("ERROR");
				}
				else{
					usuario.setPermiso("CREAR");
				}
			}
			else {
				usuario.setPermiso("ERROR");
			}
			
		}
	}	
	
		return  usuario;
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
