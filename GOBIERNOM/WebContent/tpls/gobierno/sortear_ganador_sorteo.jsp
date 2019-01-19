<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:choose>

	<c:when test="${requestScope.respuesta.getRespuesta() == 'SI'}">
		<img id="cruz" src="/img/tilde-icon.png"/>
		<input type="hidden" id="error_ganador" value="NO" />
		<input type="hidden" id="fecha_sorteo" value="<fmt:message key="Fecha" bundle="${etq}"/> ${requestScope.respuesta.getFecha_Sorteo()}" />
		<input type="hidden" id="ganador_sorteo" value="<fmt:message key="Ganador" bundle="${etq}"/>${requestScope.respuesta.getGanador()}" />
		<input type="hidden" id="nombre_auto_sorteo" value="<fmt:message key="Nombre_Auto" bundle="${etq}"/>: ${requestScope.respuesta.getNombre_Auto()}" />
		<input type="hidden" id="concesionaria_sorteo" value="<fmt:message key="Consesionaria" bundle="${etq}"/>${requestScope.respuesta.getConsesionaria()}" />
		<input type="hidden" id="tipo_modelo_sorteo" value="<fmt:message key="Tipo_Modelo" bundle="${etq}"/>${requestScope.respuesta.getTipo_Modelo()}" />
		<input type="hidden" id="identificador_sorteo" value="ID:${requestScope.respuesta.getIdentificador()}" />
		<input type="hidden" id="email_ganador_sorteo" value="<fmt:message key="Email_Ganador" bundle="${etq}"/>${requestScope.respuesta.getEmail_Ganador()}" />
		<input type="hidden" id="email_concesionaria_sorteo" value="<fmt:message key="Email_Concesionaria" bundle="${etq}"/>${requestScope.respuesta.getEmail_Concesionaria()}" />
		<input type="hidden" id="telefono_sorteo" value="TEL: ${requestScope.respuesta.getTelefono()}" />
		<input type="hidden" id="direccion_ganador_sorteo" value="<fmt:message key="Direccion_Ganador" bundle="${etq}"/>${requestScope.respuesta.getDireccion_Ganador()}" />
		<input type="hidden" id="direccion_concesionaria_sorteo" value="<fmt:message key="Direccion_Concesionaria" bundle="${etq}"/>${requestScope.respuesta.getDireccion_Concesionaria()}" />
	</c:when>
	<c:when test="${requestScope.respuesta.getRespuesta() != 'SI'}">
		<img id="cruz" src="/img/cruz-icon.png"/><input type="hidden" id="error_ganador" value="SI" />
	</c:when>
	
</c:choose>
    

	