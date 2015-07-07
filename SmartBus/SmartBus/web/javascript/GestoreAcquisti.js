/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function controlloBiglietto(){
   var citta=$( "#citta option:selected" ).text(); 
   var compagnia=$( "#compagnia option:selected" ).text();
   var tipo_tratta=$( "#tipo-tratta option:selected" ).text();
   var tratta=$( "#tratta option:selected" ).text();
   
   if(citta=="---" || compagnia=="---" || tipo_tratta=="---" || tratta=="---"){
       $("body").append("<div id='err-acq'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: qualche campo non è stato riempito</div>");
	           $("#err-acq").addClass("in");
                    window.setTimeout(function() { $("#err-acq").alert('close'); }, 3000); 
   }
}

function controlloAbbonamento(){
   var citta=$( "#citta option:selected" ).text(); 
   var compagnia=$( "#compagnia option:selected" ).text();
   var tipo_tratta=$( "#tipo-tratta option:selected" ).text();
   var tratta=$( "#tratta option:selected" ).text();
   
   if(citta=="---" || compagnia=="---" || tipo_tratta=="---" || tratta=="---"){
       $("body").append("<div id='err-acq'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: qualche campo non è stato riempito</div>");
	           $("#err-acq").addClass("in");
                    window.setTimeout(function() { $("#err-acq").alert('close'); }, 3000); 
   }
}
