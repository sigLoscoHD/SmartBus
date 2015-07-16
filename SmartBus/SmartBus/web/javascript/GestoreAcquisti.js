/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function listenerTipoTratta2(){
    
    var tipoTratta=$("[name='tipo_tratta']");
    
    tipoTratta.bind('change',function(){ 
        var valTipoTratta=tipoTratta.val();
        console.log(valTipoTratta);
                if(valTipoTratta=="urbano"){
                   $("#tratta").empty();
                    $("#tratta").attr("disabled", "disabled"); 
                    }
                if(valTipoTratta=="extra"){
                   $("#tratta").removeAttr('disabled'); 
                }    
                    
                });
     
}


function controlloChange(){
   var citta=$( "#citta option:selected" ).text(); 
   var compagnia=$( "#compagnia option:selected" ).text();
   var tipo_tratta=$( "#tipotratta option:selected" ).text();
   var tratta=$( "#tratta option:selected" ).text();
    $("#bigl-button").removeAttr("data-toggle");
    $("#bigl-button").removeAttr("data-target");
    $("#abb-button").removeAttr("data-toggle");
    $("#abb-button").removeAttr("data-target"); 
   
   if(citta=="---" || compagnia=="---" || tipo_tratta=="---" || (tratta=="---" && $("#tratta").prop("disabled")==false)){
       $("body").append("<div id='err-acq'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: qualche campo non è stato riempito</div>");
	           $("#err-acq").addClass("in");
                    window.setTimeout(function() { $("#err-acq").alert('close'); }, 3000); 
   }
   
   else{
   
       $("#bigl-button").attr("data-toggle","modal");
       $("#bigl-button").attr("data-target","#Paymodal");
       
   $.ajax({
            type : "POST",
            url : "prezzo.jsp",
            data : "tipo=" + tipo_tratta + "&citta=" + citta + "&compagnia=" + compagnia + "&tratta=" + tratta,
            dataType:"text",
            success : function(data) {
                 $("#prezzo-bigl").empty();
                 $("#prezzo-bigl").append(data);
                 $("#pay").click(function(){
                            generaBiglietto(citta, compagnia, tipo_tratta, tratta); 
                        });
            }
        }); 
       $("#abb-button").attr("data-toggle","modal");
       $("#abb-button").attr("data-target","#abb-modal");
       
   }
   
   
}

function verificaDati(){
    var nome=$("#nome").val();
    var cognome=$("#cognome").val();
    var datanas=$("#data").val();
    var residenza=$("#residenza").val();
    var luogonas=$("#luogonas").val();
    var citta=$( "#citta option:selected" ).text(); 
    var compagnia=$( "#compagnia option:selected" ).text();
    var tipo_tratta=$( "#tipotratta option:selected" ).text();
    var tratta=$( "#tratta option:selected" ).text();
    
    if(nome== "" || cognome=="" || residenza=="" || luogonas=="" || datanas=="" ){
          $("#next").removeAttr("data-toggle");
          $("#next").removeAttr("data-target");
          $("#abb-modal").append("<div id='err-acq'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: qualche campo non è stato riempito</div>");
	           $("#err-acq").addClass("in");
                    window.setTimeout(function() { $("#err-acq").alert('close'); }, 3000); 
    }
    else{
         $("#next").attr("data-toggle","modal");
         $("#next").attr("data-target","#Paymodal");
       
    $.ajax({
            type : "POST",
            url : "modifica.jsp",
            data : "nome=" + nome + "&cognome=" + cognome +"&data=" + data + "&residenza=" + residenza +"&luogonas="+ luogonas,
            dataType:"text",
            success : function(data) {
               $("#abb-modal").modal('hide'); 
                  $.ajax({
                    type : "POST",
                    url : "abbonamento.jsp",
                    data : "tipo=" + tipo_tratta + "&citta=" + citta + "&compagnia=" + compagnia + "&tratta=" + tratta,
                    dataType:"text",
                    success : function(data) {
                         $("#prezzo-bigl").empty();
                         $("#prezzo-bigl").append(data);
                        $("#pay").click(function(){
                            generaAbbonamento(nome, cognome, datanas, residenza, luogonas, tipo_tratta, compagnia, tratta); 
                        });
                    }
                }); 
            }
        });
   }
}


function generaBiglietto(citta, compagnia, tipo_tratta, tratta){
            var doc = new jsPDF();
            if (tipo_tratta=="Urbana")
                doc.text(20, 20, 'Biglietto urbano');
            else{
                doc.text(20, 20, 'Biglietto Extra-urbano');
            }
           doc.text(20, 30, 'Biglietto erogato dalla compagnia: ' +compagnia);
           doc.text(20, 40, 'Citta: ' + citta);
           if(tipo_tratta=="Extra-urbana"){
               doc.text(20, 50, 'Tratta: ' + tratta);
           }
           
          
           // Output as Data URI
           doc.output('datauri');
}

function generaAbbonamento(nome, cognome, data, residenza, luogonas, tipo_tratta, compagnia, tratta){
       var doc = new jsPDF();
       if(tipo_tratta=="Urbana"){
         doc.text(20, 20, 'Abbonamento urbano');  
       }
       else{
          doc.text(20, 20, 'Abbonamento extra-urbano');   
       }
       
       doc.text(20, 30, 'Nome : ' + nome);
       doc.text(20, 40, 'Cognome :' + cognome);
       doc.text(20, 50, 'Nato a :' + luogonas);
       doc.text(20, 60, 'il :' + data);
       doc.text(20, 70, 'Risiede a : ' + residenza);
       if(tipo_tratta=="Extra-urbana"){
        doc.text(20, 80, 'Valido per la tratta: ' + tratta);
        doc.text(20, 90, 'Abbonamento erogato dalla compagnia: ' + compagnia);
       }else
       {
         doc.text(20, 80, 'Abbonamento erogato dalla compagnia: ' + compagnia);  
       }
       
       // Output as Data URI
       doc.output('datauri');
}
