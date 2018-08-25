
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
                width: 200px;
                margin: auto;
                margin-top: 130px;
                border: 1px solid white;
                padding: 10px;
                color:white; 
                background-color: black;
            }
            a{
                color: red;
            }
            a:hover{
                color: green;
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
            <p>Prijavi se:</p>
            <form method="post" action="login">
                <label for="username">Korisničko ime:</label>
                <input type="text" id="username" name="username" required><br>
                <label for="password">Lozinka:</label>
                <input type="password" id="password" name="password" required><br><br>
                <input type="submit" value="Prijavi se">
            </form>
            <p>Ukoliko nemaš korisnički nalog, <a href="registracija.jsp">registruj se</a></p><br>
            <a href="glavna.jsp">Udji u prodavnicu kao gost</a>
            </form>
        </div>
    </body>
</html>
