package ar.edu.ubp.servicios;


import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import com.google.gson.Gson;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;



public class ConcesionariaCxf  {


	public ConcesionariaBean Cargar_Datos(String url, String Metodo, String Id_concesionaria) {
	
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		System.out.println("#\t -- Consumiendo CXF " + Id_concesionaria);
		ConcesionariaBean concesionaria = new ConcesionariaBean();	
		Object[] res = null;
		try {
			Client client = dcf.createClient(url);
			res = client.invoke(Metodo);
			Gson gson = new Gson();
			concesionaria = gson.fromJson((String) res[0], ConcesionariaBean.class);
			System.out.println("#\t -- Consumiendo Correcto !!! ");
		}
		catch(Exception e) {			
			concesionaria.setNombre("ERROR");
			concesionaria.setId_concesionaria(Id_concesionaria);
			System.out.println("#\t -- ERROR DE CONSUMO CXF ");
		}

		return concesionaria;
	}
	
	

}
