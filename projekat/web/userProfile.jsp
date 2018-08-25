<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Transakcija"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%
    int status = 0;
    if(session.getAttribute("status") != null){
        status = (Integer)session.getAttribute("status");
    }
    String logged = null;
    if(session.getAttribute("logged") != null){
        logged = (String)session.getAttribute("logged");
    }   
     User user = null;
    if(session.getAttribute("profileUser") != null){
        user = (User)session.getAttribute("profileUser");
    }   
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
                background-image: url(profile.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
            div{
                width: 180px;
                border: 1px solid white;
                background-color: black;
                color: white;
                padding: 10px;
                margin-top: 3px;
            }
            #preth{
                position: absolute;
                top: 3px;
                left: 210px;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Profil:</h3>
            <form method="post" action="changeUser">
                Korisničko ime:<input type="text" name="user" value="${sessionScope.profileUser.username}" required><br>
                Lozinka:<input type="text" name="password" value="${sessionScope.profileUser.password}" required><br>
                Stanje na računu:<input type="text" name="balance" value="${sessionScope.profileUser.balance}" required><br><br>
                <input onclick="if(!(confirm('Potvrdite izmenu podataka.')))return false" type="submit" value="Izmeni podatke">
                <a href="glavna.jsp"><input type="button" value="Nazad"></a><br><br>
                <c:if test="${2 != status}">
                    <a onclick="if(!(confirm('Da li ste sigurni da zelite da obrisete profil?')))return false" href="deleteUser?userId=${sessionScope.profileUser.id}"><input type="button" value="Obriši profil"></a>
                </c:if> 
            </form>
        </div>
            <div id="preth">
                Prethodne kupovine:
                <c:if test="${!sessionScope.transList.isEmpty()}">
                    <ul>
                        <c:forEach items="${sessionScope.transList}" var="t">
                            <li>${t.products}   ${t.sum}$</li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>    
    </body>
</html>
