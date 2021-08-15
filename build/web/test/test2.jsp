<%-- 
    Document   : test2
    Created on : 16 Jul, 2021, 11:55:11 PM
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
        <h1>jQuery get/set!</h1>
        
        Enter first NO. : <input type="text" id="t1" name="t1"/> <br/>
        Enter Second No. : <input type="text" id="t2" name="t1"/> <br/>
        <input type="button" value="add" id="b1"/>
        <br/>
        <p style="width: 300px; height: 50px;border-style: solid;border-width: 2px; " id="p1">
           Result Will Be Shown Here 
            
        </p>
        
        <script>
            $("#b1").click(function(){
                let s = parseInt($("#t1").val()) + parseInt($("#t2").val());
                $("#p1").html("<b>Sum = " + s +"</b>");
    
         });
        </script>
            
    </body>
</html>
