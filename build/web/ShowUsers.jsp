<%-- 
    Document   : ShowUsers
    Created on : 15 May, 2021, 8:12:26 PM
    Author     : HP
--%>
      

<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.UserDao"%>
<%@page import="com.db.DataConnection"%>
<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet">
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 
        <style>
            a{
                text-decoration: none;
            }
        </style>
        
        <script>
            function show(){
                if(confirm("do you want to delete? "))
                    return true;
                else
                    return false;
            }
            
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col col-sm-12 col-md-12">
        <h1>List Of Users</h1>
        <br/>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Userid</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Hobbies</th>
                <th>Pic</th>
                <th>Operations</th>
            </tr>
            <%
                UserDao ud = new UserDao();
                ArrayList<User> userlist = ud.getAllRecords();
                for(User user : userlist){%>
                
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getUserid()%></td>
                    <td><%=user.getAge()%></td>
                    <td><%=user.getGender()%></td>
                    <td><%=user.getHobbies()%></td>
                    <td><img src="<%=user.getPic()%>" style="width: 60px;height:80px;"/></td>
                    <td>
                        <a href="UpdateUser.jsp?id=<%=user.getId()%>" class="btn btn-success">Edit</a>
                        <a href="UserController?op=delete&id=<%=user.getId()%>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <%}%>
                
        </table>
         <br/><br/>
            <a href="signUp1.jsp" class=" btn btn-primary">Add more Record</a>
            </div>
            </div>
            </div>
        </body>  
</html>
