package ar.edu.ubp.das.action;

import ar.edu.ubp.das.interfac.DaoConcesionaria;
import ar.edu.ubp.das.daos.ConcesionariaDaoImpl;
import ar.edu.ubp.das.forms.ConcesionariaBean;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.fasterxml.jackson.databind.ObjectMapper;


@WebService(targetNamespace = "http://action.das.ubp.edu.ar/", portName = "Concesionaria3Port", serviceName = "Concesionaria3Service")
public class Concesionaria3 {

	
	@WebMethod(operationName = "Concesionaria", action = "urn:Concesionaria")
	public String Concesionaria(){
	ConcesionariaBean conce = new ConcesionariaBean();
		try{
		      DaoConcesionaria dao = new ConcesionariaDaoImpl();
			 conce = dao.Concesionaria();
			 ObjectMapper mapper = new ObjectMapper();
			 String jsonInString = mapper.writeValueAsString(conce);
			 return jsonInString;
		}

		catch (Exception e){
			return e.getMessage();
		}
	}

}
