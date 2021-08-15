<%-- 
    Document   : test1
    Created on : 11 Jul, 2021, 1:31:58 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/jQuery.min.js"></script>
        <script>
            $(document).ready(function(){
             
            //$("p").hide();
            $("p").hide();
        });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <button id="b1">Show</button>
        <br/>
        <button id="b2">hide</button>
        <br/>
        <button id="b3">hide/show</button>
        
        <br/>
        <p id="p1" style="width: 200px;height: 100px;border: 2px solid blueviolet">This is first para -1</p>
        <p id="p2" style="width: 200px;height: 100px;border: 2px solid #D8D138">This is second para -2</p>
        <hr/>
        
        <button id="b4">Slide Toggle</button>
        <div id="d1" style="width: 300px;height: 200px;background-color: green;color: blanchedalmond">
            get ready to fight.<br/>
            get ready to fight.<br/>
            get ready to fight.<br/>
            get ready to fight.<br/>
        </div>
        
        <script>
            $("#b1").click(function (){
                
               $("p").show(200,function(){
                   alert("paragraph visible")});
    
                 }); 
                       
            $("#b2").click(function (){
                //alert("paregraph hidden");
               $("p").hide(200,function(){
                   alert("paragraph hidden")});
               }); 
            $("#b3").click(function() {
               //$("p").toggle(500);
               $("p").fadeToggle(500);
                          
               });
            $("#b4").click(function() {
               //$("p").toggle(500);
               $("#d1").slideToggle(500);
           });
        </script>
    </body>
</html>
