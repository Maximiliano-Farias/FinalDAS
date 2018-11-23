<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="sorteos_detalles">

<table style="margin: 0 auto;">
<tr>
<td><div id=concesionaria_detalles><var><fmt:message key="Consesionaria" bundle="${etq}"/></var><var>${detalles.getConcesionaria()}</var></div></td>
<td><div id=nombre_auto_detalles><var><fmt:message key="Nombre_Auto" bundle="${etq}"/></var><var>${detalles.getNombre_Auto()}</var></div></td>
</tr>
<tr>
<td><div id=tipo_modelo_detalles><var><fmt:message key="Tipo_Modelo" bundle="${etq}"/></var><var>${detalles.getTipo_Modelo()}</var></div>
<td><div id=fecha_notificacion_detalles><var><fmt:message key="Fecha_Notificacion" bundle="${etq}"/></var><var>${detalles.getFecha_Notificacion()}</var></div></td>
</tr>
<tr>
<td colspan="2"><div id=ganador_detalles><var><fmt:message key="Ganador" bundle="${etq}"/></var><var>${detalles.getGanador()}</var></div></td>
</tr>
<tr>
<td colspan="2"><div id="error_detalles" ><var><fmt:message key="Error" bundle="${etq}"/></var><var>${detalles.getError()}</var></div></td>
</tr>
</table>
</div>


