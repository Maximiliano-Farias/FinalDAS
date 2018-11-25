package ar.edu.ubp.das.ws;

import com.fasterxml.jackson.databind.ObjectMapper;

import ar.edu.ubp.das.daos.ConcesionariaDaoImpl;
import ar.edu.ubp.das.forms.ConcesionariaBean;
import ar.edu.ubp.das.interfac.DaoConcesionaria;

public class Concesionaria {
	

	
	public String Concesionaria5() throws Exception {
		
		ConcesionariaBean conce = new ConcesionariaBean();
		
		      DaoConcesionaria dao = new ConcesionariaDaoImpl();
			 conce = dao.Concesionaria();
			 ObjectMapper mapper = new ObjectMapper();
			 String jsonInString = mapper.writeValueAsString(conce);
			 return jsonInString;
		
	}	
	

	
}
