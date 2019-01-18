package com;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/MainServlet"})
@MultipartConfig(maxFileSize = 10*6024*1024,maxRequestSize = 20*6024*6024,fileSizeThreshold = 5*6024*6024)
public class MainServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            //creating a session
            HttpSession session = request.getSession();
            String requestType = request.getParameter("rtype");
            
            switch (requestType){
                // Signup code
                case "signup"   :   int i = AccountDow.signup(request.getParameter("username"), request.getParameter("pass1"), request.getParameter("pass2"));
                                    if(i!=0){
                                        response.sendRedirect("profile.jsp");
                                    }
                              
                                    session.setAttribute("username", (String)request.getParameter("username").toLowerCase());
                                    break;
                            
                // inserting data of profile
                case "profile"  :   int j = ProfileDow.insertData((String)session.getAttribute("username"), request.getParameter("fullname"),request.getParameter("age"),request.getParameter("sex"),request.getParameter("speciality"),request.getParameter("area"),request.getParameter("email"),request.getParameter("about"),request.getPart("image"));
                                    if(j!=0){
                                        response.sendRedirect("Search.jsp");
                                    }
                                    break;
                // login
                case "login"    :   int f = AccountDow.login(request.getParameter("username"), request.getParameter("pass1"));
                                    session.setAttribute("username", (String)request.getParameter("username").toLowerCase());
                                    if(f!=0){
                                        response.sendRedirect("MyProfile.jsp");
                                    }
                                    break;
                // adding a custom dish
                case "custom"   :    System.out.println(request.getParameter("genere"));
                                    int g = CustomDishDow.addCustomDish(request.getParameter("uname"), request.getParameter("name"), request.getParameter("desc"), request.getParameter("type"), request.getParameter("genere"), request.getParameter("taste"), request.getParameter("time"), request.getParameter("avgtime"), request.getPart("image"), (String)session.getAttribute("username"),request.getParameter("cal"));
                                   
                                    if(g!=0){
                                        response.sendRedirect("MyProfile.jsp");
                                    }
                                    break;
                // searching a custom dish
            case "customsearch" :   List li = CustomDishDow.getList(request.getParameterValues("type"), request.getParameterValues("genere"), request.getParameterValues("taste"), request.getParameterValues("time"));
                                    session.setAttribute("resultlist", li);
                                    response.sendRedirect("Search.jsp");
                                    break;
                // logout
            case "logout"       :   session.removeAttribute("username");
                                    session.invalidate();
                                    response.sendRedirect("login.html");
                                    break;
                //Description
          case "dishDescription":   session.setAttribute("dish", request.getParameter("dname"));
                                    response.sendRedirect("dishDescription.jsp");
                                    break;
                 //My dish description                   
        case "mydishDescription":   session.setAttribute("dish", request.getParameter("dname"));
                                    response.sendRedirect("dishDescription.jsp");
                                    break;
                                       
                 //Inserting a new famous place
            case "newfamousplace": int z = Famousplace.insertdata(request.getParameter("uniqname"), request.getParameter("name"), request.getParameter("type"), request.getParameter("time"), request.getParameter("genere"), request.getParameter("city"));
                                    if(z!=0){
                                        response.sendRedirect("MyProfile.jsp");
                                    }
                                    break;
                // Searching famous places                    
            case "famoussearch":    session.setAttribute("city",request.getParameter("mycity"));
            System.out.println("=================="+request.getParameter("mycity"));
                                    response.sendRedirect("usersearch.jsp");
            System.out.println("=================="+request.getParameter("mycity"));                        
                                    break;
            }                       
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}