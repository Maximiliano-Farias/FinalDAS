package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.ConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.DatosNotificaGanadorForm;
import ar.edu.ubp.das.src.gobierno.forms.GanadorForm;
import ar.edu.ubp.das.src.gobierno.forms.ListadoConcesionariaConsumo;
import ar.edu.ubp.das.src.gobierno.forms.RespuestaForm;

public class MSNotificarConcesionariasDao extends DaoImpl {

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
    	String direccion_url,Servicio,Metodo_pago,id_concesionaria="";
    	String Resultado="SI";
		respuesta.setRespuesta(Resultado);
    	LinkedList <ConcesionariaConsumo> listado = new LinkedList <ConcesionariaConsumo>();
    	ConcesionariaConsumo Concesionaria= new ConcesionariaConsumo(); 
    	ListadoConcesionariaConsumo Concesionarias = new ListadoConcesionariaConsumo();
    	DatosNotificaGanadorForm Datos = new DatosNotificaGanadorForm();
    	GanadorForm Ganador =new GanadorForm();
    	
    	
		this.connect();
		
		this.setProcedure("dbo.Concesionarias_Sin_Notificar()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        	
        	while(result.getRow() > 0 && Resultado.equals("SI"))
        	{	
        		
        	    direccion_url= result.getString("direccion_url");
        	    Servicio = result.getString("Servicio");
        	    id_concesionaria= result.getString("id_concesionaria");
        	    Metodo_pago= result.getString("Metodo_pago");
        	    Concesionaria= new ConcesionariaConsumo(); 
        	    Concesionaria.setDireccion_url(direccion_url);
        	    Concesionaria.setMetodo_pago(Metodo_pago);
        	    Concesionaria.setServicio(Servicio);
        	    Concesionaria.setId_concesionaria(id_concesionaria);
        	    listado.add(Concesionaria);
        	    result.next();
    
        	}
        	
        	this.disconnect();
        	
        	Concesionarias.setConcesionarias(listado);
        	Datos.setConcesionarias(Concesionarias);
        	
        	this.connect();
    		
    		this.setProcedure("dbo.Datos_Ganador_Concesionarias()", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
            result = this.getStatement().executeQuery();

            result.next();
            	
            	while(result.getRow() > 0 && Resultado.equals("SI"))
            	{	
            		
            	    Ganador.setNro_sorteo(result.getString("nro_sorteo"));
            	    Ganador.setId_persona(result.getString("id_persona"));
            	    Ganador.setIdentificador(result.getString("Identificador"));
            	    Ganador.setApellido(result.getString("Apellido"));
            	    Ganador.setNombre(result.getString("Nombre"));
            	    Ganador.setNombre_Auto(result.getString("Nombre_Auto"));
            	    Ganador.setTipo_Modelo(result.getString("Tipo_modelo"));
            	    Ganador.setMarca(result.getString("nro_marca"));
            	    Ganador.setId_Concesioria(result.getString("Id_Consesionaria"));
            	    result.next();
        
            	}
            	
            	this.disconnect();
        	
            	Datos.setGanador(Ganador);
        	 
        	 
        	
        return Datos;
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		String Respuesta = "SI";
		
                     //       INSERTO LA ACTUALIZACION
 		
 		this.connect();
 		this.setProcedure("dbo.notificada_con_ganador(?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);   
 	        	this.setParameter(1,respuestaConcesionaria.getId_concesionaria()); 
 	    this.executeUpdate();            
 		this.disconnect();		
   		return Respuesta;
   		
	}
		

	

}
