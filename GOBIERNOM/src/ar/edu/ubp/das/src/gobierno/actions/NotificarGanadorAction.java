package ar.edu.ubp.das.src.gobierno.actions;

import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.gobierno.forms.MailForm;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;
import ar.edu.ubp.servicios.EnviaMail;

public class NotificarGanadorAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
	       form.setItem("idioma", String.valueOf(request.getSession().getAttribute("lang")));
		
	    RespuestaForm respuesta = new RespuestaForm();
		Dao dao = DaoFactory.getDao("NotificarGanador", "gobierno");
		EnviaMail enviar = new EnviaMail();
		try{
		MailForm envio = new MailForm();
		envio = (MailForm)dao.select(form);
		if (enviar.EnviarMail(envio)){
			dao.update(form);
			respuesta.setRespuesta("SI");
		}
		else{
			respuesta.setRespuesta("NO");
		}
			
		
		}
		catch(Exception e){
			respuesta.setRespuesta("NO");	
		}
		
		
		
		request.setAttribute("respuesta",respuesta );
		response.setContentType("text/html;charset=ISO-8859-1");
		return mapping.getForwardByName("success");
	}

}
