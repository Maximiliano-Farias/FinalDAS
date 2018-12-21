<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:choose>

	<c:when test="${requestScope.usuario.getPermiso() == 'ERROR'}">
		<div id="Verificar"> <fmt:message key="ERROR_LOGUEO" bundle="${etq}" />  </div>
	</c:when>
	
	<c:when test="${requestScope.usuario.getPermiso() == 'CREAR'}">
	<div id="nuevo_ingreso"> 
		<div id="nuevo_igreso_titulo">
	     <fmt:message key="NUEVO_INGRESO" bundle="${etq}" /> 
	    </div>
	    <div id="nuevo_igreso_datos">
	       <table>
	       	<tr>
			  <td> <fmt:message key="NUEVO_USUARIO" bundle="${etq}" /></td><td><input type="text" id="nuevo_usuario"name="nuevo_usuario" size="25"/></td>
			</tr> 
			<tr>
			  <td><fmt:message key="NUEVA_CONTRASENA1" bundle="${etq}" /></td><td><input type="password" id="nueva_contrasena_1"name="nueva_contrasena_1" size="25"/></td>
			</tr> 
			<tr>
			  <td><fmt:message key="NUEVA_CONTRASENA2" bundle="${etq}" /></td><td><input type="password" id="nueva_contrasena_2"name="nueva_contrasena_2" size="25"/></td>
			</tr>
			<tr>  
			 <td colspan ='2'><input type="button" id="crear_usuario" name="crear_usuario" Onclick="jGobierno.CrearUsuario()" value ="<fmt:message key="CREAR_USUARIO" bundle="${etq}" />" /></td>
		    </tr>
		    <tr>  
			 <td colspan ='2'><div id="resultado_creacion"></div></td>
		    </tr>
		   </table>
		</div>
	 </div>
	</c:when>
		
	  <c:when test="${requestScope.usuario.getPermiso() != 'CREAR' && requestScopeusuario.getPermiso() != 'ERROR'}">
	   <var id='var' >${usuario.getNombre_Usuario()} </var>, Plan:  <var id='var1' >${usuario.getId_Plan()} </var>
	   <input type="hidden" id="texto_usuario"name="texto_usuario" value='${usuario.getNombre_Usuario()}'/>
	   <input type="hidden" id="perfil"name="perfil" value='${usuario.getPermiso()}'/>
	   <input type="hidden" id="dni"name="dni" value='${usuario.getDni()}'/>
	   <input type="hidden" id="Id_plan"name="Id_plan" value='${usuario.getId_Plan()}'/>
	 
	   
       

     </c:when>
</c:choose>
    

	