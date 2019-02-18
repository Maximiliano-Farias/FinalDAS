package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;


public class MSCrearUsuarioDao extends DaoImpl {

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
    	
		RespuestaForm respuesta;
		respuesta =null;
		respuesta = new RespuestaForm();
		if(form.getItem("iguales").equals("1")) {

				this.connect();
				
				this.setProcedure("dbo.Insertar_Usuario ( ? , ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		        
				  if(form.getItem("nuevo_usuario").isEmpty()) {

					  this.setNull(1, Types.TINYINT);
					  this.setNull(2, Types.TINYINT);
					  this.setNull(3, Types.TINYINT);
					  respuesta.setRespuesta("Error");
			        
			        }
			        else {

			        	this.setParameter(1,(form.getItem("nuevo_usuario")));
			        	this.setParameter(2,(form.getItem("nueva_contrasena_1")));
			        	this.setParameter(3,(form.getItem("usuario")));
			        	respuesta.setRespuesta("OK");
			        }
				
					this.executeUpdate();
			       
					this.disconnect();
					
					//****************************INSERTAR PERMISO*******************************
					this.connect();
					
					this.setProcedure("dbo.Insertar_Permisos_Usuarios ( ? , ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			        
					  if(form.getItem("nuevo_usuario").isEmpty()) {

						  this.setNull(1, Types.TINYINT);
						  this.setNull(2, Types.TINYINT);
						  this.setNull(3, Types.TINYINT);
						  respuesta.setRespuesta("Error");
				        
				        }
				        else {

				        	this.setParameter(1,(form.getItem("usuario")));
				        	this.setParameter(2,"consulta");
				        	this.setParameter(3,"usuario de consulta");
				        	respuesta.setRespuesta("OK");
				        }
					
						this.executeUpdate();
				       
						this.disconnect();
					
					
					
					
				}
		else{		
                 respuesta.setRespuesta("Distintos");	
			}
				return respuesta;
		    	
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
