<%@page import="model.Product"%>
<%
     int status = (Integer)session.getAttribute("status");
    String logged = (String)session.getAttribute("logged");
    if(2 != status && !"1".equals(logged)){
        response.sendRedirect("glavna.jsp");
    }
    Product p = null;
    if(session.getAttribute("product") != null){
        p = (Product)session.getAttribute("product");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div{
                border: 1px solid white;
                width: 200px;
                margin: auto;
                margin-top: 130px;
                color: white;
                background-color: black;
                padding: 10px;
            }
            body{
                margin: 0;
                padding: 0;
                background-image: url(pistol.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
       <div>
        <form action="changeData" method="post" >
            <label for="name">Naziv</label><br>
            <input type="text" name="name" id="name" value="<%=p.getName()%>" required><br>
            <label >Vrsta oružja</label><br>
            <input type="radio" name="type" value="puska" required>Puška<br>
            <input type="radio" name="type" value="pistolj" required>Pištolj<br>
            <input type="radio" name="type" value="sacmara" required>Sačmara<br>
            <input type="radio" name="type" value="noz" required>Nož<br>
            <label >Količina</label><br>
            <input type="number" name="count" value="<%=p.getCount()%>" required><br>
            <label >Cena</label><br>
            <input type="number" name="price" value="<%=p.getPrice()%>" required><br>
            <label >Kalibar</label><br>
            <input type="text" name="caliber"  value="<%=p.getCaliber()%>" required><br><br>
            <input type="submit" value="Izmeni">
            <a href="chosenWeapon?type=<%=p.getType()%>"><input type="button" value="Nazad"></a>
        </form>
       </div>
    </body>
</html>
