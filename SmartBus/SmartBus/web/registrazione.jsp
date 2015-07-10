<%-- 
    Document   : registrazione
    Created on : 6-lug-2015, 15.09.35
    Author     : Matteo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.DBQuery"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrazione</title>
    </head>
    <body>
       <%

	ServletContext cont = pageContext.getServletContext();

    	String nome=request.getParameter("nome");
    	String cognome=request.getParameter("cognome");
    	String email=request.getParameter("email");
    	String sesso=request.getParameter("sesso");
    	String password=request.getParameter("password");
    	
    	ServletContext context = pageContext.getServletContext();
   	
    	String dbemail=DBQuery.check_email(email, cont);
    	
    	if(dbemail.equals("")){
            int i=DBQuery.registrazione(nome, cognome, email, password, sesso, context);

            if(i>0){
                response.sendRedirect("index.jsp?mex=okreg");
            }
            else{
                response.sendRedirect("index.jsp?mex=errreg");
            }
	}
    	else{
            response.sendRedirect("index.jsp?mex=email");
    	}
    	%>
    </body>
</html>
