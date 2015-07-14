/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function pubblica_post(){
    if($("#area").val()){
        var d = new Date();
        var day;
        var dayMonth=d.getDate().toString();
        var month;
        var year=d.getFullYear().toString();       
        var hours=d.getHours().toString();
        var minutes=(d.getMinutes()).toString();

        if(minutes.length==1){
            minutes="0"+minutes;
        }
        var completeHours=hours+":"+minutes;

        switch (d.getDay()) {
            case 0:
                day = "Domenica";
                break;
            case 1:
                day = "Lunedi";
                break;
            case 2:
                day = "Martedi";
                break;
            case 3:
                day = "Mercoledi";
                break;
            case 4:
                day = "Giovedi";
                break;
            case 5:
                day = "Venerdi";
                break;
            case  6:
                day = "Sabato";
                break;
        }

        switch(d.getMonth()){
            case 0: 
                month = "Gennaio";
                break;
            case 1: 
                month = "Febbraio";
                break;
            case 2:  
                month= "Marzo";
                break;
            case 3: 
                month = "Aprile";
                break;
            case 4: 
                month = "Maggio";
                break;
            case 5: 
                month = "Giugno"; 
                break;
            case 6: 
                month = "Luglio";
                break;
            case 7: 
                month = "Agosto";
                break;
            case 8: 
                month = "Settembre";
                break;
            case 9: 
                month = "Ottobre";
                break;
            case 10: 
                month = "Novembre";
                break;
            case 11: 
                month = "Dicembre";
                break;
        }
        
        var testo=$("#area").val();
        var data=day+" "+dayMonth+" "+month+" "+year;
        var date=data+" "+completeHours;
        
        $.ajax({
                type : "POST",
                url : "notizia.jsp",
                data : "testo=" + testo + "&data=" + data + "&ora=" + completeHours,
                success : function(){                                     
                    $("#bacheca").prepend("<div class='notizia'><h6 id='data'>"+date+"</h6><div id='testo'>"+testo+"</div></div>");
                    $("#area").val('');
                },   
                error : function(){
                    $("body").append("<div id='err-pub' class='alert alert-danger mess' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore: </strong> Pubblicazione non riuscita</div>");
                }
        });	    
    }   
}