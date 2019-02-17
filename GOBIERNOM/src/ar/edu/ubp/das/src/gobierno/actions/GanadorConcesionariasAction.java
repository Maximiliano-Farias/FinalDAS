package ar.edu.ubp.das.src.gobierno.actions;

import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.DatosNotificaGanadorForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariaConsumo;
import ar.edu.ubp.servicios.ConcesionariaAxis2;
import ar.edu.ubp.servicios.ConcesionariaCxf;
import ar.edu.ubp.servicios.ConcesionariaRest;

public class GanadorConcesionariasAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
	form.setItem("idioma", String.valueOf(request.getSession().getAttribute("lang")));
	    
	    String RespuestaConcesionaria;
		Dao dao = DaoFactory.getDao("NotificarConcesionarias", "gobierno");
		ListadoConcesionariaConsumo Listado = new ListadoConcesionariaConsumo();
		DatosNotificaGanadorForm Datos_notificacion = new DatosNotificaGanadorForm();
		Datos_notificacion = (DatosNotificaGanadorForm) dao.select(form);
		Listado = Datos_notificacion.getConcesionarias();
		String Respuesta = "OK",Hay_error="";
		for (ConcesionariaConsumo C : Listado.getConcesionarias())
		{
			ConcesionariaBean conce = new ConcesionariaBean();
			conce.setId_concesionaria(C.getId_concesionaria());
			
			 if(C.getServicio().equals("REST"))
    	    {
    	    	ConcesionariaRest concesionariaRest = new ConcesionariaRest();
    	    	RespuestaConcesionaria= concesionariaRest.Ganador(C.getId_concesionaria(),C.getDireccion_url(),C.getMetodo_pago(),Datos_notificacion.getGanador());
    	    	
    	            if(!RespuestaConcesionaria.equals("NO"))
    	            {
    	            	Respuesta= dao.insert(conce);	
    	            }
    	            else{
    	            	Hay_error= "SI";
    	            }
    	    	
    	    }
	    	if(C.getServicio().equals("CXF"))
    	    {   
    	    	ConcesionariaCxf concesionariacxf = new ConcesionariaCxf();
    	    	RespuestaConcesionaria= concesionariacxf.Ganador(C.getId_concesionaria(),C.getDireccion_url(),C.getMetodo_pago(),Datos_notificacion.getGanador());
    	    	 
	            if(!RespuestaConcesionaria.equals("NO"))
	            {
	            	Respuesta= dao.insert(conce);	
	            }
	            else{
	            	Hay_error= "SI";
	            }
    	    }
	    	if(C.getServicio().equals("AXIS2"))
    	    {   
    	    	ConcesionariaAxis2 concesionariaaxis = new ConcesionariaAxis2();
    	    	RespuestaConcesionaria= concesionariaaxis.Ganador(C.getId_concesionaria(),C.getDireccion_url(),C.getMetodo_pago(),Datos_notificacion.getGanador());
    	    
	            if(!RespuestaConcesionaria.equals("NO"))
	            {
	            	Respuesta= dao.insert(conce);	
	            }
	            else{
	            	Hay_error= "SI";
	            }
    	    }
    	   
		}
		
		
		Dao dao2 = DaoFactory.getDao("ConcesionariasNotificadasCompleto", "gobierno");
		
		request.setAttribute("respuesta", dao2.select(form));
		
	  
		

		response.setContentType("text/html;charset=ISO-8859-1");
		return mapping.getForwardByName("success");
	}

}
