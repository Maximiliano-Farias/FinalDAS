<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1 id="titulo1"><fmt:message key="ACTUALIZAR" bundle="${etq}"/>  </h1>
<div id="sorteos_detalles_nuevos">
	<c:choose>
	    <c:when test="${detalles.getPermiso() == 'admin'}">
	    	<table >
			<tr>
				<td>NRO: <input type="text" id="id_sorteo_nuevo" name="id_sorteo_nuevo" value="${detalles.getNro_sorteo()}" readonly="readonly" size="2"/></td>
		    	<td><fmt:message key="Fecha" bundle="${etq}"/><input type="text" id="fecha_sorteo_nuevo" name="fecha_sorteo_nuevo" value="${detalles.getFecha()}"  size="25"maxlength="10" readonly="readonly"/></td>
				    <td>
				    <c2:choose>
				    <c2:when test="${detalles.getEstado() == 'P'}">
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        </select>
				    </c2:when>    
				    <c2:otherwise>
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        </select>
				    </c2:otherwise>
				    </c2:choose>
				    </td>
				    <td><input type="text" id="descripcion_sorteo_nuevo" name="descripcion_sorteo_nuevo" value="${detalles.getDescripcion()}" size="40"  /></td>
		            <td><input type="image" id="guardar_sorteo" name="guardar_sorteo" onclick="jGobierno.Guardar_Sorteo()" src="/img/guardar.jpg" title=<fmt:message key="Guardar" bundle="${etq}"/>  /></td>
              </tr>
                </table>
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
				<input type="button" id="Sortear" name="Sortear" onclick="jGobierno.Sortear()" value=<fmt:message key="SORTEAR" bundle="${etq}"/> title=<fmt:message key="SORTEAR" bundle="${etq}"/>  />
        </c:when>
           <c:otherwise>
                   <table >
				<tr>
					<td>NRO:</td><td><input type="text" id="id_sorteo_nuevo" name="id_sorteo_nuevo" value="${detalles.getNro_sorteo()}" readonly="readonly" size="2"/></td>
					<td>
				    <td><fmt:message key="Fecha" bundle="${etq}"/><input type="text" id="fecha_sorteo_nuevo" name="fecha_sorteo_nuevo" value="${detalles.getFecha()}"  size="25"maxlength="10" readonly="readonly"/></td>
					<td>
					<c3:choose>
						<c3:when test="${detalles.getEstado() == 'P'}">
							<input type="text" id="estado_sorteo" name="estado_sorteo" value="<fmt:message key="PENDIENTE" bundle="${etq}"/>" size="20" readonly="readonly" />
						</c3:when>
						<c3:otherwise>
							<input type="text" id="estado_sorteo" name="estado_sorteo" value="<fmt:message key="ANULADO" bundle="${etq}"/>" size="20" readonly="readonly" />
						</c3:otherwise>
					</c3:choose>
					</td>
					<td><input type="text" id="descripcion_sorteo_nuevo" name="descripcion_sorteo_nuevo" value="${detalles.getDescripcion()}" size="40" readonly="readonly" /></td>
				</tr>
				</table>
		</c:otherwise>
	</c:choose>		    
</div>





