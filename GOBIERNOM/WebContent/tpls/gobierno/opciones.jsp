<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${lang}" />
<table>
<tr>
<td>
	<div id="Estadisticas"  Onclick="jOpciones.Estadisticas()"  >
		<label id="estadisticas_tle"><fmt:message key="Estadisticas" bundle="${etq}" /></label>
		<input type="image" id="estadisticas-img" name="estadisticas-img"  src="/img/estadisticas-icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
    </div>
</td>
<td>
	<div id="SorteoAnterior"  Onclick="jOpciones.SorteoAnterior()"> 
		<label id="sorteo_anterior_tle"><fmt:message key="SorteoAnterior" bundle="${etq}" /> </label>
		<input type="image" id="sorteo_anterior-img" name="sorteo_anterior-img"  src="/img/sorteo_ant_icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
	</div>
</td> 
<td><div  id="NuevoSorteo"  Onclick="jOpciones.Sorteos_Pendientes()"> 
<label id="sorteo_tle"><fmt:message key="NuevoSorteo" bundle="${etq}" /> </label>
<input type="image" id="sorteo-img" name="sorteo-img"  src="/img/sorteo_icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
</div>
</td>


<td rowspan="2"id="UltimoSorteo"><div id="datos_pantalla"> <h2 id="titulo_datos"><fmt:message key="UltimoSorteo" bundle="${etq}"/></h2>

	<c:choose>
		<c:when test="${requestScope.ganador.getFecha_Sorteo() != 'Error'}">		
		   <h3><label><fmt:message key="Fecha" bundle="${etq}" /></label> <fmt:formatDate value="${ganador.getFecha_original()}" dateStyle="full" /></h3>
		   <h3><label><fmt:message key="Ganador" bundle="${etq}" /></label> <var id='Ganador' >${ganador.getGanador()} </var></h3>
		   <h3><label><fmt:message key="Descripcion" bundle="${etq}" /></label> <var id='Descripcion' >${ganador.getDescripcion()} </var></h3>
		   <h3><label><fmt:message key="Estado" bundle="${etq}" /></label> <var id='Estado' >${ganador.getEstado()} </var></h3>
		   <h3><label><fmt:message key="Nombre_Auto" bundle="${etq}" />:</label> <var id='Nombre_Auto' >${ganador.getNombre_Auto()} </var></h3>
		   <h3><label><fmt:message key="Marca_Auto" bundle="${etq}" /></label> <var id='Marca_Auto' >${ganador.getMarca()} </var></h3>
		   <h3><label><fmt:message key="Tipo_Modelo" bundle="${etq}" /></label> <var id='Tipo_Modelo' >${ganador.getTipo_Modelo()} </var></h3>
		   <h3><label><fmt:message key="Consesionaria" bundle="${etq}" /></label> <var id='Consesionaria' >${ganador.getConsesionaria()} </var></h3>	   
		</c:when>		
	</c:choose>
</div>
</td>
</tr>
<tr>
<td>
	<div id="DatosPersonales"  Onclick="jOpciones.DatosPersonales()"  >
		<label id="datos_personales_tle"><fmt:message key="DatosPersonales" bundle="${etq}" /></label>
		<input type="image" id="personal-img" name="personal-img"  src="/img/personal-icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
    </div>
</td>
<td>
	<div id="Consesionarias"  Onclick="jOpciones.Concesionarias()"  >
		<label id="concesionaria_tle"><fmt:message key="consesionaria" bundle="${etq}" /></label>
		<input type="image" id="concesionaria-img" name="concesionaria-img"  src="/img/concesionaria-icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
    </div>
</td>
<td>
	<div id="Cuentas"  Onclick="jOpciones.EstadoCuenta()"  >
		<label id="cuentas_tle"><fmt:message key="Cuentas" bundle="${etq}" /></label>
		<input type="image" id="cuentas-img" name="cuentas-img"  src="/img/estado-icon.png" title=<fmt:message key="Buscar" bundle="${etq}"/>  />
    </div>
</td>

</tr>
</table>