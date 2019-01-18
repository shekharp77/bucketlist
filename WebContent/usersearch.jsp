<%-- 
    Document   : usersearch
    Created on : 26 Oct, 2017, 12:54:32 PM
    Author     : user
--%>

<%@page import="com.FamousplaceBean"%>
<%@page import="com.Famousplace"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <title>Search</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="paho-mqtt.js"></script>
        <script src="paho-mqtt-min.js"></script>
        <script type="text/javascript" src="main.js"></script>
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
                    <a class="nav-link navlink" style="color:white" href="MyProfile.jsp"><i>My Dishes</i></a>
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
        <!-------------------------------------------------------------------------->
        <!--image----------------------------------------------------------------->
<!--            <div class="jumbotron" align='center'>
                <h1><i>Famous Traditional Restaurants </i></h1>
            </div>-->
        <!--------------------------------------------------------------------------->
        <!--jumbotron----------------------------------------------------------------->
          
        <div class="jumbotron" style="background-color: rgba(233, 236, 239, 0.76); margin:10%">
            <form action="MainServlet" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="city name" id="abcd" aria-label="City name" aria-describedby="basic-addon2" name="mycity">
                    <input type="text" value="famoussearch" name="rtype" hidden="true">
                    <span class="input-group-addon" id="basic-addon2">
                        <input type="submit" value="Search" class="btn btn-primary">
                    </span>
                </div>
        </form>      
            </div>  
       <%try{
            List li = new ArrayList();
//            /li.add("Delhi, India");
            System.out.println(li.size());
                    li = Famousplace.getPlace((String)session.getAttribute("city"));
                    System.out.println((String)session.getAttribute("city")+"[[[[[[[[[[[[[[[[[[[");
            for(int i = 0; i < li.size(); i++){
                System.out.println("-_============+++++");
               Famousplace.getInsert((String)li.get(i));
               
        %>
        <div class="jumbotron" align="center" style="background-color: rgba(233, 236, 239, 0.76);">
                <h1 class="display-3"><%=FamousplaceBean.getName()%></h1>
                <h1 class="display-6"><%=FamousplaceBean.getType()%></h1>  
                <h4 class="display-7"><i><%=FamousplaceBean.getTime()%></i></p>
                <h4 class="display-7"><i><%=FamousplaceBean.getGenere()%></i></p>
                <div id="status "></div>
                <b><hr></b>
                <a href="resources//map.html" class="btn btn-primary">Show on Map</a>
               
            </div>  
            <%
                }

                 session.removeAttribute("mycity");
                 
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            %>
        <!------------------------------------------------------------------------>
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
        
    </body>
</html>

