<%-- 
    Document   : test3
    Created on : 17 Jul, 2021, 12:15:01 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/jQuery.min.js"></script>
    </head>
    <body>
        <h1>Append,prepend</h1>
        
        Enter some text :
        <input type="text" id="t1"/>
        <br/>
        <input type="button" id="b1" value="append"/>
        <input type="button" id="b2" value="prepend"/>
        <p style="width: 300px; height: 50px;border-style: solid;border-width: 2px; " id="p1">
            
            
        </p>
        
        
        
        <script>
           $("#b1").click(function() {
               $("#p1").append($("#t1").val());
    
         }); 
         $("#b2").click(function() {
               $("#p1").prepend($("#t1").val());
    
         }); 
        </script>
            
    </body>
</html>
