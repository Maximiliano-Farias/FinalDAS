package ar.edu.ubp.das.action;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.daos.MSConcesionariaDao;
import ar.edu.ubp.das.forms.ConcesionariaBean;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import com.fasterxml.jackson.databind.ObjectMapper;


@WebService(targetNamespace = "http://action.das.ubp.edu.ar/", portName = "Concesionaria3Port", serviceName = "Concesionaria3Service")
public class Concesionaria3 {

	@WebMethod(operationName = "Planes", action = "urn:Planes")
	public String Planes(){
	ConcesionariaBean conce = new ConcesionariaBean();
		try{
			MSConcesionariaDao dao = (MSConcesionariaDao)DaoFactory.getDao( "Concesionaria", "ar.edu.ubp.das" );
			 conce = dao.select();
			 ObjectMapper mapper = new ObjectMapper();
			 String jsonInString = mapper.writeValueAsString(conce);
			 return jsonInString;
		}

		catch (Exception e){
			return e.getMessage();
		}
	}

@WebMethod(operationName = "Ganador", action = "urn:Ganador")
public String Ganador(@WebParam(name = "nro_sorteo") String nro_sorteo,@WebParam(name = "id_persona") String id_persona,@WebParam(name = "Nombre") String Nombre,@WebParam(name = "Apellido") String Apellido, @WebParam(name = "Identificador") String Identificador, @WebParam(name = "Id_Consesionaria") String Id_Consesionaria,@WebParam(name = "Nombre_Auto") String Nombre_Auto,@WebParam(name = "Nro_Marca") String Nro_Marca,@WebParam(name = "Tipo_Modelo") String Tipo_Modelo ) {
	
	try{
		MSConcesionariaDao dao = (MSConcesionariaDao)DaoFactory.getDao( "Concesionaria", "ar.edu.ubp.das" );
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
