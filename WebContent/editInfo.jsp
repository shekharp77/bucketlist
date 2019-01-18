<%-- 
    Document   : editInfo
    Created on : 27 Oct, 2017, 11:19:42 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        
        <title>Edit Info</title>
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
        <!--Signup------------------------------------------------------------------------>
        
        <form action="MainServlet" style="margin:10%" method="post" data-target="#navbar-example2" enctype="multipart/form-data">
           <label>Create your profile: </label>
            <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" value="" required id="un" name="fullname">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" value="" required name="age">
            </div>
            <div class="form-group">
                <input type="radio" class="form-control"   name="sex" value="male">Male
                <input type="radio" class="form-control"   name="sex" value="Female">Female
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" value="" required id="un" name="speciality">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" value="" required id="un" name="area">
            </div>
           <div class="form-group" align="center">
                <input type="email" class="form-control" id="exampleInputEmail1" value="" required id="un" name="email">
            </div>
           <div class="form-group" align="center">
               <textarea type="text" class="form-control" id="exampleInputEmail1" value="" required id="un" name="about"></textarea>
            </div>
          
           <input type="text" hidden="true" name="rtype" value="updateprofile">
            <input type="submit" class="btn btn-primary" value="Update">
        </form>
    </body>
</html>
