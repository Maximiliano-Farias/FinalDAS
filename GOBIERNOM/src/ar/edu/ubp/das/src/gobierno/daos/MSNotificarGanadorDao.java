package ar.edu.ubp.das.src.gobierno.daos;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.MailForm;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;

public class MSNotificarGanadorDao extends DaoImpl {

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
		
		 this.connect();
	        	this.setProcedure("dbo.Borrar_Error_Sorteo ()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);   
     	  	this.executeUpdate();
     	    this.disconnect();
     	 		
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DynaActionForm select(DynaActionForm form) throws SQLException {
    	
		RespuestaForm respuesta = new RespuestaForm();
		respuesta.setRespuesta("SI");
		String fecha =form.getItem("fecha");								    
	    String ganador = form.getItem("ganador");								    
	    String identificador = form.getItem("identificador");								    
	    String auto =form.getItem("auto");								   
	    String modelo= form.getItem("modelo");   
	    String email_ganador= form.getItem("email_ganador");								    								    
	    String concesionaria = form.getItem("concesionaria");   
	    String email_concesionaria =form.getItem("email_concesionaria");   								    
	    String direccion_concesionaria = form.getItem("direccion_concesionaria");   
	    int error = 0;
	    LinkedList<String> mails = new LinkedList<String>();
		MailForm mail = new MailForm();
		mail.setGanador(ganador);
		mail.setFecha(fecha);
		mail.setIdentificador(identificador);
		mail.setAuto(auto);
		mail.setModelo(modelo);
		mail.setConcesionaria(concesionaria);
		mail.setDireccion_concesionaria(direccion_concesionaria);
	    mails.add(email_ganador);
		
	    
	    
	    /*
	     * HABILITAR PARA QUE TAMBIEN NOTIFIQUE LAS CONCESIONARIAS
	     * this.connect();
		
		this.setProcedure("dbo.Obtener_Concesionarias_habilitadas()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		ResultSet result = this.getStatement().executeQuery();

		result.next();
			
			while(result.getRow() > 0 && error == 0)
			{	
				email_concesionaria=result.getString("Email");
				mails.add(email_concesionaria);
				result.next();
			}
				       
		this.disconnect(); */
		mail.setMails(mails);
		

     return mail;
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

