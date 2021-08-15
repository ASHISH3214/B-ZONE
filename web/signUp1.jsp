<%-- 
    Document   : signUp1
    Created on : 29 May, 2021, 10:13:02 AM
    Author     : HP
--%>

<%@page import="com.daos.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Category"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Stand CSS Blog by TemplateMo</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="assets/css/owl.css">
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

-->
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
                categories = document.getElementsByName("category");
                for(x=0;x<categories.length;x++)
                {
//                    alert(genders[x].value);
                    if(categories[x].checked)
                        h++;
                        
                }
                if(h==0){
                    alert("Select atleast one category");
                    status=false;         
        }
                return status;
        
       }
       
       function checkUserId(userid,span) {
          // document.getElementById("userspan").innerHTML="DONE";
           xml = new XMLHttpRequest();
           xml.open("GET","BloggerController?op=checkuserid&userid="+userid,true);
           xml.send();
           
           xml.onreadystatechange=function(){
               if(this.readyState==4 && this.status==200){
                   span.innerHTML=this.responseText; 
               }
           };
           
         }
            
        </script>
  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <!--include header-->
    <jsp:include page="header.jsp"></jsp:include>
  

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
          
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

   


    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="all-blog-posts">
              <div class="row">
                 <!--change the following contents--> 
                 
                 <div class="col col-md-12 col-sm-12" style="text-align: center;" >
             <h2 class="bg-secondary text-white" > Blogger Registration Form </h2>
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
            <td>Enter Contact Number</td>
            <td><input type="text" name="contact" id="contact" required class="form-control"/></td>
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
            <td>Select Categories</td>
        <td>
            <%
                ArrayList<Category> clist = new CategoryDao().getAllCategories();
                for(Category c: clist){%>
                
                <div class="col-md-12"><input type="checkbox" name="category" value="<%=c.getId()%>" class="form-check-input"/><%=c.getName()%></div>
            <%}%>
            </td>
            
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
                
                  
                
                
              </div>
            </div>
          </div>
          
            
        
        </div>
      </div>
    </section>

        <jsp:include page="footer.jsp"></jsp:include>
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>
