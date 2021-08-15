

<%@page import="com.daos.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>

     <script type="text/javascript">
            function validateform() {
                let status= true;
                pwd= document.getElementById("password").value;
                cpwd= document.getElementById("cpassword").value;
                
                if(pwd!==cpwd)
                {
//                    alert('Password and Confirm Password Must Be Same');
                    document.getElementById("cspan").innerHTML="Password and Confirm Password Must Be Same";        
                    status=false;
                }   
                g=0;
                genders = document.getElementsByName("gender");
                status=false;
                for(x=0;x<genders.length;x++)
                {
//                    alert(genders[x].value);
                    if(genders[x].checked)
                        status= true;
                        g++;
                        
                }
                if(!status)
                    alert("select gender");
                
                
                h=0;
                hobbies = document.getElementsByName("hobbies");
                for(x=0;x<hobbies.length;x++)
                {
//                    alert(genders[x].value);
                    if(hobbies[x].checked)
                        h++;
                        
                }
                if(h==0){
                    alert("Select atleast one hobby");
                    status=false;         
        }
                return status;
        
}
            
        </script>
        <style>
            
           
            body{
                font-size: 20px; 
                font-family: corbel;
                
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
            <div class="col col-md-12"> 
    <center>User Updation Form 
      <%
          int id = Integer.parseInt(request.getParameter("id"));
          UserDao ud = new UserDao();
          User user = ud.getByID(id);
           
      %>      
    <form class="form-group"  method="post" onsubmit="return validateform()">
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
    
    </center>
   </div>
   </div>
   </div>
        <%
            if(request.getParameter("submit") != null){%>
            <jsp:useBean id="user1" class="com.beans.User" scope="request"></jsp:useBean>
            <jsp:setProperty name="user1" property="*"></jsp:setProperty>
             
             <%
              String[] hobbies = request.getParameterValues("hobbies");
              String hbs="";
        
              for(String s : hobbies){
              hbs += s +",";
              }   
              user.setHobbies(hbs);
              RequestDispatcher rd = request.getRequestDispatcher("UserController?op=update");
              rd.forward(request, response);
            }%>
</body>   
</html>
