<%-- 
    Document   : login
    Created on : 6-lug-2015, 10.35.13
    Author     : B I G
--%>

<%@page import="database.DBQuery"%>
<%@page import="database.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <% 
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");	
	String ck = request.getParameter("ck");
	
	ServletContext context = pageContext.getServletContext();
	
	Utente sesuser = (Utente) session.getAttribute("loggato");
	
	boolean loggato = false;

	Utente ut = null;
	
	if (sesuser == null){
		ut = DBQuery.DB_Login(user , pass, context);
		
		if (ut != null){ 				 
			
			loggato = true;
			
			session.setAttribute("loggato", ut);
			sesuser=ut;
			
			if (ck != null){
                            Cookie c = new Cookie("log", ut.email);
			    c.setMaxAge(24*60*60);
			    response.addCookie(c); 
			}
		}
		else{
			response.sendRedirect("index.jsp?mex=errlog");
		}
	}	
	else{
            loggato = true;
            ut = sesuser;			
	}
	
	if(loggato==true){		
		String ruolo = sesuser.ruolo;
		
		if(ruolo.equals("admin")){
			response.sendRedirect("AdministratorPage.jsp");
		}
		else{
			response.sendRedirect("Home.jsp");
		}
	}
    %>
    </body>
</html>
