<%-- 
    Document   : Request
    Created on : Jun 5, 2022, 6:47:09 PM
    Author     : Travis McMahon
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "workout.Builder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
    
    
    <%!
        public int[] create(String a, String b, String c) {
            
            int[] result = new int[5];
            result = Builder.returnExercises(a, b, c);
  
                return result;
            }    
    %>
    
    <% 
        int[] x = new int[5];
        x = create(request.getParameter("SorC"), request.getParameter("type"), request.getParameter("intense")); 
        //System.out.println(a);
        //String b = request.getParameter("usernameNew");
        //String c = request.getParameter("passwordOne");
        //String d = request.getParameter("passwordTwo");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Sent</title>
    </head>
    <body>
        <h1>Thank your for building a workout. Here are your input values: </h1>
        <br>
        <%=
            x[0] 
        %>
        <%=
            x[1]
        %>
        <%=
            x[2]
        %>
        <%=
            x[3]
        %>
        <%=
            x[4]
        %>
        <br>
        <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Workout Builder</li>
            <li><a href="calendar.jsp">Calendar</li>
            <li><a href="information.jsp">Information</li> 
        </ul>
        


    </body>
     
</html>
