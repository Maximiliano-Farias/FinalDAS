package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.*;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;
import ar.edu.ubp.servicios.ConcesionariaAxis2;
import ar.edu.ubp.servicios.ConcesionariaCxf;
import ar.edu.ubp.servicios.ConcesionariaRest;

public class MSConsumirConcesionariasDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
    	return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DynaActionForm select(DynaActionForm form) throws SQLException {
    	
		RespuestaForm respuesta = new RespuestaForm();
    	String direccion_url;
    	String Metodo;
    	String Servicio;
    	String Resultado="OK";
    	String id_concesionaria="";
    	
    
		this.connect();
		
		this.setProcedure("dbo.Obtener_Concesionarias_habilitadas()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0 && Resultado.equals("OK"))
        	{	
        		ConcesionariaBean RespuestaConcesionaria = new ConcesionariaBean();
        		JOptionPane.showMessageDialog(null,"Va a actualizar: "+result.getString("id_concesionaria"), "ERROR", JOptionPane.ERROR_MESSAGE);
        		Metodo =  result.getString("Metodo");
        	    direccion_url= result.getString("direccion_url");
        	    Servicio = result.getString("Servicio");
        	    id_concesionaria= result.getString("id_concesionaria");
        	    if(Servicio.equals("REST"))
        	    {
        	    	ConcesionariaRest concesionaria = new ConcesionariaRest();
        	    	RespuestaConcesionaria= concesionaria.Cargar_Datos(direccion_url,Metodo);
        	    }
		    	if(Servicio.equals("CXF"))
	    	    {   
	    	    	ConcesionariaCxf concesionariacxf = new ConcesionariaCxf();
	    	    	RespuestaConcesionaria = concesionariacxf.Cargar_Datos(direccion_url,Metodo);    	
	        	}
		    	if(Servicio.equals("AXIS2"))
	    	    {   
	    	    	ConcesionariaAxis2 concesionariaaxis = new ConcesionariaAxis2();
	    	    	RespuestaConcesionaria = concesionariaaxis.Cargar_Datos(direccion_url,Metodo);    	
	        	}
	    	
		    	if (Resultado.equals("OK") && !RespuestaConcesionaria.getNombre().equals("ERROR"))
		    	{
		    		LinkedList<PersonasBean> personas = new LinkedList<PersonasBean>();
		    		LinkedList<FacturasBean> facturas = new LinkedList<FacturasBean>();
		    		LinkedList<PlanesBean> planes = new LinkedList<PlanesBean>();
		    		personas = RespuestaConcesionaria.getPersonas();      	    		
		    		facturas = RespuestaConcesionaria.getFacturas();
		    		planes = RespuestaConcesionaria.getPlanes();
		    		for(PersonasBean p : personas)
		    		{
		    			this.connect();
	    	    		this.setProcedure("dbo.Insertar_Persona (?, ?, ?, ? ,? ,?, ?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    	    	    this.setParameter(1,p.getId_persona());
	    	    	    this.setParameter(2,p.getNombre());
	    	    	    this.setParameter(3,p.getApellido());
	    	    	    this.setParameter(4,p.getDireccion());
	    	    	    this.setParameter(5,p.getMail());
	    	    	    this.setParameter(6,p.getNro_identificador());
	    	    	    this.setParameter(7,p.getTelefono());
	    	    	    this.setParameter(8,p.getIdentificador());
	    	    	    this.executeUpdate();             
	    	    		this.disconnect();	
		    		}
		    		
		    		for(PlanesBean p : planes)
		    		{   
		    			this.connect();
	    	    		this.setProcedure("dbo.Insertar_Planes (?, ?, ?, ? ,? ,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    	    	    this.setParameter(1,p.getIdentificador());
	    	    	    this.setParameter(2,p.getId_concesionaria());
	    	    	    this.setParameter(3,p.getId_persona());
	    	    	    this.setParameter(4,p.getNombre_Auto());
	    	    	    this.setParameter(5,p.getNro_marca());
	    	    	    this.setParameter(6,p.getTipo_Modelo());
	    	    	    this.executeUpdate();           
	    	    		this.disconnect();	
		    		}
		    		
	                     //      LIMPIO LAS FACTURAS EXISTENTES
	   	    		this.connect();
	   	    		this.setProcedure("dbo.Limpiar_Facturas (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	   	    	        	this.setParameter(1,id_concesionaria);       	    	        	  
	   	    	    this.executeUpdate();  
	   	    		this.disconnect();	
	       	    		
	   	    		for(FacturasBean f : facturas)
		    		{   this.connect();
	    	    		this.setProcedure("dbo.Insertar_Facturas (?, ?, ?, ? ,? )", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    	    	    this.setParameter(1,f.getNro_factura());
	    	    	    this.setParameter(2,f.getEstado());
	    	    	    this.setParameter(3,f.getMonto());
	    	    	    this.setParameter(4,f.getIdentificador());
	    	    	    this.setParameter(5,f.getFecha());
	    	    	    this.executeUpdate();            
	    	    		this.disconnect();	
		    		}
	   	    		
	   	    		this.connect();
	   	    		this.setProcedure("dbo.Borrar_Actualizacion(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
	   	    	        	this.setParameter(1,id_concesionaria); 
	   	    	    this.executeUpdate();            
	   	    		this.disconnect();	
	   	    		
	   	    		this.connect();
	   	    		this.setProcedure("dbo.Borrar_actualizacion_concesionaria(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
	   	    	        	this.setParameter(1,id_concesionaria); 
	   	    	    this.executeUpdate();            
	   	    		this.disconnect();
	   	    		
	//                      //       INSERTO LA ACTUALIZACION
	 	    		
	 	    		this.connect();
	 	    		this.setProcedure("dbo.Insertar_Actualizaciones(?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	 	    	        	this.setParameter(1,"S");     
	 	    	        	this.setParameter(2,id_concesionaria); 
	 	    	    this.executeUpdate();            
	 	    		this.disconnect();		
	   	    		
	   	    		this.connect();
	   	    		this.setProcedure("dbo.Insertar_Concesionaria_Actualizacion(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
	   	    	        	this.setParameter(1,id_concesionaria); 
	   	    	    this.executeUpdate();            
	   	    		this.disconnect();	
	   	    		
		    	}
		    	else{
		    		Resultado="ERROR";
		    	}
	    	
	    	
        	    result.next();
    
        	}
        	
               
		this.disconnect();

        return respuesta;
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	


}

