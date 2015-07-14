<%-- 
    Document   : visualizzaNotizie
    Created on : 14-lug-2015, 16.31.49
    Author     : B I G
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.Notizia"%>
<%@page import="database.DBQuery"%>
<%@page import="database.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notizie</title>
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
        <link href="css/CSSvisualizzaNotizie.css" rel="stylesheet" type="text/css"/>
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
                    <a style="text-decoration: none;" href="visualizzaNotizie.jsp">
                        <button id="notizie" type="button" class="btn btn-warning navbar-btn">
                            <span class="glyphicon glyphicon-inbox" aria-hidden="true"></span> Notizie
                        </button>                     
                    </a>    
                    <a href="logout.jsp">
                        <button id="logout" type="button" class="btn btn-warning navbar-btn">
                            Logout
                        </button>
                    </a>     
                    
                </div>
            </div>
        </div>
        <div id="bacheca">
             <%
             ArrayList <Notizia> anotifiche = DBQuery.visualizzaNotizie(context);
             for(int i=0;i<anotifiche.size();i++){
             %>
             <div class='notizia'>
                 <h6 id='data'><%out.print(anotifiche.get(i).data+" "+anotifiche.get(i).ora);%></h6>
                 <div id='testo'><%out.print(anotifiche.get(i).testo);%></div>                   
             </div>
             <%
             }
             %>
         </div>      
    </body>
</html>
