<%-- 
    Document   : ChangePass
    Created on : 2 Nov, 2017, 3:13:31 PM
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
        <title>Change Password</title>
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
        </style>
    </head>
    <body>
        <!--Navbar------------------------------------------------------------------->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <label class="navbar-brand" style="color: white; font-size: 30px">
                   Bucket List
                </label>
                
                    <a class="nav-link btn" href="#signup">Login</a>
    
            </nav>
        <!-------------------------------------------------------------------------->
        <!--image----------------------------------------------------------------->
            <div class="" align='center'>
                <img src="resources//food2.jpg" class="img-fluid" alt="Responsive image">
            </div>
        <!--------------------------------------------------------------------------->
        <!--Signup------------------------------------------------------------------------>
            <form style="margin:10%" method="post" data-target="#navbar-example2" id="signup">
           <label>Change Your Password</label>
            <div class="form-group" align="center">
                <input type="password" class="form-control"  placeholder="Enter Username" required  name="oldpass">
                
            </div>
           <div class="form-group" align="center">
                <input type="password" class="form-control"  placeholder="Enter password" required name="newpass1">
            </div>
           <div class="form-group" align="center">
                <input type="password" class="form-control"  placeholder="Enter password" required name="newpass2">
            </div>
           <input type="submit" class="btn btn-primary" id="sign" value="Class">
        </form>
        <!---------------------------------------------------------------------------->
    </body>
</html>