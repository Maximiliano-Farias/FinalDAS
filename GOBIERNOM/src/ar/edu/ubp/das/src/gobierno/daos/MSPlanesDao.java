package ar.edu.ubp.das.src.gobierno.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;
import javax.swing.JOptionPane;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;
import ar.edu.ubp.das.src.gobierno.forms.PlanForm;
import ar.edu.ubp.das.src.gobierno.forms.PlanesForm;


public class MSPlanesDao extends DaoImpl {

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
    	
		PlanesForm planes;
    	PlanForm plan;
    	planes = new PlanesForm();
    	LinkedList<PlanForm> plans;
    	plans= new LinkedList<PlanForm>();
   	
				this.connect();
				
				this.setProcedure("dbo.Buscador_Planes (?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
			       if(form.getItem("texto").isEmpty()) {
					  JOptionPane.showMessageDialog(null,"ERROR TEXTO BUSQUEDA", "ERROR", JOptionPane.ERROR_MESSAGE);
					  this.setNull(1, Types.TINYINT);	
			        	
			        }
			        else {
			        	this.setParameter(1,(form.getItem("texto"))); 	
			        }
				
		        ResultSet result = this.getStatement().executeQuery();
		
		        result.next();
		        	
		        	while(result.getRow() > 0)
		        	{	plan = new PlanForm();
		        	    plan.setId_persona(result.getString("id_persona"));
		        	    plan.setIdentificador(result.getString("Identificador"));
			        	plan.setApellido(result.getString("Apellido"));
			        	plan.setNombre(result.getString("Nombre"));
			        	plan.setNombre_Auto(result.getString("Nombre_Auto"));
			        	plan.setTipo_modelo(result.getString("Tipo_modelo"));
			        	plans.add(plan);
			        	result.next();
		        	}
		        	     
				this.disconnect();
				
				planes.setPlanes(plans);
				
				
		return  planes;
    	
		
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException {
		// TODO Auto-generated method stub
		return null;	
	}

}
