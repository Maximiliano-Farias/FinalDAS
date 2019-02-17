package ar.edu.ubp.das.ws;

import com.fasterxml.jackson.databind.ObjectMapper;

import ar.edu.ubp.das.concesionaria.daos.MSConcesionariaDao;
import ar.edu.ubp.das.forms.ConcesionariaBean;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;

public class Concesionaria {
	

	
public String Planes() {
        
		ConcesionariaBean conce = new ConcesionariaBean();
		try{
			MSConcesionariaDao dao = (MSConcesionariaDao)DaoFactory.getDao( "Concesionaria", "ar.edu.ubp.das.concesionaria" );
			 conce = dao.select();
			 ObjectMapper mapper = new ObjectMapper();
			 String jsonInString = mapper.writeValueAsString(conce);
			 return jsonInString;
		}

		catch (Exception e){
			return null;
		}
	
	}	
	
	
	public String Ganador(String nro_sorteo,  String id_persona, String Nombre,  String Apellido,String Identificador,  String Id_Consesionaria,  String Nombre_Auto,String Nro_Marca,String Tipo_Modelo) {
        
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
