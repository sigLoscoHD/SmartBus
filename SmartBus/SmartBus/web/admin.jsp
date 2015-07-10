<%-- 
    Document   : admin
    Created on : 10-lug-2015, 11.11.44
    Author     : Matteo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.Utente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
         <!--JQuery JQueryUI-->
        <script src="javascript/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="javascript/jquery-ui.min.js" type="text/javascript"></script>
        <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <!--page CSS -->
        <link href="css/CSSnavbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSadmin.css" rel="stylesheet" type="text/css"/>
        <title>Amministratore</title>
    </head>
    <body>
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
         
         <div id="input-bacheca">
             <h3>Ciao <%out.print(sesuser.nome);%>, ci sono novità?</h3>
            <div class="form-group">
                <textarea class="form-control" rows="3" cols="60" id="notizia"></textarea>
                <br>
                <input type="submit" class="btn btn-warning"  value="Pubblica" id="pubblica" onclick="pubblica_post();">
            </div>
         </div>
         <div id="bacheca">
             <div>
                 <h6>20/07/2015 08:30</h6>
                 <div>Oggi sciopero generale dei pullman a San Benedetto del Tronto!</div>
             </div>
         </div>
         
    </body>
</html>
