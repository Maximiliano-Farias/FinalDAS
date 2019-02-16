package ar.edu.ubp.das.concesionaria.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import ar.edu.ubp.das.forms.ConcesionariaBean;
import ar.edu.ubp.das.forms.FacturasBean;
import ar.edu.ubp.das.forms.PersonasBean;
import ar.edu.ubp.das.forms.PlanesBean;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSConcesionariaDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();
        return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		
		this.connect();
		this.setProcedure("Insertar_Detalle_Sorteo(?,?,?,?,?,?,?,?,?)");
		this.setParameter(1,Integer.parseInt(form.getItem("nro_sorteo")));
		this.setParameter(2,Integer.parseInt(form.getItem("id_persona")));
		this.setParameter(3,form.getItem("Nombre"));
		this.setParameter(4,form.getItem("Apellido"));
		this.setParameter(5,form.getItem("Identificador"));
		this.setParameter(6,form.getItem("Id_Consesionaria"));
		this.setParameter(7,form.getItem("Nombre_Auto"));
		this.setParameter(8,Integer.parseInt(form.getItem("Nro_Marca")));
		this.setParameter(9,form.getItem("Tipo_Modelo"));
		this.getStatement().execute();
		this.disconnect();

	}

	@Override
	public void update(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	public ConcesionariaBean select() throws SQLException {
		
		this.connect();
        	LinkedList<PersonasBean> personas = new LinkedList<PersonasBean>();
        	PersonasBean persona;
        	LinkedList<FacturasBean> facturas = new LinkedList<FacturasBean>();
        	FacturasBean factura;
        	LinkedList<PlanesBean> planes = new LinkedList<PlanesBean>();
        	PlanesBean plan;
        	ConcesionariaBean concesionaria;
        	concesionaria = new ConcesionariaBean();
        	
        	this.connect();
        	this.setProcedure("dbo.datos_concesionaria()");

        	ResultSet result = this.getStatement().executeQuery();
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
            
            this.disconnect();

            this.connect();
            this.setProcedure("dbo.datos_planes()");

            result = this.getStatement().executeQuery();
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
            this.disconnect();

            concesionaria.setPlanes(planes);
            
            
            this.connect();
            this.setProcedure("dbo.datos_facturas()");

            result = this.getStatement().executeQuery();
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
            this.disconnect();

            concesionaria.setFacturas(facturas);
            
            this.connect();
            this.setProcedure("dbo.datos_personas()");

            result = this.getStatement().executeQuery();
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
            this.disconnect();

            concesionaria.setPersonas(personas);

              return concesionaria;
	}
	

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
