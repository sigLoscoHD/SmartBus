<%-- 
    Document   : compagnia
    Created on : 8-lug-2015, 10.52.05
    Author     : B I G
--%>


<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DBQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <%
        ServletContext context = pageContext.getServletContext();
        
        String citta=request.getParameter("citta");
        ArrayList <String> compagnia=DBQuery.getCompagnia(citta, context);    
        JSONObject obj = new JSONObject();
        for(int i=0;i<compagnia.size();i++){    
            obj.put("compagnia"+i,compagnia.get(i));
            out.flush();
            
        }  
        out.print(obj);
        %>
   
