<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div id="resultado_creacion">
<c:choose>
	<c:when test="${requestScope.respuesta.getRespuesta() == 'Error'}">
	   <h1><label><fmt:message key="CREADO_ERROR" bundle="${etq}" /></label> </h1>
	</c:when>	
	<c:when test="${requestScope.respuesta.getRespuesta() == 'OK'}">
	   <h1><label><fmt:message key="CREADO_CORRECTO" bundle="${etq}" /></label> </h1>
	</c:when>	
		<c:when test="${requestScope.respuesta.getRespuesta() == 'Distintos'}">
	   <h1><label><fmt:message key="CONTRASENAS_DISTINTAS" bundle="${etq}" /></label> </h1>
	</c:when>	
</c:choose>
</div>