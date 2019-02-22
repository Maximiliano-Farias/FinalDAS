<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="div_volver">
<input type="button" id="volver" name="volver" Onclick="jGobierno.Opciones()" value ="<fmt:message key="Volver" bundle="${etq}" />" /> 
</div>
<c:choose>
	<c:when test="${requestScope.Datos.getNombre() == 'admin'}">
    <div id="cabecera_buscador">
    
    <table>
    	<tr>
    		<td>
				<fmt:message key="Consesionaria" bundle="${etq}" />
			</td>
			<td>
			   <select id="concesionaria_elegida">
			   <option value=""><fmt:message key="TODAS" bundle="${etq}" /></option>
			   <c:forEach var="Concesionaria" items="${Datos.getConcesionarias()}">         
					         <option value="${Concesionaria.getId_concesionaria()}">${Concesionaria.getNombre()}</option>	         
					    </c:forEach>
			   </select>
			</td>
	     </tr>
		<tr>
			<td>
			   <label><fmt:message key="BUSCADOR_PLANES" bundle="${etq}" /></label>
			</td>
			<td>
			   <input type="text" name="buscador_plan" id="buscador_plan" size="20" value="" />
			</td>
		</tr>
		<tr>
			<td colspan='2'>
   				<input type="button" id="boton_buscador" name="boton_buscador" onclick="jGobierno.Buscando()" value ="<fmt:message key="Buscar" bundle="${etq}" />" src="/img/busca.png"  />
            </td>
        </tr>
   </table>
   </div>
    <div id="resultado_busqueda"></div>
    </c:when>
    <c:otherwise> 
		<h1 id="titulo_estado"><fmt:message key="Cuentas" bundle="${etq}"/>  </h1>	
		<div id="Estado_detalles">		
			<table >
				<tr>
					<td id= 'nomb'><fmt:message key="Nombre_Auto" bundle="${etq}"/>:</td><td id= 'nombr'> ${Datos.getNombre_Auto()}</td>
					<td id= 'mod'><fmt:message key="Tipo_Modelo" bundle="${etq}"/>:</td><td id= 'mode'> ${Datos.getTipo_Modelo()}</td>
					<td id= 'conc'><fmt:message key="Consesionaria" bundle="${etq}"/></td><td id= 'conce'> ${Datos.getNombre()}</td>
					<td id= 'fec'><fmt:message key="Actualizacion" bundle="${etq}"/></td><td id= 'fech'> ${Datos.getFecha_actualizada()}</td>		
				</tr>	
				<c:if test="${Datos.getDominio() != '-'}">
				<tr>
					<td colspan='8'><fmt:message key="ADJUDICADO" bundle="${etq}"/>: <fmt:message key="DOMINIO" bundle="${etq}"/>: ${Datos.getDominio()} -
					<fmt:message key="CHASIS" bundle="${etq}"/>: ${Datos.getChasis()} - 
					<fmt:message key="MOTOR" bundle="${etq}"/>: ${Datos.getMotor()} </td>			
				</tr>
				</c:if>	
			</table>		
		</div>
		<div id="Facturas_detalles">
		<table id="tabla_facturas">
			<thead>
				<tr>
					<td>NRO</td>
					<td><fmt:message key="Estado" bundle="${etq}"/></td>
					<td><fmt:message key="Vencimiento" bundle="${etq}"/></td>
					<td><fmt:message key="Fecha_Cobro" bundle="${etq}"/></td>
				    <td><fmt:message key="Monto" bundle="${etq}"/></td>
			    </tr>
			</thead>
		<tbody>		
		    <c:forEach var="Factura" items="${Datos.getFacturas()}">
		         <tr>
			         <td>${Factura.getNro_factura()} </td>
			         <td>${Factura.getEstado()} </td>
			         <td>${Factura.getFecha()} </td>
			         <td>${Factura.getCobro()} </td>
			         <td>$${Factura.getMonto()} </td>
			         
		         </tr>
		    </c:forEach>
		</tbody>
		<tfoot>
		<tr>
		<td><fmt:message key="Deuda" bundle="${etq}"/></td><td></td><td></td><td></td><td>$ ${Datos.getMonto_Adeudado()}</td>
		</tr>
		</tfoot>
		</table>
		</div>
		<input type="image" id="imprimir_estado" name="imprimir_estado"  src="/img/pdf_icon.png" title=<fmt:message key="Imprimir" bundle="${etq}"/> onclick="jPdf.imprimirPDFEstado()"/>
    </c:otherwise>
</c:choose>




