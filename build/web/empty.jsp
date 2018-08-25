<% 
    
    String logged = (String)session.getAttribute("logged");
    if(!"1".equals(logged)){
        response.sendRedirect("glavna.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
             body{
                margin: 0;
                padding: 0;
                background-image: url(warning2.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
             div{
                width: 250px;
                margin: auto;
                background-color: transparent;
                margin-top: 130px;
                padding: 5px;
                color: white;
            }
             i{
                color: red;
                margin-right: 100px;
                font-size: 30px;
            }
        </style>
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    </head>
    <body>
        <div>
        <i class="fas fa-exclamation-triangle"></i>
        <h1>${oruzje} nemamo više na lageru.</h1>
        <a href="glavna.jsp"><input type="button" value="Nazad"></a>
        </div>
    </body>
</html>
