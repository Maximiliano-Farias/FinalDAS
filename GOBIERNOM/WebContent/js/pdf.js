var jPdf = {
		
		imprimirPDFEstado: function()  {
		    var printDoc = new jsPDF('p', 'pt');
		    printDoc.setFontType('bold');
		    printDoc.text( 230, 50,document.getElementById('var').innerHTML);
		    printDoc.line(1,52,2000,52);
		    printDoc.setFontType('normal');
		    printDoc.text( 60, 70,"PLAN: "+document.getElementById('var1').innerHTML);
		    printDoc.line(60,72,105,72);
		    printDoc.text( 60, 90,document.getElementById('nomb').innerHTML+" "+document.getElementById('nombr').innerHTML);
		    printDoc.line(60,92,105,92);
		    printDoc.text( 60, 110,document.getElementById('mod').innerHTML+" "+document.getElementById('mode').innerHTML);
		    printDoc.line(60,112,130,112);
		    printDoc.text( 60, 130,document.getElementById('conc').innerHTML+" "+document.getElementById('conce').innerHTML);
		    printDoc.line(60,132,195,132);
            printDoc.text( 60, 150,document.getElementById('fec').innerHTML+" "+document.getElementById('fech').innerHTML);
            printDoc.line(60,152,190,152);
            printDoc.fromHTML($('#Facturas_detalles').get(0), 80, 180);
		    printDoc.autoPrint();
		    printDoc.output("dataurlnewwindow");
		    },
		    
		    
		 ImprimirEstaisticas: function(){

			    var printDoc = new jsPDF('p', 'pt');
			    printDoc.setFontType('bold');
			    printDoc.text( 230, 50,document.getElementById('estadisticas_titulo').innerHTML);
			    printDoc.line(1,52,2000,52);
			    printDoc.setFontType('normal');
			    printDoc.fromHTML($('#estdisticas_concesionaria').get(0), 100, 70);
			    printDoc.fromHTML($('#autos_vendidos').get(0), 100, 160);
			    printDoc.fromHTML($('#autos_vendidos').get(0), 100, 160);
			    printDoc.fromHTML($('#estadisticas_planes').get(0), 100, 420);
			    printDoc.autoPrint();
			    printDoc.output("dataurlnewwindow");
		 },
		 
		 
		 ImprimirGanador: function(){
			    var printDoc = new jsPDF('p', 'pt');
			    printDoc.setFontType('bold');
			    printDoc.text( 230, 50,document.getElementById('fecha_sorteo').value);
			    printDoc.line(1,52,2000,52);
			    printDoc.text( 20, 90,document.getElementById('ganador_sorteo').value);
			    printDoc.line(20,92,100,92);
			    printDoc.text( 20, 130,document.getElementById('identificador_sorteo').value);
			    printDoc.line(20,132,40,132);
			    printDoc.text( 20, 170,document.getElementById('nombre_auto_sorteo').value);
			    printDoc.line(20,172,70,172);
			    printDoc.text( 20, 210,document.getElementById('tipo_modelo_sorteo').value);
			    printDoc.line(20,212,100,212);
			    printDoc.text( 20, 250,document.getElementById('email_ganador_sorteo').value);
			    printDoc.line(20,252,160,252);
			    printDoc.text( 20, 290,document.getElementById('direccion_ganador_sorteo').value);
			    printDoc.line(20,292,200,292);
			    printDoc.text( 20, 330,document.getElementById('telefono_sorteo').value);
			    printDoc.line(20,332,50,332);
			    printDoc.text( 20, 400,document.getElementById('concesionaria_sorteo').value);
			    printDoc.line(20,402,155,402);
			    printDoc.text( 20, 440,document.getElementById('email_concesionaria_sorteo').value);
			    printDoc.line(20,442,210,442);
			    printDoc.text( 20, 480,document.getElementById('direccion_concesionaria_sorteo').value);
			    printDoc.line(20,482,250,482);
			    printDoc.text( 20, 500,document.getElementById('en_fecha').innerHTML);
			    printDoc.autoPrint();
			    printDoc.output("dataurlnewwindow");
		 },

			
			
		
};