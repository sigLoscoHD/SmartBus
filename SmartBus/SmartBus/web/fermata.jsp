<%-- 
    Document   : fermata
    Created on : 10-lug-2015, 16.59.40
    Author     : B I G
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="database.Fermata"%>
<%@page import="database.DBQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
int tratta=Integer.parseInt(request.getParameter("tratta"));
ServletContext context = pageContext.getServletContext();
        
ArrayList <Fermata> fermata=DBQuery.getFermata(tratta, context);    
JSONObject obj = new JSONObject();
for(int i=0;i<fermata.size(); i++){    
    obj.put(fermata.get(i).orario,fermata.get(i).nome_fermata);
    out.flush();     
}  
out.print(obj);
       
%>
