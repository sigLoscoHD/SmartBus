/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function listenerCompagnia(){
    var compagnia=$("#compagnia");
    compagnia.bind('change',function(){ 
        $("#tipotratta").empty();
        $("#tipotratta").append("<option value='urbano'>---</option>");
        $("#tipotratta").append("<option value='urbano'>Urbana</option>");
        $("#tipotratta").append("<option value='extra'>Extra-urbana</option>");
        listenerTipoTratta();
        listenerTipoTratta2()
    });
}

