<%-- 
    Document   : createUser
    Created on : Jun 21, 2022, 6:12:28 PM
    Author     : JDTobiason
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "login.Login" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating New User</title>
    </head>
    
    <%!
        public Boolean create(String a, String b, String c) { 
            Boolean result = false;
            Boolean badUser = false;
            result = Login.createNewUser(a, b, c);
                if (result) {
                    badUser = true;
                }
                return badUser;
            }    
    %>
    
    <% 
      Boolean a = create(request.getParameter("usernameNew"), request.getParameter("passwordOne"), request.getParameter("passwordTwo")); 
      //System.out.println(a);
      //String b = request.getParameter("usernameNew");
      //String c = request.getParameter("passwordOne");
      //String d = request.getParameter("passwordTwo");
    %>
    <body>

        <% 
            if (a) {
                String redURL = "http://www.w3schools.com";
                response.sendRedirect(redURL);
            } 
            else {
                String badURL = "index.jsp";
                response.sendRedirect(badURL);
            }
        %>


    </body>
</html>
