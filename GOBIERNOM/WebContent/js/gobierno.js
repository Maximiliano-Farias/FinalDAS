var jGobierno = {
	
		salir: function() {
			document.cookie ="perfil=; path=/";	
			document.cookie ="dni=; path=/";
			jUtils.showing("entrar");
        	jUtils.showing("imagen");
        	jUtils.showing("us");
        	jUtils.showing("con");
        	jUtils.showing("usuario");
        	jUtils.showing("contrasena");
        	jUtils.hiding("salir");
        	jUtils.hiding("Logueado");
        	jUtils.showing("entrar");
        	location.href="http://localhost:8080/"
		},
		

		entrar: function() {
	        jUtils.executing("result");
	        jUtils.hiding("message");
	        document.cookie ="perfil=; path=/";
	        document.cookie ="dni=; path=/";
            $.ajax({
	            url: "/gobierno/Buscar.do",
	            type: "post",
	            dataType: "html",
	            data: $.param($("input[name=usuario],input[name=contrasena]", $("#form"))),
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("Logueado", html);
	            	jUtils.hiding("result");
	            	if(document.getElementById('texto_usuario').value  == undefined)
	                {  document.getElementById('us').style.Color = '#ff0000';
	                   document.getElementById('con').style.Color = '#ff0000';
	            		jUtils.showing("cabecera", '');
	                	document.getElementById('usuario').focus()
	                }
	                else {
	                	jUtils.hiding("message");
		            	jUtils.hiding("entrar");
		            	jUtils.hiding("Verificar");
		            	jUtils.hiding("imagen");
		            	jUtils.hiding("us");
		            	jUtils.hiding("con");
		            	jUtils.hiding("usuario");
		            	jUtils.hiding("contrasena");
		            	jUtils.hiding("result");
		            	jUtils.showing("salir");
		            	document.cookie ="perfil="+ document.getElementById('perfil').value+";path=/";
		            	document.cookie ="dni="+ document.getElementById('dni').value+";path=/";
		            	jGobierno.Opciones();
	            	
	                }
	            	
	            	
	            }
	        });		
		},
		
		Opciones: function() {
            $.ajax({
	            url: "/gobierno/OpcionesAction.do",
	            type: "post",
	            dataType: "html",
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	var x = document.cookie.split("perfil=")[1];
	            	jUtils.showing("cabecera", '');
	            	jUtils.showing("resultados", html);
	                if (x =="admin")
	                	{
	                	
	                	document.getElementById('DatosPersonales').style.display = 'none';
	                	}
	            }
	        });		
		},
		
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
                jGobierno.Elegido();
            }
        });		
	},
	

	Elegido: function() {
        jUtils.executing("resultados");
        jUtils.hiding("message");
        $.ajax({
            url: "/gobierno/SorteosDetallesAction.do",
            type: "post",
            dataType: "html",
            data: $.param($("select[name=Sorteo_Elegido]", $("#form"))),
            error: function(hr){
            	alert("error");
                jUtils.hiding("result");
                jUtils.showing("message", hr.responseText);
            },
            success: function(html) {
            	jUtils.showing("resultados", html);
            	var x = $("#error_detalles").text().split(":")[1];
            	if( x == '-')
            		{
            		document.getElementById('error_detalles').style.backgroundColor = '#80ff00';
            		}
            	else
            		{
            		document.getElementById('error_detalles').style.backgroundColor = '#ff0000';            		
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
		
		
		Elegida: function() {
	        jUtils.executing("resultados");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/ConcesionariasDetallesAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param($("select[name=Concesionaria_Elegida]", $("#form"))),
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("resultados", html);
	            	var x = document.cookie.split("perfil=")[1];
	            	var y = x.split(";")[0];
	            	if (y == 'admin')
	                {
	            		document.getElementById("Habilitado").disabled = true;
	            		document.getElementById("direccion_concesionaria").disabled = true;
	            		document.getElementById("nombre_concesionaria").disabled = true;
	            		document.getElementById("telefono_concesionaria").disabled = true;
	            		document.getElementById("nombre_concesionaria").disabled = true;
	            		document.getElementById("guardar_concesionaria").style.visibility="hidden";
	            		document.getElementById("titulo2").style.visibility="hidden";
	            		document.getElementById("concesionaria_nueva").style.visibility="hidden";
	            		
	                }
	 
	            }
	        });		
		},
		
		Guardar_Concesionaria: function() {
	        jUtils.executing("message");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/GuardarConcesionariaAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param($("input[name=id_concesionaria],input[name=nombre_concesionaria],select[name=Habilitado],input[name=direccion_concesionaria],input[name=telefono_concesionaria]", $("#form"))),
	            error: function(hr){
	            	alert("ACTUALIZADA CORRECTAMENTE");
	            },
	            success: function(html) {
	            	jUtils.showing("cabecera", '');
	            	jUtils.showing("resultados", '');
	                jUtils.showing("cabecera", html);    
	            }
	            
	        });
		},
		
		
		Crear_Concesionaria: function() {
	        jUtils.executing("message");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/CrearConcesionariaAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param($("input[name=nombre_concesionaria_nueva],select[name=Habilitado_nueva],input[name=direccion_concesionaria_nueva],input[name=telefono_concesionaria_nueva]", $("#form"))),
	            error: function(hr){
	            	alert("OK");
	            	jGobierno.Concesionarias();
	            },
	            success: function(html) {
	            	jUtils.showing("cabecera", '');
	            	jUtils.showing("resultados", '');
	                jUtils.showing("cabecera", html); 
	                jGobierno.Concesionarias();
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
			
			
			Sorteo_Pendiente_Elegido: function() {
		        jUtils.executing("resultados");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/SorteosPendientesDetallesAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param($("select[name=Sorteo_Pendiente_Elegido]", $("#form"))),
		            error: function(hr){
		            	alert("error");
		                jUtils.hiding("result");
		                jUtils.showing("message", hr.responseText);
		                
		            },
		            success: function(html) {
		            	jUtils.showing("resultados", html);
		            	var x = document.cookie.split("perfil=")[1];
		            	var y = x.split(";")[0];
		            	if (y == 'admin')
		                {
		            		document.getElementById("Sortear").style.visibility="hidden";
		            		document.getElementById("fecha_sorteo_nuevo").disabled = true;
		            		document.getElementById("Estado_sorteo_nuevo").disabled = true;
		            		document.getElementById("descripcion_sorteo_nuevo").disabled = true;
		            		document.getElementById("guardar_sorteo").style.visibility="hidden";
		            		document.getElementById("titulo2").style.visibility="hidden";
		            		document.getElementById("sorteos_nuevo").style.visibility="hidden";
		            		
		            		
		 
		                  }
		            }
		        });		
			},
			
			
			Guardar_Sorteo: function() {
		        jUtils.executing("message");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/GuardarSorteoAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param($("input[name=fecha_sorteo_nuevo],input[name=id_sorteo_nuevo],select[name=Estado_sorteo_nuevo],input[name=descripcion_sorteo_nuevo]", $("#form"))),
		            error: function(hr){
		            	alert("OK");
		            	jGobierno. Sorteos_Pendientes();
		            },
		            success: function(html) {
		            	alert("PASA");
		            	jUtils.showing("cabecera", '');
		            	jUtils.showing("resultados", '');
		                jUtils.showing("cabecera", html);    
		            }
		            
		        });
			},
			
			Crear_Sorteo: function() {
		        jUtils.executing("message");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/CrearSorteoAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param($("input[name=fecha_sorteo_crear],select[name=Estado_sorteo_crear],input[name=descripcion_sorteo_crear]", $("#form"))),
		            error: function(hr){
		            	var x1 = $("#fecha_sorteo_crear").val().split("-")[1];
		            	var x2 = $("#fecha_sorteo_crear").val().split("-")[2];
		            	if(x1>12 || x2>31)
		            		{
		            		alert("ERROR");
		            		}
		            	else{
		            	jGobierno.Sorteos_Pendientes();  
		            	    }
		            },
		            success: function(html) {	  	
		            	alert("OK");
		            	jGobierno.Sorteos_Pendientes();   
		            }
		            
		        });
			},
			
			
			   DatosPersonales: function() {
			        jUtils.executing("cabecera");
			        jUtils.hiding("message");
			        $.ajax({
			            url: "/gobierno/UsuarioDetallesAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param($("input[name=Id_plan]", $("#form"))),  
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
				
				

			ActualizarDatosPersonales: function() {
					  
				        $.ajax({
				            url: "/gobierno/ActualizarUsuarioAction.do",
				            type: "post",
				            dataType: "html",
				            data: $.param($("input[name=Id_plan], input[name=Direccion_Usuario],input[name=Mail_Usuario],input[name=Telefono_Usuario]", $("#form"))),
				            error: function(hr){
				            	jGobierno.DatosPersonales();
				            	
				            },
				            success: function(html) {
				            	ALERT("ERROR");
				                
				            }
				        });		
					},
		    
					
		      EstadoCuenta: function() {
					        jUtils.executing("resultados");
					        jUtils.hiding("message");
					        $.ajax({
					            url: "/gobierno/EstadoCuentaAction.do",
					            type: "post",
					            dataType: "html",
					            data: $.param($("input[name=Id_plan]", $("#form"))),  
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
				},
							
			
	
	
	volver: function() {
		jUtils.hiding("response");
        jUtils.showing("main");
	}
		
};