<%-- 
    Document   : AddFplace
    Created on : 27 Oct, 2017, 3:35:00 PM
    Author     : user
--%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.html");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Favourite Place</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <style>
            body { 
                background-image: url(resources/a.jpg);
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
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDALPAe_hvKBhnjdZ3Pt2uOBQX6Pdt8eMs&libraries=places"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {

            var options = {
                //types: ['(cities)'],
                componentRestrictions: { country: 'in' }//India only
            };

            var places = new google.maps.places.Autocomplete(document.getElementById('abcd'),options);


            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();

             
                
                var address = place.formatted_address;
                document.getElementById("abcd").innerHTML = address;

                var i = 0;
                placearrsize = 0;
                
                while (1) {

                    if (place.address_components[i] == null) {
                        break;
                    }

                    else {
                        placearrsize++;
                        i++;
                    }
                }

                for (i = (placearrsize - 1); i >=0  ; i--)
                {
                    console.log(place.address_components[i].long_name+'('+place.address_components[i].types[0]+')');


                }

                console.log(placearrsize);


            });



        });



        function myFunction() {
            document.getElementById("abcd").innerHTML = "";
            location.reload();

        }

    </script>
        <!--Signup------------------------------------------------------------------------>
        <div class="jumbotron" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
        <form action="MainServlet" style="margin:10%" method="post" data-target="#navbar-example2" enctype="multipart/form-data">
           <label>ADD New Famous Place </label>
            <div class="form-group" align="center">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter Uniqname" required name="uniqname">
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Enter name" required name="name">
            </div>
            <div class="form-group" align="center">
                <div class="form-check-inline">
                <input type="radio" class="form-control"   name="type" value="Snack">Snack
                </div>
                <div class="form-check-inline">
                <input type="radio" class="form-control"   name="type" value="lunch">lunch
                </div>
                <div class="form-check-inline">
                <input type="radio" class="form-control"   name="type" value="Both">Both
                </div>
            </div>
           <div class="form-group" align="center">
                <input type="text" class="form-control"  placeholder="Time" required  name="time">
               
            </div>
           <div class="form-group" align="center">
               <div class="form-check-inline">
                <input type="radio" class="form-control"   name="genere" value="Veg">Veg
               </div>
               <div class="form-check-inline">
                <input type="radio" class="form-control"   name="genere" value="Non-Veg">Non-Veg
               </div>
               <div class="form-check-inline">
                <input type="radio" class="form-control"   name="genere" value="Both">Both
               </div>
            </div>
           <div class="form-group" align="center">
               
                <input type="text" class="form-control"  placeholder="city" required id="abcd"  name="city">
            </div>
           
           <input type="text" hidden="true" name="rtype" value="newfamousplace">
            <input type="submit" class="btn btn-primary" id="Add">
        </form>
        </div>
    </body>
</html>
