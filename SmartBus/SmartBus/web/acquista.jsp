<%-- 
    Document   : acquista
    Created on : 6-lug-2015, 22.30.41
    Author     : Matteo
--%>

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
        <script src="javascript/GestoreAcquisti.js" type="text/javascript"></script>
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
        <script src="javascript/PDFcreator.js" type="text/javascript"></script>
        <!--Gestori-->
        <script src="javascript/GestoreTratte.js" type="text/javascript"></script>
        
        <title>Acquista</title>
    </head>
    <body>
        
        <%
        Utente sesuser=null;
        sesuser=(Utente) session.getAttribute("loggato");

        ServletContext context = pageContext.getServletContext();
        %>
      
         <div id="tab-container">
            <ul class="nav nav-pills " id="menu">
                <li role="presentation" class="active"><a href="#acq-bigl" aria-controls="acq-bigl" role="tab" data-toggle="tab">Acquista biglietto</a></li>
                <li role="presentation"><a href="#acq-abb" aria-controls="acq-abb" role="tab" data-toggle="tab">Acquista abbonamento</a></li>
            </ul>
            
            <!-- Tab panes -->
            <div class="tab-content" id="contenuto">
                <div role="tabpanel" class="tab-pane active" id="acq-bigl">
                    <h3><%out.print(sesuser.nome +", cosa vuoi acquistare?");%> </h3>
                    <form action="" method="POST" role="form">
                        <div class="form-group">
                            <label for="citta">Città</label>
                                <select class="form-control" id="citta">
                                  <option>---</option>
                                  <option>Ascoli Piceno</option>
                                  <option>Bologna</option>
                                  <option>San Benedetto del Tronto</option>
                                </select>
                        </div>
                        <div class="form-group">
                            <label for="compagnia">Compagnia</label>
                                <select class="form-control" id="compagnia">
                                  <option>---</option>
                                  <option>Start</option>
                                  <option>Start-Bologna</option>
                                  <option>Altra compagnia</option>
                                </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipologia tratta</label>
                                <select class="form-control" id="tipo-tratta">
                                  <option>---</option>
                                  <option>Urbana</option>
                                  <option>Extra-urbana</option>
                                </select>
                        </div>
                        <div class="form-group">
                            <label for="tratta">Tratta</label>
                                <select class="form-control" id="tratta">
                                  <option>---</option>
                                  <option>Sbt-Ascoli</option>
                                  <option>Sbt-Martinsicuro</option>
                                </select>
                        </div>
                        <button type="button" class="btn btn-warning" onclick="controlloBiglietto();"  id="bigl-button" >Acquista biglietto</button>
                    </form>

              </div>
              <div role="tabpanel" class="tab-pane" id="acq-abb">
                 <h3><%out.print(sesuser.nome +", cosa vuoi acquistare?");%></h3>
                    <form action="" method="POST" role="form">
                        <div class="form-group">
                            <label for="citta">Città</label>
                                <select class="form-control" id="citta2">
                                  <option>---</option>
                                  <option>Ascoli Piceno</option>
                                  <option>Bologna</option>
                                  <option>San Benedetto del Tronto</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="compagnia">Compagnia</label>
                                    <select class="form-control" id="compagnia2">
                                      <option>---</option>
                                      <option>Start</option>
                                      <option>Start-Bologna</option>
                                      <option>Altra compagnia</option>
                                    </select>
                            </div>
                            <div class="form-group">
                                <label for="tipo">Tipologia tratta</label>
                                    <select class="form-control" id="tipo-tratta2">
                                      <option>---</option>
                                      <option>Urbana</option>
                                      <option>Extra-urbana</option>
                                    </select>
                            </div>
                            <div class="form-group">
                                <label for="tratta">Tratta</label>
                                    <select class="form-control" id="tratta2">
                                      <option>---</option>
                                      <option>Sbt-Ascoli</option>
                                      <option>Sbt-Martinsicuro</option>
                                    </select>
                            </div>
                        <button type="button" class="btn btn-warning" onclick="controlloAbbonamento();" id="abb-button" >Acquista abbonamento</button>
                    </form>
              </div>
              
            </div>
            
        </div>
                    
         <!--Modal pagamento biglietto-->
        <div class="modal fade" id="bigl-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Pagamento biglietto</h4>
                    </div>
                    <div class="modal-body"> 
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
                            <button type="button" class="btn btn-warning" onclick="generaBiglietto(<%out.print(" ' "+ sesuser.nome +" ' ");%> , <%out.print(" ' "+ sesuser.cognome +" ' ");%>)">Pay Now</button>
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
                       
                         <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="nome">Nome:</label>
                               <input type="text" class="form-control" required id="nome" name="nome" value="<%if(sesuser.nome!=null){out.println(sesuser.nome);}else{out.print("");}%>">
                            </div>
                        
                            <div class="form-group">
                                    <label for="cognome">Cognome:</label>
                                    <input type="text" class="form-control" required id="cognome" name="cognome" value="<%if(sesuser.cognome!=null){out.println(sesuser.cognome);}else{out.print("");}%>">
                            </div>
                            
                            <div class="form-group">
                                    <label for="datanascita">Data di nascita:</label>
                                <input type="date" class="form-control"  required id="data" value="<%if(sesuser.datanascita!=null){out.println(sesuser.datanascita);}else{out.print("");}%>"></input>
                            
                               
                              </div>
                             <div class="form-group">
                                    <label for="residenza">Residenza:</label>
                                    <input type="text" class="form-control" required id="residenza" name="residenza" value="<%if(sesuser.residenza!=null){out.println(sesuser.residenza);}else{out.print("");}%>">
                            </div>
                            <div class="form-group">
                                    <label for="luogonas">Luogo di nascita:</label>
                                    <input type="text" class="form-control"  id="luogonas" name="luogonas" value="<%out.println(sesuser.luogonascita);%>" required>
                            </div>
                            <input type="button" value="next" class="btn btn-warning" id="next" onclick="verificaDati();"/>
                        </form>
                      
                    </div>
                   

                </div>
            </div>
        </div>
                            
               <!-- Modal pagamento abbonamento-->
               <div class="modal fade" id="abbpay-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Pagamento abbonamento</h4>
                    </div>
                    <div class="modal-body"> 
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
                            <button type="button" class="btn btn-warning" onclick="generaAbbonamento(<%out.print(" ' "+ sesuser.nome +" ' ");%> , <%out.print(" ' "+ sesuser.cognome +" ' ");%>, <%out.print(" ' "+ sesuser.datanascita +" ' ");%> , <%out.print(" ' "+ sesuser.luogonascita +" ' ");%> , <%out.print(" ' "+ sesuser.residenza +" ' ");%>);">Pay Now</button>
                        </div>
                      </div>
                    
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
                    <a href="logout.jsp"> <button id="logout" type="button" class="btn btn-warning  navbar-btn" >Logout</button> </a>   
                </div>
            </div>
        </div>
    </body>
</html>
