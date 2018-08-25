<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%
    List<Product>lista = null;
    List<Product>cart = null;
    if(session.getAttribute("chosenWeapon/list") != null){
     lista = (List<Product>)session.getAttribute("chosenWeapon/list");
    }
    
     if(session.getAttribute("korpa/lista") != null){
     cart = (List<Product>)session.getAttribute("korpa/lista");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
         <style>
            body{
                margin:0;
                padding:0;
            }
            header{
                background-color: black;
                color: white;
                height: 100px;
                margin:0;
                padding: 30px;
                text-align: center;
                font-weight: bold;
                font-size: 45px;
            }
            #nav{
                list-style-type: none;
                overflow: hidden;
                padding:0;
                margin:0;
                background-color: grey;
            }
            #nav li{
                float:left;
                margin:0;
                padding:15px;
                background-color: grey;
                color: white;
                font-weight: bold;
            }
            #nav li:hover{
                background-color: white;
                color:black;
            }
            a{
                text-decoration: none;
                
            }
            secton{
                overflow: hidden;
            }
            .a1{
                 border:2px solid black;
                 float:left;
                 padding: 10px;
                 margin: 0;
                 height: 350px;
            }
            #cart{
                border: 1px solid black;
                padding: 3px;
                position: absolute;
                top: 3px;
                right: 3px;
                background-color: white;
                width: 200px;
            }
            .c{
                background-color: transparent;
                
            }
            .logout{
                position: absolute;
                top: 5px;
                left: 5px;
            }
            #welcome{
                width: 400px;
                margin: auto;
                font-weight: bold;
                font-size: 25px;
                margin-top: 110px;
            }
            i{
                margin-left: 5px;
            }
            #korpaIzbaci{
                color: red;
            }
            #i2{
                color: white;
                margin-left: 25px;
            }
            #prof{
                color:white;
                text-decoration: none;
            }
            #search{
                position: absolute;
                left: 5px;
                top: 120px;
            }
            #sea{
                color: black;
                position: absolute;
                right: 5px;
                bottom: 3px;
                z-index: 1;
            }
            #submit{
                position: absolute;
                right: 0;
                bottom: 0;
                width: 25px;
                background-color: transparent;
                border: none;
                z-index: 2;
            }
            #submit:focus{
                outline: none;
            }
        </style>
    </head>
    <body>
        <div id="search">
                 <form action="search" method="post">
                     <input type="text" name="search" placeholder="search...">
                     <input id="submit" type="submit" value="">
                     <i id="sea" class="fas fa-search"></i>
                 </form>
        </div>
         <header>GUN STORE</header>
        <nav>
            <ul id="nav">
                    <a href="chosenWeapon?type=pistolj"><li>Pištolji</li></a>
                    <a href="chosenWeapon?type=puska"><li>Puške</li></a>
                    <a href="chosenWeapon?type=sacmara"><li>Sačmare</li></a>
                    <a href="chosenWeapon?type=noz"><li>Noževi</li></a>
            <c:if test="${2 == status}">
                    <a href="novoOruzje.jsp"><li>Ubaci novo oružje</li></a>  
            </c:if>   
             </ul>
        </nav>
        <section>
            <%if(lista != null){%>
                <%for(Product p : lista){%>
                <div class="a1">
                    <img src="images/<%=p.getPicture()%>" alt="pic" width="300" height="250"><br>
                    Naziv:<%=p.getName()%><br>
                    Kalibar:<%=p.getCaliber()%><br>
                    Cena:<%=p.getPrice()%>$<br>
                    Dostupno:<%=p.getCount()%> komada<br>
                    <c:if test="${'1' == status}">
                        <%if(p.getCount() > 0){%>
                            <a href="korpa?productId=<%=p.getId()%>"><input type="button" value="Ubaci u korpu"></a>
                        <%}%>    
                    </c:if>
                    <c:if test="${'2' == status}">
                        <a href="change?productId=<%=p.getId()%>"><input type="button" value="Izmeni informacije"></a>
                        <a onclick="if(!(confirm('Uklonite proizvod?')))return false" href="delete?productId=<%=p.getId()%>"><input type="button" value="Ukloni proizvod"></a>
                    </c:if>    
                </div>
                <%}%>
            <%}else{%>
                <div id="welcome">Dobrodošli u najopremljeniju prodavnicu oružja na Balkanu.<br>
                Kod nas možete naći najraznovrsniju paletu naoružanja uz najbržu isporuku
                i mogućnost narudžbine iz inostranstva.
                </div>
            <%}%>
        </section> 
         <c:if test="${status != null}">
            <div class="logout">
                    <a href="logout"><input type="button" value="Odjavi se"></a>
                    <a id="prof" href="profile"><i id="i2" class="fas fa-user-circle"></i> Profil</a>
            </div>
        </c:if> 
            <c:if test="${status == null}">
                 <div class="logout">
                    <a href="pocetna.jsp"><input type="button" value="Vrati se na početnu"></a> 
                 </div>
            </c:if>
         <div id="cart">
             <i class="fas fa-shopping-cart"></i> Korpa
              <%if(cart == null || cart.isEmpty()){%>
                <p>Korpa je prazna</p>
            <%}else{%>
                (<%=cart.size()%>)
                <ul class="c">
                    <%for(Product p : cart){%>
                        <li class="c"><%=p.getName()%> - <%=p.getPrice()%>$<a id="korpaIzbaci" href="deleteCart?pid=<%=p.getId()%>">  izbaci</a></li>
                    <%}%>
                </ul>
                <a onclick="if(!(confirm('Da li ste sigurni da zelite da izvrsite kupovinu?')))return false" id="kupi" href="kupovina"><input  type="button" value="Kupi"></a>
              <%}%>  
         </div>
    </body>
</html>
