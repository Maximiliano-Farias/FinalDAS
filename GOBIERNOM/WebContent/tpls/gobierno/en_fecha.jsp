<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<input type="hidden" id="en_fecha_sorteo" name="en_fecha_sorteo" value="${requestScope.respuesta.getRespuesta()}"/>
<c:choose>

	<c:when test="${requestScope.respuesta.getRespuesta() == 'SI'}">
		<fmt:message key="EN_FECHA" bundle="${etq}"/>
	</c:when>
	<c:when test="${requestScope.respuesta.getRespuesta() != 'SI'}">
		<fmt:message key="NO_EN_FECHA" bundle="${etq}"/>
	</c:when>
	
</c:choose>
    

	