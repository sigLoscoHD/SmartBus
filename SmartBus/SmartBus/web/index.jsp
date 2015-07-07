<%-- 
    Document   : index
    Created on : 6-lug-2015, 12.09.06
    Author     : Matteo
--%>

<%@page import="database.DBQuery"%>
<%@page import="database.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--JQuery JQueryUI-->
        <script src="javascript/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="javascript/jquery-ui.min.js" type="text/javascript"></script>
        <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSnavbar.css" rel="stylesheet" type="text/css"/>
        <link href="css/CSSindex.css" rel="stylesheet" type="text/css"/>
        <script src="javascript/controllo.js" type="text/javascript"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    </head>
    <body> 
        <script>
            $("#ok-reg").addClass("in");
                    window.setTimeout(function() { $("#ok-reg").alert('close'); }, 2000); 
            $("#err-reg").addClass("in");
                    window.setTimeout(function() { $("#err-reg").alert('close'); }, 2000); 
            $("#err-mail").addClass("in");
                    window.setTimeout(function() { $("#err-mail").alert('close'); }, 2000);
        </script>
        <%
             
            
            ServletContext context = pageContext.getServletContext();
 
            Cookie[] cookies = request.getCookies();

            if (cookies != null){
                for(int i = 0; i < cookies.length; i++) { 
                    Cookie c = cookies[i];		    
                    if (c.getName().equals("log")){
                        Utente ucookie = DBQuery.DB_Login_ByCookie(c.getValue(),context);
                        session.setAttribute("loggato", ucookie);
                    }
                }
            }

            Utente sesuser = (Utente) session.getAttribute("loggato");
            
            if(sesuser!=null){
		response.sendRedirect("Home.jsp");
	}
            String mex=request.getParameter("mex");
            
            if(mex!=null){
                if(mex.equals("okreg")){
                out.print("<div id='ok-reg'class='alert alert-success' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Registrazione avvenuta!</strong> Ora è possibile effettuare il login</div>");
                
                }
                if(mex.equals("errreg")){
                out.print("<div id='err-reg'class='alert alert-danger' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore: </strong> Registrazione non andata a buon fine</div>");
                }
                if(mex.equals("email")){
                out.print("<div id='err-mail'class='alert alert-danger' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><strong>Errore: </strong> Email già utilizzata da un altro utente!</div>");
                }
            }
           
        %>
        <div class="jumbotron">
            <h1>SmartBus</h1>
            <p id="slogan">Accedi, acquista, viaggia!</p>
            <p><a id="learn-more" class="btn btn-warning btn-lg" href="#" role="button" data-toggle="modal" data-target="#login-modal">Learn more</a></p>
        </div>
               
        <div id="navbar" class="navbar navbar-default navbar-fixed-top"  >
            <div class="container">
                <div class="navbar-header">
                    <a id="brand" class="navbar-brand" href="index.html">SmartBus</a>
                </div>
                <div id="login-container">
                    <ul class="nav pull-left">
                        <li class="divider-vertical"></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown" style="color: #e7aa08;">
                                Login<strong class="caret"></strong>
                            </a>
                            <div id="login" class="dropdown-menu dropdown" style="padding: 15px; padding-bottom: 10px;">
                                <form action="login.jsp" method="post" accept-charset="UTF-8">
                                    <input id="user_username" style="margin-bottom: 15px;" type="text" name="user" size="30" />
                                    <input id="user_password" style="margin-bottom: 15px;" type="password" name="pass" size="30" />
                                    <input id="user_remember_me" style="float: left; margin-right: 10px;" type="checkbox" name="ck" />
                                    <label class="string optional" for="user_remember_me"> Remember me</label>
                                    <input class="btn btn-warning" style=" clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
                                </form>
                            </div>
                        </li>
                    </ul>
                    <button id="signup" type="button" class="btn btn-warning  navbar-btn" data-toggle="modal" data-target="#myModal">Sign up</button>    
                </div>
            </div>
        </div>       
        <!-- SignUp Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Registrati</h4>
                    </div>
                    <div class="modal-body">         
                        <form action="registrazione.jsp" method="POST" role="form">
                            <div class="form-group">
                                <label for="email">Nome:</label>
                                <input type="text" class="form-control" required id="nome" name="nome">
                            </div>
                            <div class="form-group">
                                <label for="email">Cognome:</label>
                                <input type="text" class="form-control" required id="cognome" name="cognome"/>
                            </div>
                            <div class="form-group">
                                <label for="email">Email address:</label>
                                <input type="email" class="form-control" required id="email" name="email"/>
                            </div>
                            <div class="form-group">
                                <label for="sesso">Sesso:</label><br/>
                                <label class="radio-inline">
                                    <input type="radio" id="sesso" value="M" required checked name="sesso"/> M
                                </label>
                                <label class="radio-inline">
                                    <input type="radio"  id="sesso" value="F" required name="sesso"/> F
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" required id="pass" name="password"/>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Ripeti password:</label>
                                <input type="password" class="form-control" required id="npass" name="npassword"/>
                                <br>
                                <input type="submit" class="btn btn-warning" onclick="return controllo();" value="Registrati">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--info Modal -->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Info</h4>
                    </div>
                    <div class="modal-body">
                        <p><strong>SmartBus</strong> è un’applicazione per acquisto di biglietti per il trasporto pubblico, a cui si può accedere mediante l’utilizzo di uno smartphone oppure via web con l’utilizzo di un qualsiasi terminale.</p>
                        <p>L’applicazione è un innovativo sistema di gestione degli autobus che consente agli utenti di accedere ad uno strumento con cui acquistare il biglietto per la tratta desiderata dove e quando si vuole. </p>
                        <p>SmartBus può risolvere ogni bisogno richiesto dagli utenti per rendere il viaggio, il più confortevole possibile. </p><br/>
                        <p><strong>PERCHE’ USARE SmartBus?</strong></p>

                        <p><strong>FACILITA’ DI ACQUISTO BIGLIETTO/ABBONAMENTO</strong>: SmartBus possiede due tipi di interfaccia; una con cui l’utente può acquistare il biglietto online identificato da un codice univoco o qr code. La seconda interfaccia permette di acquistare e pagare abbonamenti.</p>

                        <p><strong>VISUALIZZAZIONE STATO CORSA</strong>: L’applicazione, utilizzando la tecnologia GPS, è in grado di individuare l’esatta posizione del bus ricercato con relativo calcolo di eventuali ritardi alle fermate.</p>

                        <p><strong>ORARI E TRATTE IN TEMPO REALE</strong>: SmartBus è dotata di un’interfaccia con l’elenco degli orari e tratte dei vari bus aggiornate in tempo reale.</p>

                        <p><strong>VISUALIZZAZIONE COMFORT</strong>: attraverso l’uso di sensori, SmartBus, per ogni bus, indica in valore percentuale, il livello di comfort in tempo reale.</p>

                        <p><strong> AGGIORNAMENTO SU IMPREVISTI</strong>: Se si verificano incidenti, scioperi o qualsiasi evento che porta ad un anomalia nella corsa, l’utente riceve una notifica sul proprio smartphone.</p>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
