
<%@page import="com.daos.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Category"%>
<%-- 
    Document   : dashboard
    Created on : 5 Jun, 2021, 11:19:16 AM
    Author     : HP
--%>

<%@page import="com.beans.Blogger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Visual Blogger Dashboard - Home</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- 
    Visual Admin Template
    https://templatemo.com/tm-455-visual-admin
    -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/templatemo-style.css" rel="stylesheet">
    

  </head>
  <body>  
      <%
          Blogger blogger = (Blogger)session.getAttribute("blogger");
          if(blogger == null){
              response.sendRedirect("../blogin.jsp?errorMessage=Session Expired! please Login Again");
              return;
          }
      %>
    <!-- Left column -->
    <div class="templatemo-flex-row">
        <jsp:include page="sidebar.jsp"></jsp:include>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
      <jsp:include page="header.jsp"></jsp:include>
        <div class="templatemo-block-container">
          
            <center><h2>Add New Post</h2></center>
            <div class="form-group">
                <form action="addPost2.jsp" method="post">
                    Select category : <br/>
                    
                 
     <%
        ArrayList<Category> clist = new CategoryDao().getCategoriesByBloggerId(blogger.getId());
             for(Category c : clist){%>
                        
                        <input type="checkbox" name="category" value="<%=c.getId()%>" checked/><%=c.getName()%> <br/>
                    <% } %>
                    </div>
                    Enter Title <input type="text" name="title" class="form-control"/>
               
                    Enter Description <textarea name="description" class="form-control" rows="15" cols="20"></textarea>
                    Enter Date of Posting <input type="date" name="date" class="form-control"/>
                    
                    <input type="hidden" name="bloggerId" value="${blogger.id}"/>
                 
                <input type="submit" value="next" class="btn  btn-success"/>                    
            </form>
                
            </div>
            
          
                  
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script src="assets/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
      /* Google Chart 
      -------------------------------------------------------------------*/
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart); 
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);

          // Set chart options
          var options = {'title':'How Much Pizza I Ate Last Night'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>
