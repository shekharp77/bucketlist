<%-- 
    Document   : profile.jsp
    Created on : 2 Nov, 2017, 3:10:58 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username")==null){
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
        <title>Profile</title>
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
                background-image: url(resources/e.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <!--Navbar------------------------------------------------------------------->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <label class="navbar-brand" style="color: white; font-size: 30px">
                   Bucket List
                </label>
                
            </nav>
        <!-------------------------------------------------------------------------->
        <!--image----------------------------------------------------------------->
<!--            <div class="" align='center'>
                <img src="resources//food2.jpg" class="img-fluid" alt="Responsive image">
            </div>-->
        <!--------------------------------------------------------------------------->
        <!--Signup------------------------------------------------------------------------>
        <div class="jumbotron" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
        <form action="MainServlet" style="margin:10%" method="post" data-target="#navbar-example2" id="signup" enctype="multipart/form-data">
           <label>Create your profile: </label>
            <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Fullname" required id="un" name="fullname">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter age" required name="age">
            </div>
            <div class="form-group">
                <div class="form-check-inline">
                <input type="radio" class="form-control"   name="sex" value="male">Male
                </div>
                <div class="form-check-inline">
                <input type="radio" class="form-control"   name="sex" value="Female">Female
                </div>
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Speciality" required id="un" name="speciality">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Your area" required id="un" name="area">
            </div>
           <div class="form-group" align="center">
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" required id="un" name="email">
            </div>
           <div class="form-group" align="center">
               <textarea type="text" class="form-control" id="exampleInputEmail1" placeholder="About you" required id="un" name="about"></textarea>
            </div>
           <div class="form-group" align="center">
                <input type="file" class="form-control" placeholder="Select image" required id="un" name="image">
            </div>
           <input type="text" hidden="true" name="rtype" value="profile">
            <input type="submit" class="btn btn-primary" id="sign">
        </form>
        </div>
        <!---------------------------------------------------------------------------->
    </body>
</html>

