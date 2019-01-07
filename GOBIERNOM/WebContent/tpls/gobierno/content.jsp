<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tld/customs.tld" prefix="ct" %>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.videos.properties.etiquetas" var="etq" scope="session"/>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, user-scalable=no, inital-scale=1.0, maxium-scale=1.0, minimum-scale=1.0">
	<title><fmt:message key="titulo" bundle="${etq}" /></title>
	<link type="text/css" rel="stylesheet" href="/util/StyleSheet.do/load=page,messages,gobierno,nuevo_usuario,estado_cuenta,bootstrap.min,bootstrap-grid.min,menu" />
	<script type="text/javascript" src="/util/Javascript.do/load=jquery,jquery.i18n.properties,utils,gobierno,opciones,pdf,jspdf.min,jspdf.debug,bootstrap"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script type="text/javascript">
	jUtils.changeLang("etiquetas_js", "${lang}");
	</script>
</head>
<body>    
    <div id="img">
	<div id="message"></div>
	<div id="response"></div>
	<div id="main">
		<form id="form" action="javascript:void(null)" method="post" onsubmit="jVideos.buscar()">
			<ct:critbusqvideos onClick1="jGobierno.entrar()" onClick2="jGobierno.salir()" />
			<div id="result">			
			</div>
			<div id="cabecera">
            </div>
             <div id="resultados">

            <input type="image" id="imagen_publicitaria" alt="prueba" src="/img/fiat.jpg"/>
             </div>
            </form> 
	        </div>
	        
	       	
      
     </div>  
     
</body>
</html>