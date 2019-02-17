package ar.edu.ubp.servicios;


import java.util.LinkedList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import ar.edu.ubp.das.src.gobierno.forms.MailForm;

public class EnviaMail {
	
	public boolean EnviarMail(MailForm mail) throws MessagingException{
		
		String fecha = mail.getFecha();
		String ganador = mail.getGanador();
		String identificador = mail.getIdentificador();
		String auto = mail.getAuto();
		String modelo = mail.getModelo();
		String concesionaria= mail.getConcesionaria();
		String direccion_concesionaria=mail.getDireccion_concesionaria();
		LinkedList<String> mails=mail.getMails();
		
		String asunto = "SORTEO 0km "+fecha+"!";
		String cuerpo = "El ganador de este mes es "+ganador+",con el plan: "+identificador+", quien adjudico un:"+auto+"-"+modelo+" en la concesionaria :"+concesionaria+" ,con direccion: "+direccion_concesionaria+". ";
		
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
            
			for (String direccion : mails)
			{
				
				MimeMessage message = new MimeMessage(session);
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(direccion));
				message.setSubject(asunto);
				message.setText(cuerpo);
				Transport.send(message);
			}
			return true;
	         
		}catch (MessagingException me){
			return false;
		}
	}	

}
