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
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariaConsumo;
import ar.edu.ubp.servicios.ConcesionariaAxis2;
import ar.edu.ubp.servicios.ConcesionariaCxf;
import ar.edu.ubp.servicios.ConcesionariaRest;

public class ConsumirConcesionariasAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
	form.setItem("idioma", String.valueOf(request.getSession().getAttribute("lang")));
	    
	    ConcesionariaBean RespuestaConcesionaria = new ConcesionariaBean();
		Dao dao = DaoFactory.getDao("ConsumirConcesionarias", "gobierno");
		ListadoConcesionariaConsumo Listado = new ListadoConcesionariaConsumo();
		Listado = (ListadoConcesionariaConsumo) dao.select(form);
		@SuppressWarnings("unused")
		String Respuesta = "OK";
		for (ConcesionariaConsumo C : Listado.getConcesionarias())
		{
			 if(C.getServicio().equals("REST"))
    	    {
    	    	ConcesionariaRest concesionaria = new ConcesionariaRest();
    	    	RespuestaConcesionaria= concesionaria.Cargar_Datos(C.getDireccion_url(),C.getMetodo(),C.getId_concesionaria());
    	    	    	    		
    	    	if (!RespuestaConcesionaria.getNombre().equals("ERROR"))
    	            {
    	            	Respuesta= dao.insert(RespuestaConcesionaria);	
    	            }
    	    	
    	    }
	    	if(C.getServicio().equals("CXF"))
    	    {   
    	    	ConcesionariaCxf concesionariacxf = new ConcesionariaCxf();
    	    	RespuestaConcesionaria = concesionariacxf.Cargar_Datos(C.getDireccion_url(),C.getMetodo(),C.getId_concesionaria());  	
    	    	if (!RespuestaConcesionaria.getNombre().equals("ERROR"))
 	            {
 	            	Respuesta= dao.insert(RespuestaConcesionaria);	
 	            }
 	           
    	    }
	    	if(C.getServicio().equals("AXIS2"))
    	    {   
    	    	ConcesionariaAxis2 concesionariaaxis = new ConcesionariaAxis2();
    	    	RespuestaConcesionaria = concesionariaaxis.Cargar_Datos(C.getDireccion_url(),C.getMetodo(),C.getId_concesionaria()); 	
    	    	if (!RespuestaConcesionaria.getNombre().equals("ERROR"))
 	            {
 	            	Respuesta= dao.insert(RespuestaConcesionaria);	
 	            }
 	            
    	    }
    	   
		}
		
	  
		request.setAttribute("respuesta", "SI");

		response.setContentType("text/html;charset=ISO-8859-1");
		return mapping.getForwardByName("success");
	}

}
