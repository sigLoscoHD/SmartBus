<%-- 
    Document   : abbonamento
    Created on : 16-lug-2015, 15.15.46
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
    AbbonamentoUrbano au=DBQuery.getAbbonamentoUrbano(citta, compagnia, context);
    out.print("Il prezzo del biglietto è di " + au.prezzo);
    }
    if(tipo.equals("Extra-urbana")){
        String tratta=request.getParameter("tratta");
        String compagnia=request.getParameter("compagnia");
        AbbonamentoExtra ae=DBQuery.getAbbonamentoExtra(tratta, compagnia, context);
        out.print("Il prezzo del biglietto è di " + ae.prezzo +  " €");
    }
  

%>
