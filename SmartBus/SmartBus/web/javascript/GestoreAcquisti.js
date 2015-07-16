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
            }
        }); 
       $("#abb-button").attr("data-toggle","modal");
       $("#abb-button").attr("data-target","#abb-modal");
       
   }
   
   
}

function verificaDati(id){
    var nome=$("#nome").val();
    var cognome=$("#cognome").val();
    var data=$("#data").val();
    var residenza=$("#residenza").val();
    var luogonas=$("#luogonas").val();
    console.log(data);
    if(nome== "" || cognome=="" || residenza=="" || luogonas=="" || data=="" ){
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
            }
        });
   }
}

function getPrezzo(){
    var citta=$( "#citta option:selected" ).text(); 
   var compagnia=$( "#compagnia option:selected" ).text();
   var tipo_tratta=$( "#tipo-tratta option:selected" ).text();
   var tratta=$( "#tratta option:selected" ).text();
   console.log(citta);
   console.log(compagnia);
  
}




function generaBiglietto(nome, cognome){
            var doc = new jsPDF();
           doc.text(20, 20, 'Biglietto');
           doc.text(20, 30, 'Compagnia: ');
           doc.text(20, 40, 'Citta: ');
           doc.text(20, 50, 'Tratta: ');
           doc.text(20, 60, 'Acquistato da' + nome + ' ' + cognome);
           // Output as Data URI
           doc.output('datauri');
}

function generaAbbonamento(nome, cognome, datanas, luogonas, residenza){
       var doc = new jsPDF();
       doc.text(20, 20, 'Abbonamento nome_compagnia');
       doc.text(20, 30, 'Nome : ' + nome);
       doc.text(20, 40, 'Cognome :' + cognome);
       doc.text(20, 50, 'Nato a :' + luogonas);
       doc.text(20, 60, ' il :' + datanas);
       doc.text(20, 70, 'Risiede a : ' + residenza);
       doc.text(20, 80, 'Valido per la tratta nome_tratta ');
       // Output as Data URI
       doc.output('datauri');
}
