<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table>
<tr>
<td><input type="button" id="Estadisticas" name="Estadisticas" Onclick="jGobierno.Estadisticas()" value ="<fmt:message key="Estadisticas" bundle="${etq}" />" /></td>
<td><input type="button" id="SorteoAnterior" name="SorteoAnterior" Onclick="jGobierno.SorteoAnterior()" value ="<fmt:message key="SorteoAnterior" bundle="${etq}" />" /></td> 
<td><input type="button" id="NuevoSorteo" name="NuevoSorteo" Onclick="jGobierno.Sorteos_Pendientes()" value ="<fmt:message key="NuevoSorteo" bundle="${etq}" />" /></td>
<td rowspan="2"id="UltimoSorteo"><div id="datos_pantalla"> <h2 id="titulo_datos"><fmt:message key="UltimoSorteo" bundle="${etq}"/></h2>
<c:choose>
	<c:when test="${requestScope.ganador.getFecha_Sorteo() != 'Error'}">
		
	   <h3><label><fmt:message key="Fecha" bundle="${etq}" /></label> <var id='Fecha' >${ganador.getFecha_Sorteo()} </var></h3>
	   <h3><label><fmt:message key="Ganador" bundle="${etq}" /></label> <var id='Ganador' >${ganador.getGanador()} </var></h3>
	   <h3><label><fmt:message key="Descripcion" bundle="${etq}" /></label> <var id='Descripcion' >${ganador.getDescripcion()} </var></h3>
	   <h3><label><fmt:message key="Estado" bundle="${etq}" /></label> <var id='Estado' >${ganador.getEstado()} </var></h3>
	   <h3><label><fmt:message key="Nombre_Auto" bundle="${etq}" />:</label> <var id='Nombre_Auto' >${ganador.getNombre_Auto()} </var></h3>
	   <h3><label><fmt:message key="Marca_Auto" bundle="${etq}" /></label> <var id='Marca_Auto' >${ganador.getMarca()} </var></h3>
	   <h3><label><fmt:message key="Tipo_Modelo" bundle="${etq}" />:</label> <var id='Tipo_Modelo' >${ganador.getTipo_Modelo()} </var></h3>
	   <h3><label><fmt:message key="Consesionaria" bundle="${etq}" /></label> <var id='Consesionaria' >${ganador.getConsesionaria()} </var></h3>
	   
	   
	</c:when>		
</c:choose>
</div></td>
</tr>
<tr>
<td><input type="button" id="DatosPersonales" name="DatosPersonales" Onclick="jGobierno.DatosPersonales()" value ="<fmt:message key="DatosPersonales" bundle="${etq}" />" /></td>
<td><input type="button" id="Consesionarias" name="Consesionarias" Onclick="jGobierno.Concesionarias()" value ="<fmt:message key="consesionaria" bundle="${etq}" />" /></td>
<td><input type="button" id="Cuentas" name="Cuentas" Onclick="jGobierno.EstadoCuenta()" value ="<fmt:message key="Cuentas" bundle="${etq}" />" />  </td>

</tr>
</table>