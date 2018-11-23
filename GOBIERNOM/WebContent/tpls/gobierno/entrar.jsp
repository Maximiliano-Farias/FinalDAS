<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:choose>
	<c:when test="${requestScope.usuario.getNombre_Usuario() != 'Error'}">
		
	   <var id='var' >${usuario.getNombre_Usuario()} </var>, Plan:  <var id='var' >${usuario.getId_Plan()} </var>
	   <input type="hidden" id="texto_usuario"name="texto_usuario" value='${usuario.getNombre_Usuario()}'/>
	   <input type="hidden" id="perfil"name="perfil" value='${usuario.getPermiso()}'/>
	   <input type="hidden" id="dni"name="dni" value='${usuario.getDni()}'/>
	   <input type="hidden" id="Id_plan"name="Id_plan" value='${usuario.getId_Plan()}'/>
	</c:when>
		
</c:choose>
    
<div id="Verificar"> *ERROR   </div>	