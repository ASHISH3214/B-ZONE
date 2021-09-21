<%-- 
    Document   : signUp2
    Created on : 29 May, 2021, 10:16:50 AM
    Author     : HP
--%>

<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
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
                 
        <jsp:useBean id="blogger" class="com.beans.Blogger" scope="session"></jsp:useBean>
        <jsp:setProperty name="blogger" property="*"></jsp:setProperty>
        
        <% 
           blogger.setName(StringEscapeUtils.escapeHtml(blogger.getName()));
           blogger.setPassword(java.util.Base64.getEncoder().encodeToString(blogger.getPassword().getBytes()));
          
               String[] categories = request.getParameterValues("category");
              session.setAttribute("categories", categories);
              session.setAttribute("blogger", blogger);
            %>
        <div class="navbar bg-secondary text-white" >
             <h2> Upload profile Picture </h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col col-md-12 col-sm-12 col-lg-12">
                    <center>
                        <form action="BloggerController?op=add" method="post" enctype="multipart/form-data">
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

