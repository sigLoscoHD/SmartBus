/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function controllo(){
        var password=$("#pass").val();
        var npassword=$("#npass").val();
       
	     if(password !== npassword)
	      {
	         $("#myModal").append("<div id='err-pass'class='alert alert-danger alert-dismissible fade' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore</strong>: le password inserite non sono uguali!</div>");
	           $("#err-pass").addClass("in");
                    window.setTimeout(function() { $("#err-pass").alert('close'); }, 2000); 
	            
	            return false;
	      	}
      return true;
}
