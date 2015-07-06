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
                                <select class="form-control" id="citta">
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
                                <select class="form-control" id="tipo-tratta">
                                  <option>---</option>
                                  <option>Sbt-Ascoli</option>
                                  <option>Sbt-Martinsicuro</option>
                                </select>
                        </div>
                        <button type="button" class="btn btn-warning" onclick="generaBiglietto();">Acquista biglietto</button>
                    </form>

              </div>
              <div role="tabpanel" class="tab-pane" id="acq-abb">
                 <h3><%out.print(sesuser.nome +", cosa vuoi acquistare?");%></h3>
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
                                    <select class="form-control" id="citta">
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
                                    <select class="form-control" id="tipo-tratta">
                                      <option>---</option>
                                      <option>Sbt-Ascoli</option>
                                      <option>Sbt-Martinsicuro</option>
                                    </select>
                            </div>
                        <button type="button" class="btn btn-warning" onclick="generaAbbonamento();" >Acquista abbonamento</button>
                    </form>
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
