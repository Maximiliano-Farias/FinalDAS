package ar.edu.ubp.servicios;


import java.sql.SQLException;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import com.google.gson.Gson;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.GanadorForm;



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
	
	

public 	String Ganador(String Id_concesionaria,String direccion_url, String Metodo_pago, GanadorForm Ganador )throws SQLException{
	
	
	String respuesta;

	JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
	System.out.println("#\t -- Notificando CXF " + Id_concesionaria);
	ConcesionariaBean concesionaria = new ConcesionariaBean();	
	Object[] res = null;
	try {
		Client client = dcf.createClient(direccion_url);
		res = client.invoke(Metodo_pago,Ganador.getNro_sorteo(),Ganador.getId_persona(),Ganador.getNombre(),Ganador.getApellido(),Ganador.getIdentificador(),Ganador.getId_Concesioria(),Ganador.getNombre_Auto(),Ganador.getMarca(),Ganador.getTipo_Modelo());
	    respuesta= (String) res[0];
		
		System.out.println("#\t -- Notificado Correcto !!! ");
	}
	catch(Exception e) {			
		respuesta="NO";
		concesionaria.setId_concesionaria(Id_concesionaria);
		System.out.println("#\t -- ERROR AL NOTIFICAR CXF ");
	}
	
	 return respuesta;

}
    
   
    

}
