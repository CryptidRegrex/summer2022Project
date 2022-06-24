<%-- 
    Document   : index
    Created on : Jun 15, 2022, 6:09:32 PM
    Author     : JDTobiason
--%>
<!DOCTYPE html>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "login.Login" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <script lang="JavaScript">
        function badLog() {
            alert("Wrong Credentials");
        }
    </script>
    <body>
        <form action="goodLogin.jsp">
        <h1>MASS</h1>
        <label for="username">User Name:</label> 
        <input type="text" name="username" required="true"> 
        <label for"password">Password:</label>
        <input type="password" name="password" required="true">

        <br>
        <br>
        


        <input type="submit" value="Login" id="logButton" name="userLogin"> 
        </form>
        <form action="newUser.jsp">
            <br>
            <input type="submit" value="New User" id="newButon" name="userNew">
        </form>

    </body>
</html>