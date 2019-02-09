package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.*;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;


public  class MSConsumirConcesionariasDao extends DaoImpl {

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
    	String Resultado="SI";
		respuesta.setRespuesta(Resultado);
    	String id_concesionaria="";
    	LinkedList <ConcesionariaConsumo> listado = new LinkedList <ConcesionariaConsumo>();
    	ConcesionariaConsumo Concesionaria= new ConcesionariaConsumo(); 
    	ListadoConcesionariaConsumo Concesionarias = new ListadoConcesionariaConsumo();
    
		this.connect();
		
		this.setProcedure("dbo.Obtener_Concesionarias_habilitadas()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0 && Resultado.equals("SI"))
        	{	
        		//ConcesionariaBean RespuestaConcesionaria = new ConcesionariaBean();
        		Metodo =  result.getString("Metodo");
        	    direccion_url= result.getString("direccion_url");
        	    Servicio = result.getString("Servicio");
        	    id_concesionaria= result.getString("id_concesionaria");
        	    Concesionaria= new ConcesionariaConsumo(); 
        	    Concesionaria.setDireccion_url(direccion_url);
        	    Concesionaria.setMetodo(Metodo);
        	    Concesionaria.setServicio(Servicio);
        	    Concesionaria.setId_concesionaria(id_concesionaria);
        	    listado.add(Concesionaria);
        	    
        	    
        	   /* if(Servicio.equals("REST"))
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
	    	   
		    	if (Resultado.equals("SI") && !RespuestaConcesionaria.getNombre().equals("ERROR"))
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
		    		respuesta.setRespuesta("ERROR");
		    	}
	    	*/
	    	
        	   
        	    result.next();
    
        	}
        	
        	 Concesionarias.setConcesionarias(listado);
        	
        return Concesionarias;
		
	}
	
	public void insertar_datos(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		
		String Respuesta = "SI";
		LinkedList<PersonasBean> personas = new LinkedList<PersonasBean>();
		LinkedList<FacturasBean> facturas = new LinkedList<FacturasBean>();
		LinkedList<PlanesBean> planes = new LinkedList<PlanesBean>();
		personas = respuestaConcesionaria.getPersonas();      	    		
		facturas = respuestaConcesionaria.getFacturas();
		planes = respuestaConcesionaria.getPlanes();
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
   	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria());       	    	        	  
   	    this.executeUpdate();  
   		this.disconnect();	
	    		
   		for(FacturasBean f : facturas)
		{   this.connect();
		 
    		this.setProcedure("dbo.Insertar_Facturas (?, ?, ?, ? ,?, ? )", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
    	    this.setParameter(1,f.getNro_factura());
    	    this.setParameter(2,f.getEstado());
    	    this.setParameter(3,f.getMonto());
    	    this.setParameter(4,f.getIdentificador());
    	    this.setParameter(5,f.getFecha());
    	    this.setParameter(6,f.getCobro());
    	    this.executeUpdate();            
    		this.disconnect();	
		}
   		
   		this.connect();
   		this.setProcedure("dbo.Borrar_Actualizacion(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
   	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria()); 
   	    this.executeUpdate();            
   		this.disconnect();	
   		
   		this.connect();
   		this.setProcedure("dbo.Borrar_actualizacion_concesionaria(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
   	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria()); 
   	    this.executeUpdate();            
   		this.disconnect();
   		
//                      //       INSERTO LA ACTUALIZACION
 		
 		this.connect();
 		this.setProcedure("dbo.Insertar_Actualizaciones(?, ?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
 	        	this.setParameter(1,"S");     
 	        	this.setParameter(2,respuestaConcesionaria.getId_concesionaria()); 
 	    this.executeUpdate();            
 		this.disconnect();		
   		
   		this.connect();
   		this.setProcedure("dbo.Insertar_Concesionaria_Actualizacion(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);     
   	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria()); 
   	    this.executeUpdate();            
   		this.disconnect();	
		
   		return Respuesta;
   		
	}
	
	
	

}

