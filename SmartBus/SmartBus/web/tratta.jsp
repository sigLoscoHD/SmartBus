<%-- 
    Document   : tratta
    Created on : 10-lug-2015, 12.43.40
    Author     : B I G
--%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DBQuery"%>
<%@page import="database.Tratta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ServletContext context = pageContext.getServletContext();
        
        int compagnia=Integer.parseInt(request.getParameter("compagnia"));
        String tipo=request.getParameter("tipo");
        ArrayList <Tratta> tratta=DBQuery.getTratta(compagnia, tipo, context);
        JSONObject obj = new JSONObject();
        for(int i=0;i<tratta.size();i++){    
            obj.put(tratta.get(i).id,tratta.get(i).nomeTratta);
            out.flush();     
        }  
        out.print(obj);
%>