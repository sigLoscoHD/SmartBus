<%-- 
    Document   : acquista
    Created on : 6-lug-2015, 22.30.41
    Author     : Matteo
--%>

<%@page import="database.Citta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.DBQuery"%>
<%@page import="database.Utente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="javascript/jquery-ui.min.js" type="text/javascript"></script>
        <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSacquista.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSnavbar.css" rel="stylesheet" type="text/css"/>
        <script src="javascript/controllo.js" type="text/javascript"></script>
        
        <script src="javascript/jquery-ui.min_1.js" type="text/javascript"></script>
        <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!-- JS PDF -->
        <script src="javascript/JSpdf/base64.js" type="text/javascript"></script>
        <script src="javascript/JSpdf/jspdf.js" type="text/javascript"></script>
        <script src="javascript/JSpdf/sprintf.js" type="text/javascript"></script>
        <!--Gestori-->
        <script src="javascript/GestoreCitta.js" type="text/javascript"></script>
        <script src="javascript/GestoreCompagnie.js" type="text/javascript"></script>
        <script src="javascript/GestoreAcquisti.js" type="text/javascript"></script>
        <script src="javascript/GestoreTratte.js" type="text/javascript"></script>
        <title>Acquista</title>
    </head>
    <body onload="listenerCitta();">
        <%
        Utente sesuser=null;
        sesuser=(Utente) session.getAttribute("loggato");

        ServletContext context = pageContext.getServletContext();
        %>
      
         <div id="tab-container">
            
            <div id="acquista">Acquista</div>
            
            
            <!-- Tab panes -->
            <div class="tab-content" id="contenuto">
                <div role="tabpanel" class="tab-pane active" id="acq-bigl">
                    <h3><%out.print(sesuser.nome +", cosa vuoi acquistare?");%> </h3>
                    <form action="" method="POST" role="form">
                        <div class="form-group">
                            <label for="citta">Città</label>
                            <select class="form-control" id="citta">
                                <option>---</option>
                                <%
                                ArrayList <Citta> citta =DBQuery.getCitta(context);
                                for(int i=0;i<citta.size();i++){
                                    %>
                                    <option value="<%out.print(citta.get(i).id);%>"><%out.print(citta.get(i).nome);%></option>
                                    <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="compagnia">Compagnia</label>
                            <select class="form-control" id="compagnia">
                                <option>---</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipologia tratta</label>
                            <select class="form-control" id="tipotratta" name="tipo_tratta">
                                <option>---</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tratta">Tratta</label>
                            <select class="form-control" id="tratta">
                              <option>---</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-warning" onclick="controlloChange();"  id="bigl-button" >Acquista biglietto</button>
                        <button type="button" class="btn btn-warning" onclick="controlloChange();" id="abb-button" style="margin-left: 59px;">Acquista abbonamento</button>
                    </form>

              </div>
            </div>
        </div>
                    
         <!--Modal pagamento-->
         <div class="modal fade" id="Paymodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Pagamento</h4>
                    </div>
                    <div class="modal-body">
                        <div id="prezzo-bigl">
                           
                        </div>
                        <hr>
                    <form class="form-horizontal" role="form">
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
                        <div class="col-sm-9">
                          <div class="row">
                            <div class="col-xs-3">
                              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                                <option>Month</option>
                                <option value="01">Jan (01)</option>
                                <option value="02">Feb (02)</option>
                                <option value="03">Mar (03)</option>
                                <option value="04">Apr (04)</option>
                                <option value="05">May (05)</option>
                                <option value="06">June (06)</option>
                                <option value="07">July (07)</option>
                                <option value="08">Aug (08)</option>
                                <option value="09">Sep (09)</option>
                                <option value="10">Oct (10)</option>
                                <option value="11">Nov (11)</option>
                                <option value="12">Dec (12)</option>
                              </select>
                            </div>
                            <div class="col-xs-3">
                              <select class="form-control" name="expiry-year">
                                <option value="13">2013</option>
                                <option value="14">2014</option>
                                <option value="15">2015</option>
                                <option value="16">2016</option>
                                <option value="17">2017</option>
                                <option value="18">2018</option>
                                <option value="19">2019</option>
                                <option value="20">2020</option>
                                <option value="21">2021</option>
                                <option value="22">2022</option>
                                <option value="23">2023</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
                        <div class="col-sm-3">
                          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-warning" id="pay" >Pay Now</button>
                        </div>
                      </div>                   
                    </form>
                    </div>
                </div>
            </div>
        </div>
         
         
         <!--Modal pagamento abbonamento-->
        <div class="modal fade" id="abb-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Pagamento</h4>
                    </div>
                    <div class="modal-body" id="verifica-dati">
                        <!--Prima pagina: verifica dati personali -->
                       
                         <form class="form-horizontal" role="form" method="POST" data-toggle="validator">
                            <div class="form-group">
                                <label for="nome">Nome:</label>
                               <input type="text" class="form-control " id="nome" name="nome" value="<%if(sesuser.nome!=null){out.print(sesuser.nome);}else{out.print("");}%>" required>
                            </div>
                        
                            <div class="form-group">
                                    <label for="cognome">Cognome:</label>
                                    <input type="text" class="form-control" id="cognome" name="cognome" value="<%if(sesuser.cognome!=null){out.print(sesuser.cognome);}else{out.print("");}%>" required>
                            </div>
                            
                            <div class="form-group">
                                    <label for="datanascita">Data di nascita: </label>
                                 <input type="date" id="data" class="form-control"  required value="<%if(sesuser.datanascita!=null){out.print(sesuser.datanascita);}%>">
                               </div>
                             <div class="form-group">
                                    <label for="residenza">Residenza:</label>
                                    <input type="text" class="form-control" required id="residenza" name="residenza" value="<%if(sesuser.residenza!=null){out.print(sesuser.residenza);}else{out.print("");}%>">
                            </div>
                            <div class="form-group">
                                    <label for="luogonas">Luogo di nascita:</label>
                                    <input type="text" class="form-control" required id="luogonas" name="luogonas" value="<%if(sesuser.luogonascita!=null){out.print(sesuser.luogonascita);}else{out.print("");}%>">
                            </div>
                            <input type="button" value="next" class="btn btn-warning" id="next" data-toogle="modal" data-target="#Paymodal" onclick="verificaDati();"/>
                        </form>                    
                    </div>
                </div>
            </div>
        </div>
 
       <div id="navbar" class="navbar navbar-default navbar-fixed-top"  >
            <div class="container">
                <div class="navbar-header">
                    <a id="brand" class="navbar-brand" href="Home.jsp">SmartBus</a>
                </div>
                <div id="logout-container">
                    <a style="text-decoration: none;" href="visualizzaNotizie.jsp">
                        <button id="notizie" type="button" class="btn btn-warning navbar-btn">
                            <span class="glyphicon glyphicon-inbox" aria-hidden="true"></span> Notizie
                        </button>
                        
                    </a>
                    <a href="logout.jsp"> <button id="logout" type="button" class="btn btn-warning  navbar-btn" >Logout</button> </a>   
                </div>
            </div>
        </div>
    </body>
</html>
