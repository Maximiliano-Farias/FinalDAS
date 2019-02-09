package ar.edu.ubp.servicios;
import java.io.IOException;
import java.net.URI;
import java.sql.SQLException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import com.google.gson.Gson;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;


public class ConcesionariaRest {
	
	
public 	ConcesionariaBean Cargar_Datos(String direccion_url, String Metodo, String Id_concesionaria )throws SQLException{
	String resultado;	  
    URI uri = URI.create(direccion_url + Metodo); 
    HttpPost req = new HttpPost();
    req.setURI(uri); 
    HttpClient client = HttpClientBuilder.create().build();         
    HttpResponse resp = null;
    ConcesionariaBean concesionaria=null;
	try {
		resp = client.execute(req);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
    HttpEntity responseEntity = resp.getEntity();
    StatusLine responseStatus = resp.getStatusLine();

    String restResp = null;
	try {
		try {
			restResp = EntityUtils.toString(responseEntity);
			resultado="OK";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			resultado= e.toString();
		}
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		resultado= e.toString();
	}	
    if(responseStatus.getStatusCode() != 200) {
    	throw new RuntimeException(restResp);
    }
    if (!restResp.equals(null))
    {
	    Gson gson = new Gson();
		concesionaria = gson.fromJson(restResp,ConcesionariaBean.class);
	}
    if (!resultado.equals("OK"))
    {
    	concesionaria.setNombre("ERROR");
    	concesionaria.setId_concesionaria(Id_concesionaria);
    }  	
  
    
    return concesionaria;
    
    	
}

}