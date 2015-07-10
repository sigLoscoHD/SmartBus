/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function listenerCitta(){
    var citta=$("#citta");
    citta.bind('change',function(){ 
        var valcitta=citta.val();
        $.ajax({
              type : "POST",
              url : "compagnia.jsp",
              data : "citta=" + valcitta,
              dataType: "json",
              success : function(data) {
                  var compagnie=Object.keys(data);
                  $("#compagnia").empty();
                  $("#compagnia").append("<option>---</option>");                
                  for(var i=0;i<compagnie.length;i++){
                      $("#compagnia").append("<option value="+compagnie[i]+">"+data[compagnie[i]]+"</option>");
                  }
                  listenerCompagnia();
              }
         });	   
    });
}