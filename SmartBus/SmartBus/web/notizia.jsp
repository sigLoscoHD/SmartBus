

<%@page import="database.DBQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ServletContext context = pageContext.getServletContext();

    String testo=request.getParameter("testo");
    String data=request.getParameter("data");
    String ora=request.getParameter("ora");
    
    int i =DBQuery.pubblicaNotizia(testo, data, ora, context);
%>