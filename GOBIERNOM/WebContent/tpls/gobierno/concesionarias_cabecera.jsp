<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id=elegir_concesionaria>
<table>
  <tr>
  <td>
   		
		<div id="div_volver">
		<input type="button" id="volver" name="volver" Onclick="jGobierno.Opciones()" value ="<fmt:message key="Volver" bundle="${etq}" />" /> 
		</div>
   		
  </td> 
  <td>
        <div id="seleccion">
		<var><fmt:message key="Consesionaria" bundle="${etq}"/></var>

		<select name="Concesionaria_Elegida" id="Concesionaria_Elegida" onChange="jGobierno.Elegida()">
        <c:forEach var="concesionaria" items="${listado.getConcesionarias()}">
         <option value="${concesionaria.getId_concesionarias()}">${concesionaria.getDescripcion()} </option>
         </c:forEach>
		</select>
        </div>
  </td>
  
  </tr>

</table>



</div>


