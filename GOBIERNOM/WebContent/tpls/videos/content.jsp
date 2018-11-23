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
	<title><fmt:message key="titulo" bundle="${etq}" /></title>
	<link type="text/css" rel="stylesheet" href="/util/StyleSheet.do/load=page,messages,videos" />
	<script type="text/javascript" src="/util/Javascript.do/load=jquery,jquery.i18n.properties,utils,gobierno,videos"></script>
	<script type="text/javascript">
	jUtils.changeLang("etiquetas_js", "${lang}");
	</script>
</head>
<body>    
	<div id="message"></div>
	<div id="response"></div>
	<div id="main">
		<form id="form" action="javascript:void(null)" method="post" onsubmit="jVideos.buscar()">
			<ct:critbusqvideos onClick1="jGobierno.entrar()" onClick2="jGobierno.salir()" />
			<div id="result">			
			</div>
		</form>
	</div>
	<div id="prueba">
            <img id="imagen" src="img/auto.jpg" alt="PLAN NACIONAL 0KM" >		
            </div>	
</body>
</html>