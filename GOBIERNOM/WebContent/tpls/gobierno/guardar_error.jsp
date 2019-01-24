<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:choose>

	<c:when test="${requestScope.respuesta.getRespuesta() == 'SI'}">
		<fmt:message key="Guardado_Correcto" bundle="${etq}"/>
	</c:when>
	<c:when test="${requestScope.respuesta.getRespuesta() != 'SI'}">
		${requestScope.respuesta.getRespuesta() }<fmt:message key="Guardado_Error" bundle="${etq}"/><input type="hidden" id="error_guardado" value="SI" />
	</c:when>
	
</c:choose>
    

	