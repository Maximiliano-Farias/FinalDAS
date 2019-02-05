package ar.edu.ubp.servicios;

import javax.swing.JOptionPane;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import com.google.gson.Gson;

import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;

public class ConcesionariaAxis2  {

	
	public ConcesionariaBean Cargar_Datos(String url, String Metodo) {
		
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		Client client = dcf.createClient(url);
		ConcesionariaBean concesionaria = null;	
		Object[] res = null;
		try {
			res = client.invoke(Metodo);
			Gson gson = new Gson();
			 concesionaria = gson.fromJson((String) res[0], ConcesionariaBean.class);	
		}
		catch (Exception e) {
			concesionaria.setNombre("ERROR");
			System.out.println( e.getMessage() );
			e.printStackTrace();
		}

		return concesionaria;
	}
	
}
