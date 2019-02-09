<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:choose>

	<c:when test="${requestScope.respuesta == 'SI'}">
		<img id="cruz" src="/img/tilde-icon.png"/><input type="hidden" id="error_consumo" value="NO" />
	</c:when>
	<c:when test="${requestScope.respuesta != 'SI'}">
		<img id="cruz" src="/img/cruz-icon.png"/><input type="hidden" id="error_consumo" value="SI" />
	</c:when>
	
</c:choose>
    

	