package ar.edu.ubp.servicios;
import java.io.IOException;
import java.net.URI;
import java.sql.SQLException;

import javax.swing.JOptionPane;

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
	
	
@SuppressWarnings("null")
public 	ConcesionariaBean Cargar_Datos(String direccion_url, String Metodo, String Id_concesionaria )throws SQLException{
	
	System.out.println("#\t -- Consumiendo REST :" + Id_concesionaria);
	String resultado;	  
    URI uri = URI.create(direccion_url + Metodo); 
    HttpPost req = new HttpPost();
    req.setURI(uri); 
    HttpClient client = HttpClientBuilder.create().build();         
    HttpResponse resp = null;
    ConcesionariaBean concesionaria=new ConcesionariaBean();
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
    	restResp = "ERROR";  	
    }
    if (!restResp.equals("ERROR"))
    {  
	    Gson gson = new Gson();
		concesionaria = gson.fromJson(restResp,ConcesionariaBean.class);
		System.out.println("#\t -- Consumo Correcto !!!");
	}
    else 
    {   
    	concesionaria.setNombre("ERROR");
    	concesionaria.setId_concesionaria(Id_concesionaria);
    	System.out.println("#\t -- ERROR CONSUMO REST ");
    }  	
  
    
    return concesionaria;
    
    	
}

}
