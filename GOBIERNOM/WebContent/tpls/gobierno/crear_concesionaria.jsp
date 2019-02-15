<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h1 id="titulo2"><fmt:message key="CREAR" bundle="${etq}"/>  </h1>
				
<div id="concesionaria_nueva">
<table >
	<tr>
		<td>ID:</td><td><input type="text" id="id_concesionaria_nueva" name="id_concesionaria_nueva" value=""  size="40"/></td>
		<td><fmt:message key="NOMBRE" bundle="${etq}"/>:</td><td><input type="text" id="nombre_concesionaria_nueva" name="nombre_concesionaria_nueva" value=""  size="25"/></td>
		<td><fmt:message key="Estado" bundle="${etq}"/></td>
		<td>
		        <select id="estado_nueva" name="estado_nueva">
		        <option value="1"><fmt:message key="Habilitada" bundle="${etq}"/></option>
		        <option value="0"><fmt:message key="Deshabilitada" bundle="${etq}"/></option>
		        </select>
		        <br />
		</td>
	</tr>
	<tr>
		<td>DIR:</td><td><input type="text" id="direccion_concesionaria_nueva" name="direccion_concesionaria_nueva" value="" size="40" /></td>
		<td><fmt:message key="Telefono" bundle="${etq}"/></td><td><input type="text" id="telefono_concesionaria_nueva" name="telefono_concesionaria_nueva" value="" size="25"/></td>
		<td> <fmt:message key="Servicio" bundle="${etq}"/></td>
		<td>       
		        <select id="Servicio_nueva" name="Servicio">
		        <option value="AXIS2">AXIS2</option>
		        <option value="CXF">CXF</option>
		        <option value="REST">REST</option>
		        </select>		   
		  </td>
	</tr>
	<tr>
		<td>URL:</td><td><input type="text" id="url_concesionaria_nueva" name="url_concesionaria_nueva" value="" size="70" /></td>
		<td>M1</td><td><input type="text" id="metodo_1_concesionaria_nueva" name="metodo_1_concesionaria_nueva" value="" size="25"/></td>
		<td>M2</td><td><input type="text" id="metodo_2_concesionaria_nueva" name="metodo_2_concesionaria_nueva" value="" size="15"/></td>
	</tr>
	<tr>
				<td colspan="4"><fmt:message key="Email_Concesionaria" bundle="${etq}"/><input type="text" id="email_concesionaria_nueva" name="email_concesionaria_nueva" value="" size="25"/></td>
	</tr>
	<tr>
				<td colspan="4"><input type="button" id="crear_concesionaria_bt" name="crear_concesionaria_bt" onclick="jGobierno.Crear_Concesionaria()"  value=<fmt:message key="CREAR" bundle="${etq}"/>  /></td>
	</tr>
	
</table>
</div>		