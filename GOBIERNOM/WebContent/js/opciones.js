var jOpciones = {
		
		Estadisticas: function() {
            $.ajax({
	            url: "/gobierno/EstadisticasAction.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("cabecera", '');
	            	jUtils.showing("resultados", html);
	            	  
	            }
	        });	
			
		},

	   SorteoAnterior: function() {
        jUtils.executing("cabecera");
        jUtils.hiding("message");
        $.ajax({
            url: "/gobierno/SorteosCabeceraAction.do",
            type: "post",
            dataType: "html",
            error: function(hr){
                jUtils.hiding("result");
                jUtils.showing("message", hr.responseText);
            },
            success: function(html) {
            	jUtils.showing("resultados", '');
                jUtils.showing("cabecera", html);
                var id_sorteo = $("select[name=Sorteo_Elegido]").val();
                var id=(id_sorteo).toString();
                if(!(id === 'SS'))
                { 
                jGobierno.Elegido();
                }
                
            }
        });		
	   },
	   
	   Concesionarias: function() {
	        jUtils.executing("cabecera");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/ConcesionariasCabeceraAction.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("resultados", '');
	                jUtils.showing("cabecera", html);
	                jGobierno.Elegida();
	            }
	        });		
		},
		
		
		 Sorteos_Pendientes: function() {
		        jUtils.executing("cabecera");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/SorteosPendientesCabeceraAction.do",
		            type: "post",
		            dataType: "html",
		            error: function(hr){
		                jUtils.hiding("result");
		                jUtils.showing("message", hr.responseText);
		            },
		            success: function(html) {
		            	jUtils.showing("resultados", '');
		                jUtils.showing("cabecera", html);
		                jGobierno.Sorteo_Pendiente_Elegido();
		                
		            }
		        });		
			},
			
			 DatosPersonales: function() {
			        jUtils.executing("cabecera");
			        jUtils.hiding("message");
			        var Id_plan = $('#Id_plan').val();
			        $.ajax({
			            url: "/gobierno/UsuarioDetallesAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param({"Id_plan":Id_plan}),  
			            error: function(hr){
			                jUtils.hiding("result");
			                jUtils.showing("message", hr.responseText);
			            },
			            success: function(html) {
			            	jUtils.showing("resultados", '');
			                jUtils.showing("cabecera", html);
			                
			            }
			        });		
				},
				
				
				EstadoCuenta: function() {
			    	  var Id_plan = $('#Id_plan').val();
			    	  var permiso = $('#perfil').val();
			    	            jUtils.executing("resultados");
						        jUtils.hiding("message");
						        $.ajax({
						            url: "/gobierno/EstadoCuentaAction.do",
						            type: "post",
						            dataType: "html",
						            data: $.param({"Id_plan":Id_plan,"permiso":permiso}), 
						            error: function(hr){
						                jUtils.hiding("result");
						                jUtils.showing("message", hr.responseText);
						            },
						            success: function(html) {  	
						                jUtils.showing("resultados", html);
						                
						            }
						        });		
							},
							
							
					 Sucursales: function() {
					        jUtils.executing("resultados");
					        jUtils.hiding("message");
					        $.ajax({
					            url: "/gobierno/ConcesionariasHabilitadasAction.do",
					            type: "post",
					            dataType: "html", 
					            error: function(hr){
					                jUtils.hiding("result");
					                jUtils.showing("message", hr.responseText);
					            },
					            success: function(html) {  	
					                jUtils.showing("resultados", html);
					                
					            }
					        });		
						   }
				
};