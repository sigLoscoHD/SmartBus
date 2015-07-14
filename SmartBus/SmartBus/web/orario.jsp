<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="database.Orario"%>
<%@page import="database.DBQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ServletContext context = pageContext.getServletContext();
 
int tratta=Integer.parseInt(request.getParameter("tratta"));
 
ArrayList <Orario> aorario = DBQuery.getOrari(tratta, context);

JSONObject container = new JSONObject();
container.put("result", new JSONArray());

for(int i=0; i<aorario.size();i++){
    JSONObject json = new JSONObject();
    
    json.put("id_orario",String.valueOf(aorario.get(i).id_orario));
    json.put("orario",String.valueOf(aorario.get(i).orario));
    json.put("fermata",String.valueOf(aorario.get(i).fermata));
    json.put("corsa",String.valueOf(aorario.get(i).corsa));
    json.put("ar",String.valueOf(aorario.get(i).ar));
    json.put("tratta",String.valueOf(aorario.get(i).tratta));
    
    ((JSONArray) container.get("result")).add(i, json);
    
    out.flush();
}

out.print(container);
        



 
%>