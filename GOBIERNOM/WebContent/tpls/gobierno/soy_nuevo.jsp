<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




 <h1 id='titulo4' ><fmt:message key="BIENVENIDA" bundle="${etq}" /></h1>  
 <div id="descripcion_ingreso"><fmt:message key="DESCRIPCION" bundle="${etq}" /> </div> 
 <div id="paso1"><fmt:message key="PASO1" bundle="${etq}" /> </div>    
 <div id="paso2"><fmt:message key="PASO2" bundle="${etq}" /> </div>     
 <div id="Sucursal"><input type="button" id="Sucursales" name="Sucursales" Onclick="jOpciones.Sucursales()" value ="<fmt:message key="Sucursales" bundle="${etq}" />" /> </div>  
   

