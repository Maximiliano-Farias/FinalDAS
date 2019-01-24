var jSorteo = {
	
		
		   
   Sortear: function (){
        jUtils.executing("resultados");
        jUtils.hiding("message");
        $.ajax({
            url: "/gobierno/SortearAction.do",
            type: "post",
            dataType: "html",
            data: $.param({}),
            error: function(hr){
                jUtils.hiding("result");
                jUtils.showing("resultados", hr.responseText);
            },
            success: function(html) {  	
                jUtils.showing("resultados", html);
		        jUtils.hiding("ver_ganador");
		        jUtils.hiding("ver_error");
		        jUtils.hiding("seleccion_sorteo_nuevo");
		        jSorteo.En_Fecha();
            }
        });	
	 },
	 
	 En_Fecha:function(){
		 jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/EnFechaAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("resultados", hr.responseText);
	            },
	            success: function(html) {  	
	                jUtils.showing("en_fecha", html);	
	               
	            }
	        });	
		 },
	 
	 Verificar_Concesionarias: function (){
	        jUtils.hiding("message");
	        jUtils.hiding("sortear");
	        $.ajax({
	            url: "/gobierno/ConcesionariasActualizadasAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("resultados", hr.responseText);
	            },
	            success: function(html) {  	
	                jUtils.showing("sortear_concesionarias", html);	
	                if(document.getElementById('error_concesionarias').value == "SI")
	                	{
	                	    jUtils.showing("ver_error");
	                		jSorteo.Guardar_Error("error_actualizacion");
	                	}
	                else
	                	{
		                	jSorteo.Incrementar_Barra();
		                	jSorteo.Verificar_Ganador();
	                	
	                	}
	            }
	        });	
		 },
		 
		 Verificar_Ganador: function (){
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/UltimoGanadorAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({}),
		            error: function(hr){
		                jUtils.hiding("result");
		                jUtils.showing("resultados", hr.responseText);
		            },
		            success: function(html) {  	
		                jUtils.showing("sortear_ultimo_ganador", html);	
		                if(document.getElementById('error_ganador').value == "SI")
		                	{
		                	    jUtils.showing("ver_error");
		                	    jSorteo.Guardar_Error("ganador_anterior");
		                	}
		                else
		                	{
			                	jSorteo.Incrementar_Barra();
			                	jSorteo.Verificar_Participantes();
			                				                	
		                	}
		            }
		        });	
			 },
			 
	 Verificar_Participantes: function (){
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/ParticipantesSorteoAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("resultados", hr.responseText);
	            },
	            success: function(html) {  	
	                jUtils.showing("sortear_participantes", html);	
	                if(document.getElementById('error_participantes').value == "SI")
	                	{
	                	    jUtils.showing("ver_error");
	                	    jSorteo.Guardar_Error("participantes");
	                	}
	                else
	                	{
		                	jSorteo.Incrementar_Barra();
		                	jSorteo.Obtener_Ganador();
	                	}
	            }
	        });	
		 },
				 
	 Obtener_Ganador: function (){
	        jUtils.hiding("message");
	        var fecha = document.getElementById('fecha').innerHTML;
	        $.ajax({
	            url: "/gobierno/GanadorSorteoAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"fecha":fecha}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("resultados", hr.responseText);
	            },
	            success: function(html) {  	
	                jUtils.showing("sortear_ganador", html);	
	                if(document.getElementById('error_ganador').value == "SI")
	                	{
	                	    jUtils.showing("ver_error");
	                	    jSorteo.Guardar_Error("ganador");
	                	}
	                else
	                	{
		                	jSorteo.Incrementar_Barra();
		                	jUtils.showing("ver_ganador");
		                	jSorteo.Notificar_Ganador();
	                	}
	            }
	        });	
		 },
		 
		 Notificar_Ganador: function (){
			    var fecha = document.getElementById('fecha_sorteo').value.split(":")[1];								    
			    var ganador = document.getElementById('ganador_sorteo').value.split(":")[1];								    
			    var identificador = document.getElementById('identificador_sorteo').value.split(":")[1];								    
			    var auto =document.getElementById('nombre_auto_sorteo').value.split(":")[1];								   
			    var modelo= document.getElementById('tipo_modelo_sorteo').value.split(":")[1];   
			    var email_ganador= document.getElementById('email_ganador_sorteo').value.split(":")[1];								    								    
			    var concesionaria = document.getElementById('concesionaria_sorteo').value.split(":")[1];   
			    var email_concesionaria =document.getElementById('email_concesionaria_sorteo').value.split(":")[1];								    
			    var direccion_concesionaria = document.getElementById('direccion_concesionaria_sorteo').value.split(":")[1];
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/NotificarGanadorAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"fecha":fecha,"ganador":ganador,"identificcador":identificador,"auto":auto,"modelo":modelo,"email_ganador":email_ganador,"concesionaria":concesionaria,"email_concesionaria":email_concesionaria,"direccion_concesionaria":direccion_concesionaria}),
		            error: function(hr){
		                jUtils.hiding("result");
		                jUtils.showing("resultados", hr.responseText);
		            },
		            success: function(html) {  	
		                jUtils.showing("sortear_notificado", html);	
		      	        jSorteo.Guardar_Ganador();
		                if(document.getElementById('error_notificacion').value == "SI")
		                	{
		                	    jUtils.showing("ver_error");
		                	    jSorteo.Guardar_Error("notificacion_error");
		                	}
		                else
		                	{
			                	jSorteo.Incrementar_Barra();
			                	jSorteo.Guardar_Notificacion();
			                }
			            }
			        });	
				 },		
					 
	 Guardar_Error: function (tipo){
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/GuardarErrorAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"error":tipo}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("resultados", hr.responseText);
	            },
	            success: function(html) {  	
	                jUtils.showing("informe_resultado", html);	
	                if(document.getElementById('error_guardado').value == "SI")
	                	{
	                	    jUtils.showing("ver_error");
	                		alert("ERROR");
	                	}

	            }
	        });	
		 },
		 
		 Guardar_Ganador:function(){
			 jUtils.hiding("message");
			 var identificador = document.getElementById('identificador_sorteo').value.split(":")[1];
		        $.ajax({
		            url: "/gobierno/GuardarGanadorAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"ganador":identificador}),
		            error: function(hr){
		                jUtils.hiding("result");
		                jUtils.showing("resultados", hr.responseText);
		            },
		            success: function(html) {  	
		                jUtils.showing("informe_resultado", html);	
		                if(document.getElementById('error_guardado_ganador').value == "SI")
		                	{
		                	    jUtils.showing("ver_error");
		                		alert("ERROR");
		                	}

		            }
		        });	
			 },
			 
			 Guardar_Notificacion:function(){
				 jUtils.hiding("message");
				 var identificador = document.getElementById('identificador_sorteo').value.split(":")[1];
			        $.ajax({
			            url: "/gobierno/GuardarNotificacionAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param({"ganador":identificador}),
			            error: function(hr){
			                jUtils.hiding("result");
			                jUtils.showing("resultados", hr.responseText);
			            },
			            success: function(html) {  	
			                jUtils.showing("informe_resultado", html);	
			                if(document.getElementById('error_guardado_notificacion').value == "SI")
			                	{
			                	    jUtils.showing("ver_error");
			                		alert("ERROR");
			                	}

			            }
			        });	
				 },
 
	 Incrementar_Barra:function(){
		 var barra=document.getElementById('progreso_sorteo');
		 barra.value+=20;
	 },		   
		   
};

