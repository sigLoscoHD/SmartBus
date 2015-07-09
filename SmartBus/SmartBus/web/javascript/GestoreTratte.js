/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function listener(){
    citta=$("#citta");
    citta.bind('change',function(){  
        console.log(citta.val());
        valcitta=citta.val();
        $.ajax({
              type : "POST",
              url : "compagnia.jsp",
              data : "citta=" + valcitta,
              dataType: "json",
              success : function(data) {
                console.log(data);           
              }
         });
	   
    });
}