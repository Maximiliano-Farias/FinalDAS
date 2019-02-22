<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c2"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div id="sorteos_detalles_nuevos">
<fmt:setLocale value="${lang}" />

	    <c:if test="${detalles.getPermiso() == 'admin' && detalles.getDescripcion() != 'SS'}">
	    	<h1 id="titulo1"><fmt:message key="ACTUALIZAR" bundle="${etq}"/>  </h1>
	    	<table >
			<tr>
				<td>NRO: </td><td> <LABEL id="id_sorteo_nuevo" >${detalles.getNro_sorteo()} </LABEL> </td>
				<c:if test="${detalles.getEstado() == 'P' || detalles.getEstado() == 'A' }">
		    	<td><fmt:message key="Fecha" bundle="${etq}"/></td><td><input type="text" id="fecha_sorteo_nuevo" name="fecha_sorteo_nuevo" value="${detalles.getFecha()}"  size="25"maxlength="10" /></td>		    
			    </c:if>
			    <c:if test="${detalles.getEstado() == 'E' }">
		    	<td colspan='6'><fmt:message key="ORIGINAL" bundle="${etq}"/><label id="fecha_sorteo_original"><fmt:formatDate value="${detalles.getFecha_original()}" dateStyle="full" /> </label><td>	   
			    </c:if>
			    
			   <td rowspan='3'><input type="image" id="guardar_sorteo" name="guardar_sorteo" onclick="jGobierno.Guardar_Sorteo()" src="/img/guardar.jpg" title=<fmt:message key="Guardar" bundle="${etq}"/>  /></td>
			</tr>
			<tr>
			<td><fmt:message key="Estado" bundle="${etq}"/></td>
				    <td>
				   
				    <c:if test="${detalles.getEstado() == 'P' || detalles.getEstado() == 'E' }">
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        </select>
				    </c:if>    
				    <c:if test="${detalles.getEstado() == 'A'}">
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        </select>
				    </c:if>
				    </td>
				    <td><fmt:message key="Descripcion" bundle="${etq}"/></td><td><input type="text" id="descripcion_sorteo_nuevo" name="descripcion_sorteo_nuevo" value="${detalles.getDescripcion()}" size="25"  /></td>
                    <td></td>
                    <c:if test="${detalles.getEstado() == 'P' || detalles.getEstado() == 'A' }">
                    <tr><td colspan='6'><fmt:message key="ORIGINAL" bundle="${etq}"/><label id="fecha_sorteo_original" ><fmt:formatDate value="${detalles.getFecha_original()}" dateStyle="full" /> </label><td>	</tr>
                    </c:if>
                </table>
                
                <input type="button" id="Crear_Sor" name="Crear_Sor" onclick="jGobierno.Crear_Sor()" value=<fmt:message key="CREAR" bundle="${etq}"/> title=<fmt:message key="CREAR" bundle="${etq}"/>  />           
                <br/><br/><br/>
                <input type="button" id="Sortear" name="Sortear" onclick="jSorteo.Sortear()" value=<fmt:message key="SORTEAR" bundle="${etq}"/> title=<fmt:message key="SORTEAR" bundle="${etq}"/>  />
      
        
        </c:if>
        <c:if test="${detalles.getPermiso() == 'admin' && detalles.getDescripcion() == 'SS'}">
        
        <input type="button" id="Crear_Sor" name="Crear_Sor" onclick="jGobierno.Crear_Sor()" value=<fmt:message key="CREAR" bundle="${etq}"/> title=<fmt:message key="CREAR" bundle="${etq}"/>  />
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <input type="button" id="Sortear" name="Sortear" onclick="jSorteo.Sortear()" value=<fmt:message key="SORTEAR" bundle="${etq}"/> title=<fmt:message key="SORTEAR" bundle="${etq}"/>  />
        
        </c:if>
          <c:if test="${detalles.getPermiso() != 'admin' && detalles.getDescripcion() != 'SS'}">
               <h1 id="titulo1"><fmt:message key="ACTUALIZAR" bundle="${etq}"/>  </h1>
               <table >
				<tr>
					<td>NRO:</td><td><input type="text" id="id_sorteo_nuevo" name="id_sorteo_nuevo" value="${detalles.getNro_sorteo()}" readonly="readonly" size="2"/></td>
					<td>
				    <td><fmt:message key="Fecha" bundle="${etq}"/><input type="text" id="fecha_sorteo_nuevo" name="fecha_sorteo_nuevo" value="${detalles.getFecha()}"  size="25"maxlength="10" readonly="readonly"/></td>
					<td>
					<c:if test="${detalles.getEstado() == 'P'}">
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        </select>
				    </c:if>    
				    <c:if test="${detalles.getEstado() == 'A'}">
				        <select id="Estado_sorteo_nuevo" name="Estado_sorteo_nuevo">
				        <option value="A"><fmt:message key="ANULADO" bundle="${etq}"/></option>
				        <option value="P"><fmt:message key="PENDIENTE" bundle="${etq}"/></option>
				        </select>
				    </c:if>
					</td>
					<td><input type="text" id="descripcion_sorteo_nuevo" name="descripcion_sorteo_nuevo" value="${detalles.getDescripcion()}" size="40" readonly="readonly" /></td>
				</tr>
				</table>
		</c:if>
		    
</div>





