<%-- 
    Document   : Home
    Created on : 6-lug-2015, 11.41.57
    Author     : B I G
--%>

<%@page import="database.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOME</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <link href="css/CSShome.css" rel="stylesheet" type="text/css"/>
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
                    <a>
                        <button id="notizie" type="button" class="btn btn-warning navbar-btn">
                            <span class="glyphicon glyphicon-inbox" aria-hidden="true"></span> Notizie
                        </button> 
                    </a>
                    <a href="logout.jsp"><button id="logout" type="button" class="btn btn-warning navbar-btn">Logout</button></a>           
                </div>
            </div>
        </div>
        
        <div id="benvenuto">
            <span>Benvenuto <%out.print(sesuser.nome);%>, da qui puoi accedere alle funzionalità del sito</span>
        </div>
        
        <div id="acquista" class="jumbotron">
            <h1>Acquista</h1>
            <p id="slogan">Acquista ora con un click!</p>
            <p><a id="learn-more" class="btn btn-warning btn-lg" href="acquista.jsp" role="button">Vai a: Acquista</a></p>
        </div>
        
        <div id="visualizza" class="jumbotron">
            <h1>Tratte e Orari</h1>
            <p id="slogan">Visualizza tratte e orari dei bus che ti interessano!</p>
            <p><a id="learn-more" class="btn btn-warning btn-lg" href="visualizza.jsp" role="button">Vai a: Visualizza Tratte Orari</a></p>
        </div>
    </body>
</html>
