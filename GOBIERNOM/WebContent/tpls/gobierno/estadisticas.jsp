<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<input type="button" id="volver" name="volver" Onclick="jGobierno.Opciones()" value ="<fmt:message key="Volver" bundle="${etq}" />" /> 
<table>
	<tr>
		<td><h1 id=estadisticas_titulo><fmt:message key="Estadisticas" bundle="${etq}" /></h1></td>
		<td><input type="image" id="estadisticas-pdf" name="estadisticas-pdf"  src="/img/pdf_icon.png" title=<fmt:message key="Imprimir" bundle="${etq}"/> onclick="jPdf.ImprimirEstaisticas()"/></td>
	</tr>
</table>

<div id=estdisticas_concesionaria>
<h1 id=estadisticas_conc><fmt:message key="Consesionaria" bundle="${etq}" /></h1>
<table>
<tr>
<td><fmt:message key="Activas" bundle="${etq}"/></td><td><fmt:message key="Inactivas" bundle="${etq}"/></td><td>TOTAL</td>
</tr>
<tr>
<td><var >${estadisticas.getCantidad_Concesionarias_Activas()} </var></td><td><var >${estadisticas.getCantidad_Concesionarias_No_Activas()} </var></td><td><var >${estadisticas.getTotal_Concesionarias()} </var></td>
</tr>
</table>
<input type="button" id="Detalle_concesionarias" name="Detalle_concesionarias" Onclick="jGobierno.Concesionarias()" value ="<fmt:message key="Detalle_concesionarias" bundle="${etq}" />" /> 
</div>

<div id=autos_vendidos>
<h1 id=autos_vendi><fmt:message key="Autos_Vendidos" bundle="${etq}" /></h1>
<table>
<thead>
<tr>
<td><fmt:message key="Marca_Auto" bundle="${etq}"/></td>
<td><fmt:message key="Nombre_Auto" bundle="${etq}"/></td>
<td><fmt:message key="Tipo_Modelo" bundle="${etq}"/></td>
<td><fmt:message key="Cantidad" bundle="${etq}"/></td>
</tr>
</thead>
<tbody>
        <c:forEach var="auto" items="${estadisticas.getAutos()}">
					<tr>
					<td><var >${auto.getMarca()} </var></td>
					<td><var >${auto.getNombre_Auto()} </var></td>
					<td><var >${auto.getTipo_Auto()} </var></td>
					<td><var >${auto.getCantidad()} </var></td>
					</tr>

     </c:forEach>
</tbody>
</table>
</div>
<div id=estadisticas_planes>
<h1 id=estadisticas_plan><fmt:message key="Planes" bundle="${etq}" /></h1>
<table>
<tr>
<td><fmt:message key="Activos" bundle="${etq}"/></td>
</tr>
<tr>
<td><var >${estadisticas.getTotal_Planes()} </var></td>
</tr>
</table>
</div>


