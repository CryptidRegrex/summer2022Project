<%-- 
    Document   : goodLogin
    Created on : Jun 19, 2022, 2:59:05 PM
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
        <title>Validating Credentials</title>
    </head>
    
    <%!
            public Boolean test(String a, String b) { 
            String log = null;
            Boolean check = false;
            Boolean re = false;
            check = Login.checkUser(a, b);
                if (check == true) {
                    re = true;
                }
                return re;
            }    
        %>
        
    <% 
      Boolean a = test(request.getParameter("username"), request.getParameter("password")); 
      System.out.println(a);
      String b = request.getParameter("username");
      String c = request.getParameter("password");
    %>
    <!-- Old script for badLogin functionality
    <script lang="JavaScript">
        function badLog() {
            alert("Wrong Credentials");
        }
    </script>
    -->    
    <body>
        
        <% 
            if (a) {
                String redURL = "build.jsp";
                session.setAttribute("user", request.getParameter("username"));
                response.sendRedirect(redURL);
            } 
            else {
                //request.setAttribute("failAlert","Wrong");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username or Password Inccorect');");
                out.println("location='home.jsp';");
                out.println("</script>");
                //String badURL = "index.jsp";
                //response.sendRedirect(badURL);
            }
        %>
        

        <%=
            a
        %>

        
    </body>
</html>
