 <%-- 
    Document   : header
    Created on : 29 May, 2021, 10:40:38 PM
    Author     : HP
--%>

<%@page import="com.beans.User"%> 

 
<%--<img src="../<%=((User) session.getAttribute("user")).getPic()%>" style="float: right;width:80px;height: 100px ">  
<h2> Welcome <%=((User) session.getAttribute("user")).getName()%>'s Dashboard</h2>
--%>

 
 
<img src="../${user.pic}" style="float: right;width:80px;height: 100px ">  
<h2> Welcome ${user.name}'s Dashboard <br/></h2>

 
