<%-- 
    Document   : prezzourbano
    Created on : 16-lug-2015, 12.10.10
    Author     : Matteo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.*"%>
<%
    ServletContext context = pageContext.getServletContext();
      
    String tipo=request.getParameter("tipo");
    if(tipo.equals("Urbana")){
    String citta=request.getParameter("citta");
    String compagnia=request.getParameter("compagnia");
    BigliettoUrbano bu=DBQuery.getPrezzoUrbano(citta, compagnia, context);
    out.print("Il prezzo del biglietto è di " + bu.prezzo);
    }
    if(tipo.equals("Extra-urbana")){
        String tratta=request.getParameter("tratta");
        String compagnia=request.getParameter("compagnia");
        BigliettoExtra be=DBQuery.getPrezzoExtra(tratta, compagnia, context);
        out.print("Il prezzo del biglietto è di " + be.prezzo);
    }
  
  
%>
