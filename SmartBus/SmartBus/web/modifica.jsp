<%-- 
    Document   : modifica
    Created on : 8-lug-2015, 10.55.40
    Author     : Matteo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.DBQuery"%>
<%@page import="database.Utente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ServletContext context = pageContext.getServletContext();
            Utente sesuser=null;
            sesuser=(Utente) session.getAttribute("loggato");

	if(sesuser==null){
		   response.sendRedirect("index.jsp");
	}
	
            String nome=request.getParameter("nome");
            String cognome=request.getParameter("cognome");
            String data=request.getParameter("data");
            String residenza=request.getParameter("residenza");
            String luogonas=request.getParameter("luogonas");
	
	int i=DBQuery.UPDATE_utente(nome, cognome, data, residenza, luogonas,sesuser.id,context);
	 
	 if(i>0)
            {
		 
		 sesuser.setNome(nome);
		 sesuser.setCognome(cognome);
		 sesuser.setDatanascita(data);
		 sesuser.setLuogonascita(luogonas);
		 sesuser.setResidenza(residenza);
                 
            }
	  
        %>
    </body>
</html>
