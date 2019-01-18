<%-- 
    Document   : usersearch
    Created on : 26 Oct, 2017, 12:54:32 PM
    Author     : user
--%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.rareingdow"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ingredients</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <style>
            body { 
                background-image: url(resources/ing.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
        </style>
        <style>
            div.image{
                content:url("resources//bl.png");
            }
            div img{ 
                max-height: 50%;
                max-width: 100%;
            }
        </style>
    </head>
    <body >
        <!--Navbar------------------------------------------------------------------->
            <%
            try{
                    String username =(String) session.getAttribute("username");
                %>
        <nav class="navbar bg-dark navbar-expand-lg navbar-fixed-top ">
             <div class="container-fluid">
                <div class="  navbar-right row" id="navbarNav" style="max-width: 5%; height:auto;">
                    <a href="MyInfo.jsp">  <img src=<%="resources\\dps\\"+username+".jpg"%> class="img-fluid navbar-right navbar-fixed-top" alt="Responsive image" class="rounded-circle"></a>
                </div>
                <div class="nav-item row">
                    <a class="nav-link navlink" style="color:white" href="MyInfo.jsp"><i>My Info</i></a>
                    <a class="nav-link navlink" style="color:white" href="MyProfile.jsp"><i>My Dishes</i></a>
                    <a class="nav-link navlink" style="color:white" href="Search.jsp"><i>Explore Custom world</i></a>
                    </div>
                    <form action="MainServlet" method="post">
                            <input type="text" value="logout" name="rtype" hidden="true">
                            <input type="submit" class="nav-link navlink btn btn-danger" style="color:white" value="Logout">
                       </form>
                
             </div>
        </nav><%
                                }catch(Exception ex){ex.printStackTrace();}
        %>
        <!-------------------------------------------------------------------------->
        <!--image----------------------------------------------------------------->
        <div class="jumbotron" align='center' style="background-color: #97c0e8;">
                <h1><i>Some rare ingredients for you :)</i></h1>
            </div>
        <!--------------------------------------------------------------------------->
        <!--jumbotron----------------------------------------------------------------->
        <%try{
            List li = new ArrayList();
                    li = rareingdow.getList();
            for(int i = 0; i < li.size(); i++){
                List li2 = rareingdow.getData((String)li.get(i));
        %>
        <div class="jumbotron" align="center" style="background-color: rgba(233, 236, 239, 0.76);">
                <h1 class="display-3"><%=(String)li2.get(0)%></h1>
                <h1 class="display-6"><%=(String)li2.get(1)%></h1>  
                <h4 class="display-7"><i><%=(String)li2.get(2)%></i></p>
                <b><hr></b>
                    <a href="resources//map.html" class="btn btn-primary">Show on Map</a>
               
            </div>  
            <%
                }
                }catch(Exception ex){}
            %>
        <!------------------------------------------------------------------------>
        
        
    </body>
</html>

