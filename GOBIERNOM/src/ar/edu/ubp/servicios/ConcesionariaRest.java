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
	
	
public 	ConcesionariaBean Cargar_Datos(String direccion_url, String Metodo )throws SQLException{
	 JOptionPane.showMessageDialog(null,direccion_url + Metodo, "ERROR", JOptionPane.ERROR_MESSAGE);
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
    JOptionPane.showMessageDialog(null,"esta es la respuesta: "+restResp, "ERROR", JOptionPane.ERROR_MESSAGE);
    if(responseStatus.getStatusCode() != 200) {
    	throw new RuntimeException(restResp);
    }
    if (!restResp.equals(null))
    {
    Gson gson = new Gson();
	concesionaria = gson.fromJson(restResp,ConcesionariaBean.class);
	JOptionPane.showMessageDialog(null,"nombre conce: "+concesionaria.getNombre()+" id_concesionaria: "+concesionaria.getId_concesionaria()+" direccion: "+concesionaria.getDireccion()+" telefono: "+concesionaria.getTelefono(), "ERROR", JOptionPane.ERROR_MESSAGE);
    }
    if (!resultado.equals("OK"))
    {
    	concesionaria.setNombre("ERROR");
    }  	
    JOptionPane.showMessageDialog(null,concesionaria, "ERROR", JOptionPane.ERROR_MESSAGE);
    return concesionaria;
    
    	
}

}
