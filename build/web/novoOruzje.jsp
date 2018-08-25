<% 
    int status = (Integer)session.getAttribute("status");
    String logged = (String)session.getAttribute("logged");
    if(2 != status && !"1".equals(logged)){
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
            .form{
                width:200px;
                margin: auto;
                border: 1px solid white;
                color: white;
                background-color: black;
                padding: 3px;
                margin-top: 130px;
            }
            body{
                margin: 0;
                padding: 0;
                background-image: url(gunswall.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <div class="form">
        <form action="newWeapon" method="post" enctype="multipart/form-data">
            <label for="name">Naziv</label><br>
            <input type="text" name="name" id="name" required><br>
            <label >Vrsta oružja</label><br>
            <input type="radio" name="type" value="puska" required>Puška<br>
            <input type="radio" name="type" value="pistolj" required>Pištolj<br>
            <input type="radio" name="type" value="sacmara" required>Sačmara<br>
            <input type="radio" name="type" value="noz" required>Nož<br>
            <label >Količina</label><br>
            <input type="number" name="count" required><br>
            <label >Cena</label><br>
            <input type="number" name="price"required><br>
            <label >Kalibar</label><br>
            <input type="text" name="caliber" required><br>
            <label >Slika</label><br>
            <input type="file" name="picture" required><br><br>
            <input type="submit" value="Unesi">
            <a href="glavna.jsp"><input type="button" value="Nazad"></a>
        </form>
        
        </div>
    </body>
</html>
