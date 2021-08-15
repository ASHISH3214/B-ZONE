<%-- 
    Document   : logout
    Created on : 5 Jun, 2021, 1:18:37 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("admin");
    response.sendRedirect("../");
%>
