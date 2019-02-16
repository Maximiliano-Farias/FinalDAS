package ar.edu.ubp.das.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import ar.edu.ubp.das.concesionaria.daos.MSConcesionariaDao;
import ar.edu.ubp.das.forms.*;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;


@Path("/concesionaria2")
@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
public class ConcesionariaResource {
	
	@POST
	@Path("/planes")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public ConcesionariaBean concesionaria1() {
        
		ConcesionariaBean conce = new ConcesionariaBean();
		try{
			MSConcesionariaDao dao = (MSConcesionariaDao)DaoFactory.getDao( "Concesionaria", "ar.edu.ubp.das.concesionaria" );
			 conce = dao.select();
			 return conce;
		}

		catch (Exception e){
			return null;
		}
	
	}	
	
	
	
	@POST
	@Path("/ganador")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String Ganador(@FormParam("nro_sorteo") String nro_sorteo, @FormParam("id_persona") String id_persona, @FormParam("Nombre") String Nombre, @FormParam("Apellido") String Apellido, @FormParam("Identificador") String Identificador, @FormParam("Id_Consesionaria") String Id_Consesionaria, @FormParam("Nombre_Auto") String Nombre_Auto, @FormParam("Nro_Marca") String Nro_Marca, @FormParam("Tipo_Modelo") String Tipo_Modelo) {
        
		try{
			MSConcesionariaDao dao = (MSConcesionariaDao)DaoFactory.getDao( "Concesionaria", "ar.edu.ubp.das.concesionaria" );
			DynaActionForm form = new DynaActionForm();
			form.setItem("nro_sorteo", nro_sorteo);
			form.setItem("id_persona", id_persona);
			form.setItem("Nombre", Nombre);
			form.setItem("Apellido", Apellido);
			form.setItem("Identificador", Identificador);
			form.setItem("Id_Consesionaria", Id_Consesionaria);
			form.setItem("Nombre_Auto", Nombre_Auto);
			form.setItem("Nro_Marca", Nro_Marca);
			form.setItem("Tipo_Modelo", Tipo_Modelo);
			
			dao.insert(form); 
			 return "OK";
		}

		catch (Exception e){
			return e.toString();
		}
	
	}	

}
