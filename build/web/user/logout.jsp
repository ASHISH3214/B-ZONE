<%-- 
    Document   : logout
    Created on : 29 May, 2021, 8:32:28 PM
    Author     : HP
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
           session.removeAttribute("user");
           response.sendRedirect("../login.jsp");
        %>
    </body>
</html>
