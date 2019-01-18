<%-- 
    Document   : Search
    Created on : 24 Oct, 2017, 3:31:43 PM
    Author     : user
--%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.CustomDishBean"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.CustomDishDow"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Search</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
        <style>
            div.image{
                content:url("resources//bl.png");
            }
            div img{ 
                max-height: 50%;
                max-width: 100%;
            }
            body { 
                background-image: url(resources/d.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
        </style>
    </head>
    <body>
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
                    <a class="nav-link navlink" style="color:white" href="usersearch.jsp"><i>Explore Famous world</i></a>
                    <a class="nav-link navlink" style="color:white" href="MyProfile.jsp"><i>My Dishes</i></a>
                    <a class="nav-link navlink" style="color:white" href="Searchrare.jsp"><i>Rare ingredients</i></a>
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
<!--            <div class="" align='center'>
                <img src="resources//food2.jpg" class="img-fluid" alt="Responsive image">
            </div>-->
        <!--------------------------------------------------------------------------->
        <!--jumbotron----------------------------------------------------------------->
<!--        <div class="container"> 
            <div class="row">-->
<div class="jumbotron" align="center" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
                    <form  method="post" data-target="#navbar-example2" id="signup" action="MainServlet">
            <label style="color:green"><i> Select Type</i></label>
            <div class="" align="center">
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" value="North Indian" name="type">
                  North Indian
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="South Indian" name="type">
                  South Indian
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="North East" name="type">
                  North East
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Rajasthani" name="type">
                  Rajasthani
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Punjabi" name="type">
                 Punjabi
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Gujrati" name="type">
                  Gujrati
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Maharashtrian" name="type">
                  Maharashtrian
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="other" name="type">
                  other
                </label>
            </div>
            
            </div>
            <label style="color:green"><i>Veg or Non-Veg</i></label>
            
            <div class="" align="center">
           <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Veg" name="genere">
                  Veg
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Non-Veg" name="genere">
                  Non-Veg
                </label>
            </div> 
            </div>
            <label style="color:green"><i>Select taste</i></label>
            <div class="" align="center">
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Spicy" name="taste">
                  Spicy
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value=" Too Spicy" name="taste">
                  Too Spicy
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Normal" name="taste">
                  Normal
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Sweet" name="taste">
                  Sweet
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Sweet & Sour" name="taste">
                  Sweet & Sour
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Sour" name="taste">
                  Sour
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Salad" name="taste">
                  Salad
                </label>
            </div>
            </div>
            <label style="color:green"><i>Select time</i></label>
            <div class="" align="center">
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="BreakFast" name="time">
                  BreakFast
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Lunch" name="time">
                  Lunch
                </label>
            </div> 
            
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Dinner" name="time">
                  Dinner
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Snack" name="time">
                  Snack
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Salad"name="time">
                  Salad
                </label>
            </div>
            <div class="form-check  form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" value="Other" name="time">
                  Other
                </label>
            </div>
            </div>
            <input type="text" hidden="true" name="rtype" value="customsearch"><br>
            <input type="submit" class="btn btn-primary" value="Search">
            
            
        </form>
                    
            </div>
                
                <%
                        try{
                            String  uniqname, name, description, type, genere, taste, time,by;
                            InputStream stream;
                            Blob blob;
                            int averagetime;
                            String url;
                            List li = (List)session.getAttribute("resultlist");
                            
                       
                            for(int i=0;i<li.size();i++){ 
                                CustomDishDow.getInfo((String)li.get(i));
                                uniqname = CustomDishBean.getUniqname();
                                name     = CustomDishBean.getName();
                                type     = CustomDishBean.getType();
                                genere   = CustomDishBean.getGenere();
                                taste    = CustomDishBean.getTaste();
                                time     = CustomDishBean.getTime();
                                averagetime= CustomDishBean.getAveragetime();
                                System.out.println(uniqname);
                                url = "G:\\MyImages\\"+uniqname+".jpg";
                               
                %>
               
                    <div id="result" style="margin-top:10%;" align="center" id="result1">
                         <div class="card col-sm-7" style="margin-top:10%; margin-bottom: 10%;background-color: rgba(233, 236, 239, 0.76); margin:10%">
                             <img class="card-img-top" src="<%="resources\\images\\"+uniqname+".jpg"%>"  height="60%" width="42%">
                            <div class="card-body " >
                                <h4 class="card-title"><%=name%></h4>
                                <p class="card-text"><%=taste%></p>
                                <p class="card-text"><%=type%></p>
                                <p class="card-text"><%=genere%></p>
                                <form method="post" action="MainServlet">
                                    <input type="text" value="dishDescription" name="rtype" hidden="true">
                                    <input type="text" value="<%=uniqname%>" name="dname" hidden="true">
                                <button href="#" class="btn btn-primary aba" id="<%=uniqname%>">See description</button>
                                </form>
                            </div>
                        </div>
                    </div>
                <%                  
//                                    
                            }
                              session.removeAttribute("resultlist");
                                
                        }catch(Exception ex){
                            ex.printStackTrace();
                        }
                            
                %>
<!--            </div>
         </div>    -->
       
          
        
    </body>
</html>

