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
            Boolean fun = false;
            fun = Login.checkUser(a, b);
                if (fun == true) {
                    log = "You got it";
                }
                else {
                    log = "You don't got it";
                }
                //Login.setUser(fun);
                return fun;
            }    
        %>
        
    <% 
      Boolean a = test(request.getParameter("username"), request.getParameter("password")); 
      System.out.println(a);
      String b = request.getParameter("username");
      String c = request.getParameter("password");
    %>
    <script lang="JavaScript">
        function badLog() {
            alert("Wrong Credentials");
        }
    </script>
        
    <body>
        
        <% 
            if (a) {
                String redURL = "http://www.w3schools.com";
                response.sendRedirect(redURL);
            } 
            else {
                %>
                <script>
                    badLog();
                </script>
                <%
                String badURL = "index.jsp";
                response.sendRedirect(badURL);
            }
        %>
        <p name="failAlert">
            
        </p>
        

        <%=
            a
        %>

        
    </body>
</html>
