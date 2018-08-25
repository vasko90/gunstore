

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
                background-image: url(guns.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
            #main{
                width: 170px;
                margin: auto;
                margin-top: 130px;
                border: 1px solid white;
                padding: 10px;
                color:white; 
                background-color: black;
            }
             h1{
                width: 250px;
                margin: auto;
                font-weight: bold;
                color:white;
                font-size: 40px;
            }
        </style>
    </head>
    
    <body>
          <h1>GUN STORE</h1>
        <div id="main">
        <h3>Registruj se</h3>
        
        <form method="post" action="registration">
             <label for="username">Korisničko ime:</label>
                <input type="text" id="username" name="username" required><br>
                <label for="password">Lozinka:</label>
                <input type="password" id="password" name="password" required><br>
                <label for="number" >Stanje na računu:</label>
                <input type="number" min="0" name="balance"><br><br>
                <input type="submit" name="Sačuvaj">
                <a href="pocetna.jsp"><input type="button" value="Nazad"></a>
        </form>
    </body>
</html>
