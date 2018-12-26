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
		 }

			
			
		
};