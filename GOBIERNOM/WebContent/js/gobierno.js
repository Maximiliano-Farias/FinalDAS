var refreshIntervalId;

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
	            data: $.param($("input[name=usuario],input[name=contrasena]")),
	            error: function(hr){
	            	alert("error");
	                jUtils.hiding("result");
	                jUtils.showing("message", hr.responseText);
	            },
	            success: function(html) {
	            	clearInterval(refreshIntervalId);
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
            data: $.param($("select[name=Sorteo_Elegido]")),
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
			var id_concesionaria = $('#id_concesionaria').val();
			var nombre_concesionaria = $('#nombre_concesionaria').val();
			var Habilitado = $('#Habilitado').val();
			var direccion_concesionaria = $('#direccion_concesionaria').val();
			var telefono_concesionaria = $('#telefono_concesionaria').val();
			var url_concesionaria = $('#url_concesionaria').val();
			var metodo_1_concesionaria = $('#metodo_1_concesionaria').val();
			var metodo_2_concesionaria = $('#metodo_2_concesionaria').val();
			var Servicio =	$('#Servicio').val();
			jUtils.executing("message");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/GuardarConcesionariaAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"id_concesionaria":id_concesionaria,"nombre_concesionaria":nombre_concesionaria,"Habilitado":Habilitado,"direccion_concesionaria":direccion_concesionaria,"telefono_concesionaria":telefono_concesionaria,"url_concesionaria":url_concesionaria,"metodo_1_concesionaria":metodo_1_concesionaria,"metodo_2_concesionaria":metodo_2_concesionaria,"Servicio":Servicio}),
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
			var nombre_concesionaria_nueva= $("#nombre_concesionaria_nueva").val();
			var id_concesionaria_nueva= $("#id_concesionaria_nueva").val();
			var Habilitado_nueva= $("#Habilitado_nueva").val();
			var direccion_concesionaria_nueva= $("#direccion_concesionaria_nueva").val();
			var telefono_concesionaria_nueva= $("#telefono_concesionaria_nueva").val();
			var url_concesionaria_nueva= $("#url_concesionaria_nueva").val();
			var email_concesionaria_nueva= $("#email_concesionaria_nueva").val();
			var metodo_1_concesionaria_nueva= $("#metodo_1_concesionaria_nueva").val();
			var metodo_2_concesionaria_nueva= $("#metodo_2_concesionaria_nueva").val();
			var Servicio_nueva= $("#Servicio_nueva").val();
	        jUtils.executing("message");
	        jUtils.hiding("message");
	        $.ajax({
	            url: "/gobierno/CrearConcesionariaAction.do",
	            type: "post",
	            dataType: "html",
	            data: $.param({"nombre_concesionaria_nueva":nombre_concesionaria_nueva,"id_concesionaria_nueva":id_concesionaria_nueva,"Habilitado_nueva":Habilitado_nueva,"direccion_concesionaria_nueva":direccion_concesionaria_nueva,"telefono_concesionaria_nueva":telefono_concesionaria_nueva,"url_concesionaria_nueva":url_concesionaria_nueva,"email_concesionaria_nueva":email_concesionaria_nueva,"metodo_1_concesionaria_nueva":metodo_1_concesionaria_nueva,"metodo_2_concesionaria_nueva":metodo_2_concesionaria_nueva,"Servicio_nueva":Servicio_nueva}),
	            error: function(hr){
	            	
	            	jUtils.showing("cabecera", html);
	            },
	            success: function(html) {
	                alert("OK");
	                jOpciones.Concesionarias();
	            }
	            
	        });
		},
		
			Sorteo_Pendiente_Elegido: function() {
		        
		        var id_sorteo = $("select[name=Sorteo_Pendiente_Elegido]").val();
		        var permiso = $('#perfil').val();
		        
		        jUtils.executing("resultados");
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
				var fecha_sorteo_nuevo=  $('#fecha_sorteo_nuevo').val();
				var id_sorteo_nuevo=  $('#id_sorteo_nuevo').val();
				var Estado_sorteo_nuevo=  $('#Estado_sorteo_nuevo').val();
				var descripcion_sorteo_nuevo=  $('#descripcion_sorteo_nuevo').val();
				jUtils.executing("message");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/GuardarSorteoAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"fecha_sorteo_nuevo":fecha_sorteo_nuevo,"id_sorteo_nuevo":id_sorteo_nuevo,"Estado_sorteo_nuevo":Estado_sorteo_nuevo,"descripcion_sorteo_nuevo":descripcion_sorteo_nuevo}),
		            error: function(hr){
		            	alert("ERROR");	
		            },
		            success: function(html) {
		            	jOpciones.Sorteos_Pendientes();
		            }
		            
		        });
			},
			
			Crear_Sorteo: function() {
				var fecha_sorteo_crear=  $('#fecha_sorteo_crear').val();
				var Estado_sorteo_crear=  $('#Estado_sorteo_crear').val();
				var descripcion_sorteo_crear=  $('#descripcion_sorteo_crear').val();
		        jUtils.executing("message");
		        jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/CrearSorteoAction.do",
		            type: "post",
		            dataType: "html",
		            data: $.param({"fecha_sorteo_crear":fecha_sorteo_crear,"Estado_sorteo_crear":Estado_sorteo_crear,"descripcion_sorteo_crear":descripcion_sorteo_crear}),
		            error: function(hr){
		            	jOpciones.Sorteos_Pendientes();  
		            	    
		            },
		            success: function(html) {	  	
		            	alert("OK");
		            	jGobierno. Sorteos_Pendientes();   
		            }
		            
		        });
			},
				

			ActualizarDatosPersonales: function() {
			        	var Id_plan = $('#Id_plan').val();
			        	var Direccion = $('#Direccion_Usuario').val();
			        	var Mail = $('#Mail_Usuario').val();
			        	var Telefono = $('#Telefono_Usuario').val();
				        $.ajax({
				            url: "/gobierno/ActualizarUsuarioAction.do",
				            type: "post",
				            dataType: "html",
				            data: $.param({"Id_plan":Id_plan,"Direccion":Direccion,"Mail":Mail,"Telefono":Telefono}),
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
		    
		    Crear_Sor:function()
		                        {
		    	jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/CrearSorAction.do",
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
               
                               
	           Crear_Con:function()
	            {
	            jUtils.hiding("message");
		        $.ajax({
		            url: "/gobierno/CrearConAction.do",
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
		 
		    onload:function()
		    {
		    	jGobierno.rotarImagenes();	
		    	refreshIntervalId = setInterval("jGobierno.rotarImagenes()",3000);
		    }
		    
		   	
};

$( document ).ready(function() {
    jGobierno.onload();
});
