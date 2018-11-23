<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div id="div_vuelta">
<a href="/gobierno/Content.do" ><fmt:message key="VUELTA" bundle="${etq}"/> </a>
</div>

<div id="conces_habi">


<var id='con_hab'><fmt:message key="consesionaria" bundle="${etq}"/></var>

<div id= 'concesionaria_habilitadas'>
<table id='tabla_conce'>
<thead> 
<tr>     
<td><fmt:message key="NOMBRE" bundle="${etq}"/></td><td><fmt:message key="DIRECCION" bundle="${etq}"/> </td><td><fmt:message key="Telefono" bundle="${etq}"/> </td>
</tr>
</thead>
<tbody>     
        <c:forEach var="concesionaria" items="${Concesionarias.getConcesionarias()}">
        <tr><td>${concesionaria.getNombre()}</td><td>${concesionaria.getDireccion()}</td><td>${concesionaria.getTelefono()}</td></tr>
       </c:forEach>
</tbody>          
</table>
</div>



</div>
