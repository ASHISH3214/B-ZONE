<%-- 
    Document   : dashboard
    Created on : 29 May, 2021, 6:05:52 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="../assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>

    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            if(user==null){
                response.sendRedirect("error.jsp");
                return;
            }
        %>
        
        <!--
        <h2>WelCome to <%=user.getName()%>'s DashBoard </h2>
        <br/>
        <a href="logout.jsp">Logout</a>
        -->    
        
        <table class="table" style="width: 100%;height: 100vh" border='2px' >
            <tr>
                <td style="height: 15%" colspan="2">
                    <jsp:include page="header.jsp"></jsp:include>
                </td>
                
            </tr>            
            <tr>
                <td style="height: 80%; width:200px ">
                <jsp:include page="sidebar.jsp"></jsp:include>
                </td>
                <td>
                    <div id="main">
                        <h2>DASHOARD</h2>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="font-size: 10px;height: 5%;background-color: black;color: white;" colspan="2">
                <jsp:include page="fotter.jsp"></jsp:include>
                </td>
            </tr>
        </table>
        
</body>
</html>
