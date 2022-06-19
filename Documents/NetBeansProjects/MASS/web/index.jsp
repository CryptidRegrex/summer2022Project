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

String fun = "";

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="goodLogin.jsp" method="post">
        <h1>MASS</h1>
        <label for="username">User Name:</label> 
        <input type="text" name="username" required="true"> 
        <label for"password">Password:</label>
        <input type="password" name="password" required="true">
        <br>
        <br>
        <sql:setDataSource var="snapshot" driver = "com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrival=true&useSSL=false"
            user="root" password="1234"/>
        <input type="submit" value="Login" id='logButton' name="userLogin"> 
        <%--Did our login work? = <%=Login.checkUser("${param.username}", "${param.password}") %>
        </form>
        
        <%--<script>
        fuction log() {
            if (<%=Login.checkUser("${param.username}", "${param.password}")%> === "Yes") {
                <%
                String redirectURL = "http://www.w3schools.com";
                response.sendRedirect(redirectURL);
                %>
                window.location.replace("http://www.w3schools.com");
                <meta http-equiv="refresh" content="7; url='www.youtube.com'"/>
                return "www.youtube.com";
            }
            else {
                <%
                redirectURL = "http://www.w3schools.com";
                response.sendRedirect(redirectURL);
                %>
                String redirectURL = "http://whatever.com/myJSPFile.jsp";
                response.sendRedirect(redirectURL);
                window.location.replace("http://www.w3schools.com");
                <meta http-equiv="refresh" content="7; url='www.netflix.com'"/>
                return "www.netflix.com";
            }
        }
        
            
        </script> --%>
        <script>
            function test(a, b) {
                String te = a; 
                fun = <%=Login.checkUser("${param.a}", "${param.b}") %>;
                if (tester === "Yes") {
                    
                }
                <sql:update dataSource ="${snapshot}" var="result">
                    INSERT INTO user_database (user_id, user_name, pass) VALUES ("test", "${param.username}", "${param.password}");
                </sql:update> 
            }
        </script>
        Did our login work inside function() = "${param.fun}";
        <br> 
        Did our login work? = <%=Login.checkUser("${param.username}", "${param.password}") %>
    </body>
</html>
