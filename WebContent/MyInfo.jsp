<%-- 
    Document   : MyInfo.jsp
    Created on : 25 Oct, 2017, 3:37:39 PM
    Author     : user
--%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<%@page import="com.ProfileDow"%>
<%@page import="com.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Info</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <style>
            b, strong {
            font-weight: bolder;
            font-size: xx-large;
            font-family: cursive;
        }
         body { 
                background-image: url(resources/e.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
        </style>
            
    </head>
    <body>
        <%
            try{
                    String username =(String) session.getAttribute("username");
                %>
        <nav class="navbar bg-dark navbar-expand-lg navbar-fixed-top ">
             <div class="container-fluid">
                <div class="  navbar-right row" id="navbarNav" style="max-width: 5%; height:auto;">
                    <a href="MyInfo.jsp">  <img src="<%="resources\\dps\\"+username+".jpg"%>" class="img-fluid navbar-right navbar-fixed-top" alt="Responsive image" class="rounded-circle"></a>
                </div>
                <div class="nav-item row">
                    <a class="nav-link navlink" style="color:white" href="MyProfile.jsp"><i>My Dishes</i></a>
                    <a class="nav-link navlink" style="color:white" href="usersearch.jsp"><i>Explore Famous world</i></a>
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
     <!---------------------------------------------------------------------------------------------------------------------------------------->
     <!--Signup------------------------------------------------------------------------>
     <% try{ 
                ProfileDow.getdeatails((String) session.getAttribute("username"));
            %>
            <div class="container"style="margin-top:10%" >
                <div class="row">
                    <div class="col-sm-5" style="margin-top: 10%">
                        <img class="col-sm" src="<%="resources\\dps\\"+(String) session.getAttribute("username")+".jpg"%>" >
                    </div>
                
                    <div class="col-sm-5" style="margin-top: 10%">
                        <div class="jumbotron" class="col-sm">
                            <label type="text" class="label" id="exampleInputEmail1" ><b><%= ProfileBean.getUsername()%></b></label><br>
                             <hr>
                            
                            <label type="text" class="label" id="exampleInputEmail1" ><i><%= ProfileBean.getFullname()%></i></label><br>

                            <label type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getAge()%></i></label><br>

                            <label type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getGender()%></i></label><br>

                            <label type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getSpeciality()%></i></label><br>

                            <label type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getArea()%></i></label><br>

                            <label type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getEmail()%></i></label><br>

                            <p type="text" class="" id="exampleInputEmail1" ><i><%= ProfileBean.getAbout()%></i></p><br>
                        
                        <a href="editInfo.jsp" class="btn btn-primary" value="Edit">Edit Info</a>
                        </div>   
                    </div> 
                </div>       
            </div>      
       <%
          }catch(Exception ex){}
        %>
        <!---------------------------------------------------------------------------->
    </body>
</html>
