<%-- 
    Document   : signUp1
    Created on : 29 May, 2021, 10:13:02 AM
    Author     : HP
--%>


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
                
                for(x=0;x<genders.length;x++)
                {
//                    alert(genders[x].value);
                    if(genders[x].checked)
                        g++;
                        
                }
                if(g==0)
                {
                    alert("Select gender");
                    status=false;
                }
               
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
       
       function checkUserId(userid,span) {
          // document.getElementById("userspan").innerHTML="DONE";
           xml = new XMLHttpRequest();
           xml.open("GET","UserController?op=checkuserid&userid="+userid,true);
           xml.send();
           
           xml.onreadystatechange=function(){
               if(this.readyState==4 && this.status==200){
                   span.innerHTML=this.responseText; 
               }
           };
           
         }
            
        </script>
        <style>
            
           
            body{
                font-size: 20px; 
                font-family: corbel;
                
            }
            input{
                text-transform: uppercase;
            }
        </style>
    </head>
    <body>
       <div class="navbar bg-secondary text-white" >
             <h2> User Registration Form </h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col col-md-12 col-sm-12 col-lg-12">
             
        <center>             
        <form action="signUp2.jsp" method="post" onsubmit="return validateform()" class="form-group">
        <table class=" table">
        <tr>
            <td>Enter Name</td>
            <td><input type="text" name="name" id="name" required  class="form-control"/></td>
        </tr>    
        <tr>
            <td>Enter Age</td>
            <td><input type="number" name="age" id="age" min="18" max="50" required class="form-control"/></td>
        </tr>
        <tr>
            <td>Enter UserID<br/>(it must be your Email_id)</td>
            <td><input type="email" name="userid" id="userid" required onchange="checkUserId(this.value,userspan);" class="form-control" class="form-control"/>
                <br/> <span id="userspan"></span></td>
        </tr>
        <tr>
            <td>Enter Password<span style="font-size: 15px"> (Password must include (UpperCase, LowerCase and Number))</span></td>
            <td><input type="password" name="password" id="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required class="form-control"/></td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td><input type="password" name="cpassword" id="cpassword" required class="form-control"/>
                <span style="color:red; font-weight: bold; font-size: 12px " id="cspan"></span>
            </td>
        </tr>
        <tr>
            <td>Select Gender</td>
            <td><input type="radio" name="gender" id="gen1" value="male" class="form-check-input" />Male <br/>
                <input type="radio" name="gender" id="gen2" value="female" class="form-check-input"/>Female<br/>
            </td>
        </tr>
        <tr>
            <td>Select Hobbies</td>
            
            <td><input type="checkbox" name="hobbies" value="play"class="form-check-input"  />Play<br/>
            <input type="checkbox" name="hobbies" value="dancing" class="form-check-input" />dancing<br/>
            <input type="checkbox" name="hobbies" value="singing" class="form-check-input" />singing<br/>
            <input type="checkbox" name="hobbies" value="cooking" class="form-check-input"/>cooking<br/></td>
        </tr>
        <tr>
            <td><input type="reset" value="Clear All" name="reset" id="reset" class="btn btn-danger"/></td>
            <td><input type="submit" value="Next Page" name="submit" id="submit" class="btn btn-primary"/></td>
        </tr>
    
        
    </table>
    </form>
          </center>  
        
                    </div>
                </div>
            </div>
            
          </body>
</html>
