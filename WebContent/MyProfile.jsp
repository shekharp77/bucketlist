<%@page import="com.CustomDishBean"%>
<%@page import="com.CustomDishDow"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStream"%>
<%
    if(session.getAttribute("username")==null){
        System.out.println("mkkkkkkk");
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>My Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="index.js"></script>
        <style>
            div.image{
                content:url("resources//bl.png");
            }
            div img{ 
                max-height: 50%;
                max-width: 100%;
            }
            navlink{
                color: white
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
        <!jsp------------------------------------------------------------------------------------->
       
                
            
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
                    <a class="nav-link navlink" style="color:white" href="Search.jsp"><i>Explore Custom world</i></a>
                    <a class="nav-link navlink" style="color:white" href="Searchrare.jsp"><i>Rare ingredients</i></a>
                    <a class="nav-link navlink" style="color:white" href="AddFplace.jsp"><i>Add Famous Place</i></a>
                    </div>
                    <div class="nav-item navbar-right">
                        <form action="MainServlet" method="post">
                            <input type="text" value="logout" name="rtype" hidden="true">
                            <input type="submit" class="nav-link navlink btn btn-danger" style="color:white" value="Logout">
                       </form>
                    </div>
                
             </div>
        </nav><%
                                }catch(Exception ex){ex.printStackTrace();}
        %>
        <!-------------------------------------------------------------------------->
        <div class="jumbotron" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
            <label>
                <h1>
                    Here are your Dishes:
                </h1>
            </label>
            <div align="center">
            <a class="btn btn-primary" href="Custom.jsp">Add your Dish</a>
            </div>
        </div>
        
       <%
                        try{
                            String  uniqname, name, description, type, genere, taste, time,by;
                            InputStream stream;
                            Blob blob;
                            int averagetime;
                            String url;
                            List li = CustomDishDow.getMyData((String)session.getAttribute("username"));
                            System.out.println("------------------------- " +(String)session.getAttribute("username"));
                       
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
                <% 
                    CustomDishDow.getInfo((String)session.getAttribute("dish"));
                %>
                    <div id="result" style="margin-top:10%;" align="center" id="result1">
                         <div class="card col-sm-7" style="margin-top:10%; margin-bottom: 10%;background-color: rgba(233, 236, 239, 0.76); margin:10%">
                             <img class="card-img-top" src="<%="resources\\images\\"+uniqname+".jpg"%>"  height="60%" width="42%">
                            <div class="card-body " id="<%=uniqname%>">
                                <h4 class="card-title"><%=name%></h4>
                                <p class="card-text"><%=taste%></p>
                                <p class="card-text"><%=type%></p>
                                <p class="card-text"><%=genere%></p>
                                <form method="post" action="MainServlet">
                                    <input type="text" value="mydishDescription" name="rtype" hidden="true">
                                    <input type="text" value="<%=uniqname%>" name="dname" hidden="true">
                                    <button href="#" class="btn btn-primary aba">See description</button>
                                </form>
                            </div>
                        </div>
                    </div>
                <%                  
                            }
                             
                                
                        }catch(Exception ex){
                            ex.printStackTrace();
                        }
                            
                %>
       
    </body>
</html>
