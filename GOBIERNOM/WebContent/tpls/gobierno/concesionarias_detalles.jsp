<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h1 id="titulo1"><fmt:message key="ACTUALIZAR" bundle="${etq}"/>  </h1>


<div id="concesionarias_detalles">

<table >
<tr>
<td>ID:</td><td><input type="text" id="id_concesionaria" name="id_concesionaria" value="${detalles.getId_concesionaria()}" readonly="readonly" size="12"/></td>
<td><input type="text" id="nombre_concesionaria" name="nombre_concesionaria" value="${detalles.getNombre()}"  size="25"/></td>
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
<td><input type="text" id="direccion_concesionaria" name="direccion_concesionaria" value="${detalles.getDireccion()}" size="40" /></td>
<td><fmt:message key="Telefono" bundle="${etq}"/></td><td><input type="text" id="telefono_concesionaria" name="telefono_concesionaria" value="${detalles.getTelefono()}" size="15"/></td>
<td><fmt:message key="Ultima_Actualizacion" bundle="${etq}"/></td><td><input type="text" id="fecha_concesionaria" name="fecha_concesionaria" value="${detalles.getFecha_actualizacion()}" readonly="readonly" size="25"/></td>
<td><input type="image" id="guardar_concesionaria" name="guardar_concesionaria" onclick="jGobierno.Guardar_Concesionaria()" src="/img/guardar.jpg" title=<fmt:message key="Guardar" bundle="${etq}"/>  /></td>
</tr>
</table>
</div>

<h1 id="titulo2"><fmt:message key="CREAR" bundle="${etq}"/>  </h1>

<div id="concesionaria_nueva">

<table >
<tr>
<td><fmt:message key="NOMBRE" bundle="${etq}"/><input type="text" id="nombre_concesionaria_nueva" name="nombre_concesionaria_nueva" value=""  size="25"/></td>
<td>
        <select id="Habilitado_nueva" name="Habilitado_nueva">
        <option value="1"><fmt:message key="Habilitada" bundle="${etq}"/></option>
        <option value="0"><fmt:message key="Deshabilitada" bundle="${etq}"/></option>
        </select>
        <br />

</td>
<td>DIR : <input type="text" id="direccion_concesionaria_nueva" name="direccion_concesionaria_nueva" value="" size="40" /></td>
<td><fmt:message key="Telefono" bundle="${etq}"/></td><td><input type="text" id="telefono_concesionaria_nueva" name="telefono_concesionaria_nueva" value="" size="15"/></td>
<td><input type="button" id="crear_concesionaria_nueva" name="crear_concesionaria_nueva" onclick="jGobierno.Crear_Concesionaria()" value="CREAR" title=<fmt:message key="CREAR" bundle="${etq}"/>  /></td>
</tr>
</table>
</div>





