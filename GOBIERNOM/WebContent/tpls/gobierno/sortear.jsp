<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1 id="titulo_sorteo"><fmt:message key="Sorteo" bundle="${etq}"/>  </h1>
<div id="cabecera_sorteo">
	<table >
		<tr>
			<td class="subrayado">NRO:</td><td>${detalles.getNro_sorteo()}</td><td class="subrayado"><fmt:message key="Fecha" bundle="${etq}"/></td><td>${detalles.getFecha()}</td><td class="subrayado"><fmt:message key="Descripcion" bundle="${etq}"/></td><td>${detalles.getDescripcion()}</td>
		</tr>
	</table>
</div>
<div id="condiciones_sorteo">
	<table >
		<thead>
			<tr><td colspan="2"><fmt:message key="Condiciones" bundle="${etq}"/></td></tr>
		</thead>
		<tbody>
			<tr><td><fmt:message key="Concesionarias_actualizadas" bundle="${etq}"/></td><td><div id="sortear_concesionarias"><img id="cruz" src="/img/cruz-icon.png"/></div></td></tr>
			<tr><td><fmt:message key="Ultimo_ganador" bundle="${etq}"/></td><td><div id="sortear_ultimo_ganador"><img id="cruz" src="/img/cruz-icon.png"/></div></td></tr>
			<tr><td><fmt:message key="Participantes" bundle="${etq}"/></td><td><div id="sortear_participantes"><img id="cruz" src="/img/cruz-icon.png"/></div></td></tr>
			<tr><td><fmt:message key="Ganador_obtenido" bundle="${etq}"/></td><td><div id="sortear_ganador"><img id="cruz" src="/img/cruz-icon.png"/></div></tr>
			<tr><td><fmt:message key="Notificando" bundle="${etq}"/></td><td><div id="sortear_notificado"><img id="cruz" src="/img/cruz-icon.png"/></div></td></tr>
	    </tbody>
	</table>
</div>

<div class="contenedor">
<progress id="progreso_sorteo" value="0" max="100"></progress>
<input type="button" id="sortear" value="SORTEAR" onclick="jGobierno.Verificar_Concesionarias()" />
</div>

<div class="resultados">
<input type="button" id="ver_ganador" value="ver ganador" disabled />
<input type="button" id="ver_error" value="ver sorteo" disabled />
</div>





