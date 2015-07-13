/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function listenerTipoTratta(){
    var tipoTratta=$("#tipotratta");
    tipoTratta.bind('change',function(){ 
        var valTipoTratta=tipoTratta.val();     
        var compagnia = $("#compagnia").val();
        var citta=$("#citta").val();
        $.ajax({
                type : "POST",
                url : "tratta.jsp",
                data : "tipo=" + valTipoTratta + "&compagnia=" + compagnia+ "&citta=" + citta,
                dataType: "json",
                success : function(data){
                    var tratte=Object.keys(data);
                    $("#tratta").empty();
                    $("#tratta").append("<option>---</option>");                
                    for(var i=0;i<tratte.length;i++){
                    $("#tratta").append("<option value="+tratte[i]+">"+data[tratte[i]]+"</option>");
                    }
                }
        });	   
    });
}

function visualizzaOrari(){
    var citta=$( "#citta option:selected" ).text(); 
    var compagnia=$( "#compagnia option:selected" ).text();
    var tipo_tratta=$( "#tipo-tratta option:selected" ).text();
    var tratta=$( "#tratta option:selected" ).text();
   
    if(citta=="---" || compagnia=="---" || tipo_tratta=="---" || tratta=="---"){
       $("body").append("<div id='err-vis'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: qualche campo non è stato riempito</div>");
	           $("#err-vis").addClass("in");
                    window.setTimeout(function() { $("#err-vis").alert('close'); }, 3000); 
    }
    else{
        var tratta=$("#tratta").val();
        $.ajax({
            type : "POST",
            url : "fermata.jsp",
            data : "tratta=" + tratta ,
            dataType: "json",
            success : function(data) {
                var orari_partenza=Object.keys(data).sort();
                $("#orari").empty();
                $("#orari").append("<tr id='fermate'></tr>");
                for(var i=0;i<orari_partenza.length;i++){
                    $("#fermate").append("<td>"+ data[orari_partenza[i]]+"</td>");
                }
                $.ajax({
                    type : "POST",
                    url : "orario.jsp",
                    data : "tratta=" + tratta ,
                    dataType: "json",
                    success : function(data){
                        console.log(JSON.stringify(data));
                        for(var i=0;i<data["result"].length;i++){
                            var currentCorsa;
                            currentCorsa=data["result"][i].corsa;
                            if(i==0||currentCorsa!=data["result"][i-1].corsa){
                                $("#orari").append("<tr class="+currentCorsa+"><td>"+ data["result"][i].orario+"</td></tr>");
                            }
                            else{
                                $("."+currentCorsa).append("<td>"+ data["result"][i].orario +"</td>");
                            }
                        }                    
                    }                 
                });
                
            }              
        });
    }	
}
