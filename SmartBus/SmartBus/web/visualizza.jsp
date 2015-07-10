<%-- 
    Document   : visualizza
    Created on : 6-lug-2015, 22.38.47
    Author     : Matteo
--%>

<%@page import="database.Fermata"%>
<%@page import="database.Citta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.Utente"%>
<%@page import="database.DBQuery"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--JQuery JQueryUI-->
        <script src="javascript/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="javascript/jquery-ui.min.js" type="text/javascript"></script>
        <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <!--page CSS -->
        <link href="css/CSSnavbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSvisualizza.css" rel="stylesheet" type="text/css"/>
        <!--Gestori-->
        <script src="javascript/GestoreCitta.js" type="text/javascript"></script>
        <script src="javascript/GestoreCompagnie.js" type="text/javascript"></script>
        <script src="javascript/GestoreTratte.js" type="text/javascript"></script>
      
        <title>Tratte e Orari</title>
    </head>
    <body onload="listenerCitta();">
       <%
        Utente sesuser=null;
        sesuser=(Utente) session.getAttribute("loggato");

        ServletContext context = pageContext.getServletContext();
        %>
        <div id="navbar" class="navbar navbar-default navbar-fixed-top"  >
            <div class="container">
                <div class="navbar-header">
                    <a id="brand" class="navbar-brand" href="Home.jsp">SmartBus</a>
                </div>
                <div id="logout-container">
                  <a href="logout.jsp"><button id="logout" type="button" class="btn btn-warning navbar-btn">Logout</button></a>     
                </div>
            </div>
        </div>   
        <div id="form-container"> 
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
                    <label for="tratta">Compagnia</label>
                        <select class="form-control" id="compagnia">
                            <option>---</option>
                        </select>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipologia Tratta</label>
                        <select class="form-control" id="tipotratta">
                            <option>---</option>                         
                        </select>
                </div>
                <div class="form-group">
                    <label for="tratta">Tratta</label>
                        <select class="form-control" id="tratta">
                            <option>---</option>                           
                        </select>
                </div>
                <button type="button" class="btn btn-warning" onclick="visualizzaOrari();">Visualizza Orari</button>
            </form>
        </div>  
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Orari</div>

            <!-- Table -->
            <table class="table" id="orari">               
            </table>
        </div>    
    </body>
</html>
