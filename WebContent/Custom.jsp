<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<html>
    <head>
        <title>Add Custom Dish</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script type="text/javascript" src="texteditor/scripts/jHtmlArea-0.8.min.js"></script>
        <script src="index.js"></script>
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
                    </div>
                    <form action="MainServlet" method="post">
                            <input type="text" value="logout" name="rtype" hidden="true">
                            <input type="submit" class="nav-link navlink btn btn-danger" style="color:white" value="Logout">
                       </form>
                
             </div>
        </nav><%
                                }catch(Exception ex){ex.printStackTrace();}
        %>
        <script>
            $(function(){
                $("textarea").htmlarea();
            });
        </script>
        <!--Signup------------------------------------------------------------------------>
        <div class="jumbotron" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
            <form style="margin:10%" method="post" data-target="#navbar-example2" enctype="multipart/form-data" action="MainServlet">
           <label>Add your Dish: </label>
           <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Enter A unique name" required  name="uname">
            </div>
            <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Enter actual Dish name" required id="un" name="name">
            </div>
           <div class="form-group" align="center">
               <textarea  class="form-control"  placeholder="Enter Description" required name="desc"></textarea>
            </div>
            <div class="form-group">
                <input type="file" class="form-control" id="exampleInputPassword1"  required name="image">
            </div>
            <div class="form-group" align="center">
                
                <small class="form-control" style="color:green"><b>Type of dish:</b></small><br>
                <hr>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="North Indian">North Indian
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="South Indian">South Indian
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="North East">North East India
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="rajasthani">Rajasthani
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="Punjabi">Punjabi Indian
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="Gujrati">Gujrati Indian
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="maharashtrian">Maharashtrian Indian
                </div>
                <div class="form-check-inline">
                <input type="Radio" class="form-control"  name="type" value="other">Other Indian
                </div>
                <br>
                <hr>
                <br>
            </div>
           <div class="form-group" align="center">
               <small class="form-control"  style="color:green"><b>Genere of dish</b>:</small><br>
               <hr>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="genere" value="veg">Vegetarian
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="genere" value="non-veg">Non-Vegetarian
               </div>
               <br>
                <hr>
                <br>
            </div>
           
           <div class="form-group" align="center">
               <small class="form-control"  style="color:green"><b>Taste of dish:</b></small><br>
               <hr>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="spicy">Spice
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="too spicy">Too Spicy
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="normal">Normal
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="sweet">Sweet
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="sweet & sour">Sweet & Sour
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="sour">Sour
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="taste" value="salad">Salad
               </div>
               <br>
                <hr>
                <br>
            </div>
           <div class="form-group" align="center">
               <small class="form-control"  style="color:green"><b>Time:</b></small><br>
               <hr>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="breakfast">Breakfast
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="lunch">Lunch
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="dinner">dinner
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="snack">Snack
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="salad">Salad
               </div>
               <div class="form-check-inline">
                    <input type="Radio" class="form-control"  name="time" value="other">other
               </div>   
               <br>
                <hr>
                <br>
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Enter Avg Time"  name="avgtime">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Calories"  name="cal">
            </div>
          
           <input type="text" hidden="true" name="rtype" value="custom">
           <input type="submit" class="btn btn-primary" id="sign" value="post">
        </form>
        </div>
        
        <!---------------------------------------------------------------------------->
    </body>
</html>
