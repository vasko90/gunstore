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
                background-image: url(images.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
            div{
                width:300px;
                position: absolute;
                top: 15px;
                left: 15px;
                color: white;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Kupovina je uspešno izvršena!</h1>
            <a href="glavna.jsp"><input type="button" value="Nazad"></a>
        </div>
    </body>
</html>
