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
        $.ajax({
              type : "POST",
              url : "tratta.jsp",
              data : "tipo=" + valTipoTratta + "&compagnia=" + compagnia,
              dataType: "json",
              success : function(data) {
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