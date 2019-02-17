package ar.edu.ubp.servicios;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import com.google.gson.Gson;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.GanadorForm;


public class ConcesionariaRest {
	
	
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


public 	String Ganador(String Id_concesionaria,String direccion_url, String Metodo_pago, GanadorForm Ganador )throws SQLException{
	
	System.out.println("#\t -- Notificando ganador REST :" + Id_concesionaria);
	String resultado;	  
    URI uri = URI.create(direccion_url + Metodo_pago); 
    HttpPost req = new HttpPost();
    req.setURI(uri); 
    
    List<NameValuePair> nvps = new ArrayList<NameValuePair>();
	nvps.add(new BasicNameValuePair("nro_sorteo", Ganador.getNro_sorteo()));
	nvps.add(new BasicNameValuePair("id_persona", Ganador.getId_persona()));
	nvps.add(new BasicNameValuePair("Apellido", Ganador.getApellido()));
	nvps.add(new BasicNameValuePair("Nombre", Ganador.getNombre()));
	nvps.add(new BasicNameValuePair("Identificador", Ganador.getIdentificador()));
	nvps.add(new BasicNameValuePair("Id_Consesionaria", Ganador.getId_Concesioria()));
	nvps.add(new BasicNameValuePair("Nombre_Auto", Ganador.getNombre_Auto()));
	nvps.add(new BasicNameValuePair("Nro_Marca", Ganador.getMarca()));
	nvps.add(new BasicNameValuePair("Tipo_Modelo", Ganador.getTipo_Modelo()));
    
    HttpClient client = HttpClientBuilder.create().build();         
    HttpResponse resp = null;
    String respuesta ="";
    
    try {
		req.setEntity(new UrlEncodedFormEntity(nvps));
	}
	catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
    
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
    if (restResp.equals("OK"))
    {  
	    
		System.out.println("#\t -- Notificado Correcto !!!");
		respuesta ="OK";
	}
    else 
    {   
    	respuesta ="NO";
    	System.out.println("#\t -- ERROR NOTIFICAR REST ");
    }  	
  
    
    return respuesta;
	

	
	
	
    	
}





}
