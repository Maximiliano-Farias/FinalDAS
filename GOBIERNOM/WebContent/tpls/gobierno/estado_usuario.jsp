<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:choose>
	  <c:when test="${requestScope.respuesta.getRespuesta() == '1'}">
	   <input type="image" id="cruz-img" name="cruz-img"  src="/img/cruz-icon.png" title=<fmt:message key="EN_USO" bundle="${etq}"/>  />   
     </c:when>
     <c:otherwise>
     <input type="image" id="tilde-img" name="tilde-img"  src="/img/tilde-icon.png" title=<fmt:message key="SIN_USO" bundle="${etq}"/>  />
     </c:otherwise>
</c:choose>

