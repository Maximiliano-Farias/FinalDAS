package ar.edu.ubp.das.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.LinkedList;

import ar.edu.ubp.das.forms.ConcesionariaBean;
import ar.edu.ubp.das.forms.FacturasBean;
import ar.edu.ubp.das.forms.PersonasBean;
import ar.edu.ubp.das.forms.PlanesBean;
import ar.edu.ubp.das.interfac.DaoConcesionaria;

public class ConcesionariaDaoImpl implements DaoConcesionaria {

	@Override
	public ConcesionariaBean Concesionaria() throws Exception {
		Connection conn;
        CallableStatement st;
        ResultSet result;

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=CONCESIONARIA5", "concesionaria5", "concesionaria5");
        conn.setAutoCommit(true);

    
        	LinkedList<PersonasBean> personas = new LinkedList<PersonasBean>();
        	PersonasBean persona;
        	LinkedList<FacturasBean> facturas = new LinkedList<FacturasBean>();
        	FacturasBean factura;
        	LinkedList<PlanesBean> planes = new LinkedList<PlanesBean>();
        	PlanesBean plan;
        	ConcesionariaBean concesionaria;
        	concesionaria = new ConcesionariaBean();
        	

            st = conn.prepareCall("{call datos_concesionaria()}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            result = st.executeQuery();
        	result.next();
            while(result.getRow() > 0) {
            	
            	concesionaria.setId_concesionaria(result.getString("id_concesionaria"));
            	concesionaria.setNombre(result.getString("Nombre"));
            	concesionaria.setHabilitado(result.getString("Habilitado"));
            	concesionaria.setDireccion(result.getString("Direccion"));
            	concesionaria.setTelefono(result.getString("Telefono"));
            	concesionaria.setEmail(result.getString("Email"));
            	result.next();
            }
            
            st.close();
            
            st = conn.prepareCall("{call datos_planes()}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            result = st.executeQuery();
        	result.next();
            while(result.getRow() > 0) {
            	plan = new PlanesBean();
            	plan.setId_plan(result.getInt("id_plan"));
            	plan.setId_concesionaria(result.getString("id_concesionaria"));
            	plan.setIdentificador(result.getString("Identificador"));
            	plan.setId_persona(result.getInt("id_persona"));
            	plan.setNombre_Auto(result.getString("Nombre_Auto"));
            	plan.setNro_marca(result.getInt("nro_marca"));
            	plan.setTipo_Modelo(result.getString("Tipo_Modelo"));
            	planes.add(plan);
            	result.next();
            }
            st.close();
            
            concesionaria.setPlanes(planes);
            
            st = conn.prepareCall("{call datos_facturas()}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            result = st.executeQuery();
        	result.next();
            while(result.getRow() > 0) {
            	factura = new FacturasBean();
            	factura.setNro_factura(result.getInt("nro_factura"));
            	factura.setEstado(result.getString("Estado"));
            	factura.setMonto(result.getFloat("Monto"));
            	factura.setIdentificador(result.getString("Identificador"));
            	factura.setFecha(result.getString("Fecha"));
            	factura.setCobro(result.getString("Cobro"));
            	
            	facturas.add(factura);
            	result.next();
            }
            st.close();
            
            concesionaria.setFacturas(facturas);
            
            
            st = conn.prepareCall("{call datos_personas()}", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            result = st.executeQuery();
        	result.next();
            while(result.getRow() > 0) {
            	persona = new PersonasBean();
            	persona.setId_persona(result.getInt("id_persona"));
            	persona.setNombre(result.getString("Nombre"));
            	persona.setApellido(result.getString("Apellido"));
            	persona.setDireccion(result.getString("Direccion"));
            	persona.setMail(result.getString("Mail"));
            	persona.setNro_identificador(result.getInt("nro_identificador"));
            	persona.setTelefono(result.getString("Telefono"));
            	persona.setIdentificador(result.getString("Identificador"));

            	personas.add(persona);
            	result.next();
            }
            st.close();
        
            concesionaria.setPersonas(personas);
   
              return concesionaria;
	}

}
