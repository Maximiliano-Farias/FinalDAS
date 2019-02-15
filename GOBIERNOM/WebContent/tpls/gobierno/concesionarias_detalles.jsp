<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h1 id="titulo1"><fmt:message key="ACTUALIZAR" bundle="${etq}"/>  </h1>


<div id="concesionarias_detalles">
<table >
	<tr>
		<td>ID:</td><td><input type="text" id="id_concesionaria" name="id_concesionaria" value="${detalles.getId_concesionaria()}" readonly="readonly" size="40"/></td>
		<td><fmt:message key="NOMBRE" bundle="${etq}"/>:</td><td><input type="text" id="nombre_concesionaria" name="nombre_concesionaria" value="${detalles.getNombre()}"  size="25"/></td>
		<td><fmt:message key="Estado" bundle="${etq}"/></td>
		<td>
		    <c:choose>
		    <c:when test="${detalles.getHabilitado() == 1}">
		        <select id="Habilitado" name="Habilitado">
		        <option value="1"><fmt:message key="Habilitada" bundle="${etq}"/></option>
		        <option value="0"><fmt:message key="Deshabilitada" bundle="${etq}"/></option>
		        </select>
		        <br />
		    </c:when>    
		    <c:otherwise>
		        <select id="Habilitado" name="Habilitado">
		        <option value="0"><fmt:message key="Deshabilitada" bundle="${etq}"/></option>
		        <option value="1"><fmt:message key="Habilitada" bundle="${etq}"/></option>
		        </select>
		        <br />
		    </c:otherwise>
		    </c:choose>
		</td>
		<td rowspan="2">
		   <c2:choose>
				<c2:when test="${detalles.getPermiso() == 'admin'}">
					<input type="image" id="guardar_concesionaria" name="guardar_concesionaria" onclick="jGobierno.Guardar_Concesionaria()" src="/img/guardar.jpg" title=<fmt:message key="Guardar" bundle="${etq}"/>  />
			    </c2:when>
		    </c2:choose>
	    </td>
	</tr>
	<tr>
		<td>DIR:</td><td><input type="text" id="direccion_concesionaria" name="direccion_concesionaria" value="${detalles.getDireccion()}" size="40" /></td>
		<td><fmt:message key="Telefono" bundle="${etq}"/></td><td><input type="text" id="telefono_concesionaria" name="telefono_concesionaria" value="${detalles.getTelefono()}" size="25"/></td>
		<td><fmt:message key="Ultima_Actualizacion" bundle="${etq}"/></td><td><input type="text" id="fecha_concesionaria" name="fecha_concesionaria" value="${detalles.getFecha_actualizacion()}" readonly="readonly" size="15"/></td>
	</tr>
	<tr>
		<td>URL:</td><td><input type="text" id="url_concesionaria" name="url_concesionaria" value="${detalles.getDireccion_url()}" size="70" /></td>
		<td>M1</td><td><input type="text" id="metodo_1_concesionaria" name="metodo_1_concesionaria" value="${detalles.getMetodo()}" size="25"/></td>
		<td>M2</td><td><input type="text" id="metodo_2_concesionaria" name="metodo_2_concesionaria" value="${detalles.getMetodo_pago()}" size="15"/></td>
	</tr>
	<tr>
		<td></td> <td></td> 
		<td colspan='2'>
		<fmt:message key="Servicio" bundle="${etq}"/>
		<c:choose>
		    <c:when test="${detalles.getServicio() == 'AXIS2'}">
		        <select id="Servicio" name="Servicio">
		        <option value="AXIS2">AXIS2</option>
		        <option value="CXF">CXF</option>
		        <option value="REST">REST</option>
		        </select>
		    </c:when>    
		    <c:when test="${detalles.getServicio() == 'REST'}">
		        <select id="Servicio" name="Servicio">
		        <option value="REST">REST</option>
		        <option value="AXIS2">AXIS2</option>
		        <option value="CXF">CXF</option>
		        </select>
		     </c:when>
		     <c:otherwise>
		     <select id="Servicio" name="Servicio">
		        <option value="CXF">CXF</option>
		        <option value="REST">REST</option>
		        <option value="AXIS2">AXIS2</option>     
		        </select>

		     </c:otherwise> 
		    </c:choose>
		  </td>
		<td></td> <td></td>	
	</tr>
</table>
</div>

<c3:choose>
	<c3:when test="${detalles.getPermiso() == 'admin'}">
		<input type="button" id="Crear_Con" name="Crear_Con" onclick="jGobierno.Crear_Con()" value=<fmt:message key="CREAR" bundle="${etq}"/> title=<fmt:message key="CREAR" bundle="${etq}"/>  />
	</c3:when>
</c3:choose>





