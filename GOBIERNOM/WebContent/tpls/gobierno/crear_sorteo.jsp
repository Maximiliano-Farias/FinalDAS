<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

                <h1 id="titulo2"><fmt:message key="CREAR" bundle="${etq}"/>  </h1>
				<div id="sorteos_nuevo">
				<table >
				<tr>
				<td><fmt:message key="Fecha" bundle="${etq}"/> DD/MM/AAAA<input type="text" id="fecha_sorteo_crear" name="fecha_sorteo_crear" value="" maxlength="10" size="25"/></td>
				<td>
				        <select id="Estado_sorteo_crear" name="Estado_sorteo_crear">
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        </select>
				        <br />
				</td>
				<td><input type="text" id="descripcion_sorteo_crear" name="descripcion_sorteo_crear" value="" size="40" /></td>
				<td><input type="image" id="guardar_sorteo" name="guardar_sorteo" onclick="jGobierno.Crear_Sorteo()"src="/img/guardar.jpg" title=<fmt:message key="CREAR" bundle="${etq}"/> title=<fmt:message key="CREAR" bundle="${etq}"/>  /></td>
				</tr>
				</table>
				</div>


