<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div id="div_volver">
<input type="button" id="volver" name="volver" Onclick="jGobierno.Opciones()" value ="<fmt:message key="Volver" bundle="${etq}" />" /> 
</div>

<div id="Datos_Usuario">

<table >
<tr>
<td colspan=4><var id="TITULO_DATOS"><fmt:message key="DATOS_PERSONALES" bundle="${etq}"/></var></td>
</tr>
<tr>
<td><fmt:message key="NOMBRE" bundle="${etq}"/>:</td><td><input type="text" id="Nombre_Usuario" name="Nombre_Usuario" value="${detalles.getNombre()}" size="30" readonly="readonly" /></td>
<td><fmt:message key="APELLIDO" bundle="${etq}"/>:</td><td><input type="text" id="Apellido_Usuario" name="Apellido_Usuario" value="${detalles.getApellido()}" readonly="readonly" size="30" /></td>
</tr>

<tr>
<td>D.N.I :</td><td> <input type="text" id="Dni_Usuario" name="Dni_Usuario" value="${detalles.getDni()}"  readonly="readonly" size="30" readonly="readonly" /></td>
<td><fmt:message key="Telefono" bundle="${etq}"/></td><td><input type="text" id="Telefono_Usuario" name="Telefono_Usuario" value="${detalles.getTelefono()}"  size="30"/></td>
</tr>
<tr>
<td>MAIL:</td><td><input type="text" id="Mail_Usuario" name="Mail_Usuario" value="${detalles.getMail()}" size="30"/></td>
<td><fmt:message key="DIRECCION" bundle="${etq}"/></td><td><input type="text" id="Direccion_Usuario" name="Direccion_Usuario" value="${detalles.getDireccion()}"  size="30"/></td>
</tr>
<tr >
<td colspan=4><input type="button" id="Actualizar_Datos_Usuario" name="Actualizar_Datos_Usuario" onclick="jGobierno.ActualizarDatosPersonales()" value=<fmt:message key="ACTUALIZAR" bundle="${etq}"/>  title=<fmt:message key="ACTUALIZAR" bundle="${etq}"/>  /></td>
</tr>
</table>
</div>






