package ar.edu.ubp.das.resources;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.fasterxml.jackson.databind.ObjectMapper;

import ar.edu.ubp.das.daos.ConcesionariaDaoImpl;
import ar.edu.ubp.das.forms.*;
import ar.edu.ubp.das.interfac.DaoConcesionaria;


@Path("/concesionaria1")
@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
public class ConcesionariaResource {
	
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public ConcesionariaBean concesionaria1() {
        
		ConcesionariaBean conce = new ConcesionariaBean();
		try{
		      DaoConcesionaria dao = new ConcesionariaDaoImpl();
			 conce = dao.Concesionaria();
			 return conce;
		}

		catch (Exception e){
			return null;
		}
	
	}	
}
