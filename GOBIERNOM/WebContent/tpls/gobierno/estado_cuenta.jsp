<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div id="div_volver">
<input type="button" id="volver" name="volver" Onclick="jGobierno.Opciones()" value ="<fmt:message key="Volver" bundle="${etq}" />" /> 
</div>
<c:choose>
	<c:when test="${requestScope.Datos.getNombre() == 'admin'}">
	<table></table>
   <div id="cabecera_buscador"><label><fmt:message key="BUSCADOR_PLANES" bundle="${etq}" /></label><input type="text" name="buscador_plan" id="buscador_plan" size="35"  /><input type="button" id="boton_buscador" name="boton_buscador" onclick="jGobierno.Buscando()" value ="<fmt:message key="Buscar" bundle="${etq}" />"  /></div>
    <div id="resultado_busqueda"></div>
    </c:when>
    <c:otherwise> test="${requestScope.Datos.getNombre() != 'admin'}">
		
		<h1 id="titulo_estado"><fmt:message key="Cuentas" bundle="${etq}"/>  </h1>
		
		<div id="Estado_detalles">
		
			<table >
			<tr>
				<td id= 'nomb'><fmt:message key="Nombre_Auto" bundle="${etq}"/></td><td> ${Datos.getNombre_Auto()}</td>
				<td id= 'mod'><fmt:message key="Tipo_Modelo" bundle="${etq}"/></td><td> ${Datos.getTipo_Modelo()}</td>
				<td id= 'conc'><fmt:message key="Consesionaria" bundle="${etq}"/></td><td> ${Datos.getNombre()}</td>
				<td id= 'fec'><fmt:message key="Actualizacion" bundle="${etq}"/></td><td> ${Datos.getFecha_actualizada()}</td>		
				</tr>		
			</table>		
		</div>
		<div id="Facturas_detalles">
		<table >
			<thead>
				<tr>
					<td>NRO</td>
					<td><fmt:message key="Estado" bundle="${etq}"/></td>
					<td><fmt:message key="Vencimiento" bundle="${etq}"/></td>
					<td><fmt:message key="Monto" bundle="${etq}"/></td>
			    </tr>
			</thead>
		<tbody>
		
		    <c:forEach var="Factura" items="${Datos.getFacturas()}">
		         <tr>
			         <td>${Factura.getNro_factura()} </td>
			         <td>${Factura.getEstado()} </td>
			         <td>${Factura.getFecha()} </td>
			         <td>$${Factura.getMonto()} </td>
		         </tr>
		    </c:forEach>
		</tbody>
		<tfoot>
		<tr>
		<td colspan= '3'><fmt:message key="Deuda" bundle="${etq}"/></td><td>$ ${Datos.getMonto_Adeudado()}</td>
		</tr>
		</tfoot>
		</table>
		</div>
    </c:otherwise>
</c:choose>


