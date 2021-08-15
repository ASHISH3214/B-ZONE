<%-- 
    Document   : profilepic
    Created on : 30 May, 2021, 1:11:28 AM
    Author     : HP
--%>


<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="../assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
         
         <script>
        function readURL(input) {
            if(input.files && input.files[0]){
                var reader = new FileReader();
                
                reader.onload = function (e) {
                    preview.src = e.target.result;
                };
                
                reader.readAsDataURL(input.files[0]);
    
           }            
       }
          
  
    </script>
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
                    <jsp:setProperty name="user" property="*"></jsp:setProperty>
        
        <% 
              
              user.setName(StringEscapeUtils.escapeHtml(user.getName()));
              user.setPassword(StringEscapeUtils.escapeHtml(request.getParameter("password")));
              user.setPassword(java.util.Base64.getEncoder().encodeToString(user.getPassword().getBytes()));
              String[] hobbies = request.getParameterValues("hobbies");
              String hbs="";
        
            for(String s : hobbies){
            hbs += s +",";
        }   
             user.setHobbies(hbs);

            %>     
                          
        
        
        <div class="navbar bg-secondary text-white" >
             <h2> Upload profile Picture </h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col col-md-12 col-sm-12 col-lg-12">
                    <center>
                        <form action="UserController?op=UploadPic" method="post" enctype="multipart/form-data">
                        <img src="" id="preview" style="width: 300px; height: 400px; border-radius: 10px;border-style: solid;">
                        <br/><br/>
                        <input type="file" name="pic" id="pic" onchange="readURL(this)" class="btn btn-secondary"/>
                        <br/><br>
                        <input type="submit" name="submit" value="Proceed to save" class="btn btn-primary" />
                        
                        </form>
                    </center>
                    
                </div>
            </div>
        </div> 
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
