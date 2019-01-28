package ar.edu.ubp.das.src.gobierno.daos;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
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
		// TODO Auto-generated method stub
		
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
		
	    
		String asunto = "SORTEO 0km "+fecha+"!";
		String cuerpo = "El ganador de este mes es "+ganador+",con el plan: "+identificador+", quien adjudico un:"+auto+"-"+modelo+" en la concesionaria :"+concesionaria+" ,con direccion: "+direccion_concesionaria+". ";
		try {
			if (!EnviarMail(email_ganador, asunto, cuerpo))
			{
				respuesta.setRespuesta("ERROR GANADOR");
			}
			else
			{				
				this.connect();
				
				this.setProcedure("dbo.Obtener_Concesionarias_habilitadas()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		        
		        ResultSet result = this.getStatement().executeQuery();

		        result.next();
		        	
		        	while(result.getRow() > 0 && error == 0)
		        	{	
		        		email_concesionaria=result.getString("Email");
		        		if (!EnviarMail(email_concesionaria, asunto, cuerpo))
						{
							respuesta.setRespuesta("ERROR CONCESIONARIA");
							error=1;
						}
			        	result.next();
		        	}
		        	
		               
				this.disconnect();
				
                       if(error == 0){
                    	   respuesta.setRespuesta("SI");
                       }           	   
			}
            
			
			return respuesta;
		} 
		catch (MessagingException e) {
			respuesta.setRespuesta("NO");	
		     StringWriter sw = new StringWriter();
		      PrintWriter pw = new PrintWriter(sw);
		      e.printStackTrace(pw);
		      JOptionPane.showMessageDialog(null,sw.toString().toUpperCase() +email_concesionaria, "ERROR", JOptionPane.ERROR_MESSAGE);
		      System.out.println(sw.toString().toUpperCase());
			e.printStackTrace();
			return respuesta;
		}
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	public boolean EnviarMail(String mail,String asunto, String cuerpo) throws MessagingException{

		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.port","587");
		properties.put("mail.smtp.user", "usuario");
		properties.put("mail.smtp.auth", "true");
		
		try{
			Session session = Session.getInstance(properties,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication("finaldas2019@gmail.com","finaldas");
	                    }
	                });

			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			message.setSubject(asunto);
			message.setText(cuerpo);
			Transport.send(message);
			return true;
	         
		}catch (MessagingException me){
			 JOptionPane.showMessageDialog(null,me.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
			return false;
		}
		
	}			
}

