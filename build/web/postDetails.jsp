<%-- 
    Document   : postDetails
    Created on : 15 Jun, 2021, 11:19:19 AM
    Author     : HP
--%>

<%@page import="com.beans.Category"%>
<%@page import="com.daos.BloggerDao"%>
<%@page import="com.beans.Blogger"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Manit BLOG</title>

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
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                 <!--change the following contents--> 
                  <%  
                      String id = request.getParameter("id");
                      BlogDao bd = new BlogDao();
                      Blog blog = bd.getBlogDetailById(Integer.parseInt(request.getParameter("id")));
                      session.setAttribute("blog", blog);
                  %>
                  
                     <%
                int bid = blog.getId();
                BlogDao b = new BlogDao();
                ArrayList<Category> clist = b.getCategoriesByBlogId(bid);
                 %>
                 
                 <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                        <img src="<%=blog.getPoster()%>" style="width: 100%;height: 300px" alt="">
                    </div>
                    <div class="down-content">
                      
                      <a href="#"><h4><%=blog.getTitle()%></h4></a>
                      <ul class="post-info">
                          <li><a href="#"><%=(new BloggerDao().getById(blog.getBloggerId()).getName())%></a></li>
                        <li><a href="#"><%=blog.getDate()%></a></li>
                        <li><a href="#">12 Comments</a></li>
                      </ul>
                      <p style="text-align: justify;"><%=blog.getDescription()%> 
                          <br/>
                          <a rel="nofollow" href="index.jsp" target="_parent" class="btn btn-success">Back to home</a></p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                               <li><a href="#"> <%for(Category c : clist) {%>
                                              <li> <%=c.getName()%> </li>,
                                                        <%}%></a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="https://www.facebook.com/login/">Facebook</a>,</li>
                              <li><a href="https://twitter.com/login?lang=en-gb"> Twitter</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                  
                
                <div class="col-lg-12">
                  <div class="main-button">
                    <a href="blog.html">View All Posts</a>
                  </div>
                </div>
                 
              </div>
            </div>
          </div>
          
            
        <jsp:include page="sidebar1.jsp"></jsp:include>
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
