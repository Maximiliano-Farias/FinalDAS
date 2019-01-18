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
        	location.href="http://localhost:8080/";
		},
		

		entrar: function() {
	        jUtils.executing("result");
	        jUtils.showing("contrasena");
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
	            	jUtils.showing("result", html);
	            	if ( $("#nuevo_igreso_titulo").length > 0 ) 
	                { jUtils.hiding("resultados");
	                jUtils.hiding("cabecera");
	                }
	            	if(document.getElementById('texto_usuario').value  == '')
	                {  
	            	   document.getElementById('us').style.Color = '#ff0000';
	                   document.getElementById('con').style.Color = '#ff0000';
	            		jUtils.showing("cabecera", '');
	                	document.getElementById('usuario').focus();
	                }
	                else {
		            	
	                	jUtils.hiding("message");
		            	jUtils.hiding("entrar-img");
		            	jUtils.hiding("Verificar");
		            	jUtils.hiding("imagen");
		            	jUtils.hiding("us");
		            	jUtils.hiding("con");
		            	jUtils.hiding("usuario");
		            	jUtils.hiding("contrasena");
		            	jUtils.hiding("result");
		            	jUtils.hiding("soy_nuevo");
		            	jUtils.showing("Logueado", html);
		            	jUtils.showing("salir");
		            	document.cookie ="perfil="+ document.getElementById('perfil').value+";path=/";
		            	document.cookie ="dni="+ document.getElementById('dni').value+";path=/";
		            	jGobierno.Opciones();
	            	
	                }
	            	
	            	
	            }
	        });		
		},
	
		Buscando: function(){
		        var texto = $('#buscador_plan').val();
				 jUtils.executing("buscando");
	            $.ajax({
	            url: "/gobierno/BuscarEstadoAction.do",
	            type: "post",
	            dataType: "html", 
	            data: $.param({"texto":texto}),
	            error: function(hr){
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {  	
	            	jUtils.hiding("buscando");
	                jUtils.showing("resultado_busqueda", html);  
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
	
	
		
		Elegida: function() {
	        var elegida = $("select[name=Concesionaria_Elegida]").val();
	        var permiso = $('#perfil').val();
	        jUtils.executing("resultados");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/ConcesionariasDetallesAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"elegida":elegida,"permiso":permiso}),
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	jUtils.showing("resultados", html);
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
	            	jGobierno.Elegida();
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
	            data: $.param($("input[name=nombre_concesionaria_nueva],input[name=id_concesionaria_nueva],select[name=Habilitado_nueva],input[name=direccion_concesionaria_nueva],input[name=telefono_concesionaria_nueva]", $("#form"))),
	            error: function(hr){
	            	alert("OK");
	            	jOpciones.Concesionarias();
	            },
	            success: function(html) {
	            	jUtils.showing("cabecera", '');
	            	jUtils.showing("resultados", '');
	                jUtils.showing("cabecera", html); 
	                jGobierno.Concesionarias();
	            }
	            
	        });
		},
		
			Sorteo_Pendiente_Elegido: function() {
		        jUtils.executing("resultados");
		        var id_sorteo = $("select[name=Sorteo_Pendiente_Elegido]").val();
		        var permiso = $('#perfil').val();
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/SorteosPendientesDetallesAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"Sorteo_Pendiente_Elegido":id_sorteo,"permiso":permiso}),
		            error: function(hr){
		            	alert("error");
		                jUtils.hiding("result");
		                jUtils.showing("message", hr.responseText);
		                
		            },
		            success: function(html) {
		            	jUtils.showing("resultados", html);
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
		            	alert("OK!");
		            	jOpciones.Sorteos_Pendientes();
		            },
		            success: function(html) {
		            	alert("ERROR");
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
		            	jOpciones.Sorteos_Pendientes();  
		            	    }
		            },
		            success: function(html) {	  	
		            	alert("OK");
		            	jGobierno.Sorteos_Pendientes();   
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
				            	jOpciones.DatosPersonales();	
				            },
				            success: function(html) {
				            	ALERT("ERROR");  
				            }
				        });		
					},
			
			CrearUsuario: function(){
		        jUtils.executing("resultados");
		        jUtils.hiding("message");
				var nuevo_usuario = $('#nuevo_usuario').val();
				var usuario = $('#usuario').val();
		        var nueva_contrasena_1 = $('#nueva_contrasena_1').val();
		        var nueva_contrasena_2 = $('#nueva_contrasena_2').val();
		        var iguales = 0;
		        if ($("#nueva_contrasena_2").val()== $("#nueva_contrasena_1").val() &&$("#nueva_contrasena_2").val()!="" )
		        	{
		        	iguales=1;
		        	}
		        $.ajax({
		            url: "/gobierno/CrearUsuarioAction.do",
		            type: "post",
		            dataType: "html", 
		            data: $.param({"nuevo_usuario":nuevo_usuario,"usuario":usuario,"nueva_contrasena_1":nueva_contrasena_1,"nueva_contrasena_2":nueva_contrasena_2,"iguales":iguales}),
		            error: function(hr){
		                jUtils.hiding("result");
		                jUtils.showing("message", hr.responseText);
		            },
		            success: function(html) {  	
		            	jUtils.hiding("resultados");
		                jUtils.showing("resultado_creacion", html);
		                if(iguales == 1){
		                setTimeout("jGobierno.salir()",2000);
		                }
		            }
		        });					
			  },
			
			Busca_Plan: function(plan){
    	            jUtils.executing("plan_buscado");
			        jUtils.hiding("message");
			        $.ajax({
			            url: "/gobierno/EstadoCuentaAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param({"Id_plan":plan,"permiso":"consulta"}), 
			            error: function(hr){
			                jUtils.hiding("result");
			                jUtils.showing("message", hr.responseText);
			            },
			            success: function(html) {  	
			                jUtils.showing("plan_buscado", html);
			                jUtils.hiding("volver");
			            }
			        });		
				},
			
			volver: function() {
				jUtils.hiding("response");
		        jUtils.showing("main");
			},
			
			    
			 Validar: function (){
	 	            jUtils.executing("estado_usuario");
	 	            var usuario = $('#nuevo_usuario').val();
			        jUtils.hiding("message");
			        $.ajax({
			            url: "/gobierno/EstadoUsuarioAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param({"usuario":usuario}),
			            error: function(hr){
			                jUtils.hiding("result");
			                jUtils.showing("message", hr.responseText);
			            },
			            success: function(html) {  	
			                jUtils.showing("estado_usuario", html);
			                if (document.getElementById('cruz-img')==null)
			                {
			                	document.getElementById('crear_usuario').style.display='inline';
			                }
			                else{
			                	document.getElementById('crear_usuario').style.display='none';
			                }
			            }
			        });	
				 },
				 
				 
		   soyNuevo:function(){
    	            jUtils.executing("resultados");
			        jUtils.hiding("message");
			        $.ajax({
			            url: "/gobierno/SoyNuevoAction.do",
			            type: "post",
			            dataType: "html",
			            data: $.param({}), 
			            error: function(hr){
			                jUtils.hiding("result");
			                jUtils.showing("message", hr.responseText);
			            },
			            success: function(html) {  	
			                jUtils.showing("resultados", html);
			                
			            }
			        });						
		   },
		   
		   Sortear: function (){
			   alert("pasa a sortear");
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
		            }
		        });	
			 },
			 
			 Verificar_Concesionarias: function (){
			        jUtils.hiding("message");
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
			                		alert("ERROR");
			                	}
			                else
			                	{
				                	jGobierno.Incrementar_Barra();
				                	setTimeout(jGobierno.Verificar_Ganador(), 2000)
			                	
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
				                		alert("ERROR");
				                	}
				                else
				                	{
					                	jGobierno.Incrementar_Barra();
					                	alert("SI")
				                	
				                	}
				            }
				        });	
					 },
			 
			 Incrementar_Barra:function(){
				 var barra=document.getElementById('progreso_sorteo');
				 barra.value+=20;
			 },
		   
		    rotarImagenes:function()
		    {
			    var imagenes=new Array(
				        ['../img/maipu.jpg'],
				        ['../img/publicidad_esp.jpg'],
				        ['../img/up.jpg'],
				        ['../img/fiat.jpg'],
				        ['../img/onix.jpg'],
				        ['../img/tiguan.jpg']
				    );

		        var index=Math.floor((Math.random()*imagenes.length));
		        document.getElementById("imagen_publicitaria").src=imagenes[index][0];
		        
		    },
		 
		    onload:function()
		    {
		    	jGobierno.rotarImagenes();	
		    	setInterval("jGobierno.rotarImagenes()",3000);
		    }		
		
};

$( document ).ready(function() {
    jGobierno.onload();
});
