<%-- 
    Document   : logout
    Created on : 6-lug-2015, 11.31.44
    Author     : B I G
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        Cookie[] cookies = request.getCookies();

        if (cookies != null){
                for(int i = 0; i < cookies.length; i++) { 
                    Cookie c = cookies[i];		    
                    if (c.getName().equals("log")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
        }

        session.setAttribute("loggato", null);
        response.sendRedirect("index.jsp");
    %>
    </body>
</html>
