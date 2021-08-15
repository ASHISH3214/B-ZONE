<%-- 
    Document   : editprofile
    Created on : 29 May, 2021, 11:57:41 PM
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
        <script src="../assets/js/validation.js"></script>
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
                    
                        <form class="form-group" action="UserController?op=Edit" method="post">
        <table class="table" >
        <tr>
            <td>User,s ID</td>
            <td><input type="text" name="id" value="<%=user.getId()%>" readonly class="form-control"/></td>
        </tr>
        <tr>
            <td>Enter Name</td>
            <td><input type="text" name="name" id="name" value="<%=user.getName()%>" required class="form-control"/></td>
        </tr>    
        <tr>
            <td>Enter Age</td>
            <td><input type="number" name="age" id="age" min="18" max="50" value="<%=user.getAge()%>" required class="form-control"/></td>
        </tr>
        <tr>
            <td>Enter UserID<br/>(it must be your Email_id)</td>
            <td><input type="email" name="userid" id="userid" value="<%=user.getUserid()%>" readonly required class="form-control"/></td>
        </tr>
        <tr>
            <td>Select Gender</td>
            <td><input type="radio" name="gender" id="gen1" value="male" <%=user.getGender().equalsIgnoreCase("male")?"checked":""%> class="form-check-input"/>Male<br/>
                <input type="radio" name="gender" id="gen2" value="female" <%=user.getGender().equalsIgnoreCase("female")?"checked":""%> class="form-check-input"/>Female<br/>
            </td>
        </tr>
        <tr>
            <td>Select Hobbies</td>
            
            <td><input type="checkbox" name="hobbies" value="play" <%=user.getHobbies().contains("play")?"checked":""%> class="form-check-input"/>Play<br/>
            <input type="checkbox" name="hobbies" value="dancing" <%=user.getHobbies().contains("dancing")?"checked":""%> class="form-check-input"/>dancing<br/>
            <input type="checkbox" name="hobbies" value="singing" <%=user.getHobbies().contains("singing")?"checked":""%> class="form-check-input"/>singing<br/>
            <input type="checkbox" name="hobbies" value="cooking" <%=user.getHobbies().contains("cooking")?"checked":""%> class="form-check-input" />cooking<br/></td>
        </tr>
        <tr>
            <td></td><td><input class="btn btn-success btn-outline-light" type="submit" value="Update Record" name="submit" id="submit"/></td></tr>
    
        
    </table>
    </form>
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

