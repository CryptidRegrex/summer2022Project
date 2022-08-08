<%-- 
    Document   : Request
    Created on : Jun 5, 2022, 6:47:09 PM
    Author     : Travis McMahon
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.Calendar"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "workout.Builder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>

<%!
        public Object[] create(String wType, String wInt, String equ, String[] mGroups) {
            
            ArrayList<String> result = new ArrayList<String>();
            result = Builder.returnExercises(wType, wInt, equ, mGroups);
            return result.toArray();
        }    
    %>
    
    <% 
        
        Object[] workFields;
        Calendar cal = Calendar.getInstance();
        
        workFields = create(request.getParameter("SorC"), request.getParameter("intense"), request.getParameter("equ"), request.getParameterValues("type"));
        
        String[] wIds = new String[workFields.length/5];
        String[] h = new String[workFields.length/5];
        for(int j = 0; j < workFields.length/5; j++){
            wIds[j] = (String) workFields[j*5];
            h[j] = (String) workFields[j*5 + 1];
            workFields[j] = workFields[j*5 + 1] + "- Sets: " + workFields[j*5+2] + " Reps: " + workFields[j*5+3] + " One Rep Max: " + workFields[j*5+4] + "%";
        }
        session.setAttribute("a", h);
        session.setAttribute("w", wIds);
    %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Workout Search Results</title>
    </head>
    <body>
        <h1>Thank your for building a workout. Here are your input values: </h1>
        <br>
        
        <%if(workFields.length == 0){%>
        <c:redirect url="noResults.jsp"></c:redirect>
        <%}else{%>
        <form action="calendar2.jsp" method="get">
            <ul>
            <%for(int j = 0; j < workFields.length/5; j++){%>
            <li><%=workFields[j]%></li>
            <%}%>
            </ul>
        <%}%>
            <input type="submit" value="Add To Calendar">
        </form>   
            <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="information.jsp">Information</li> 
            <li><a href="build.jsp">Build-A-Workout</li>
            <li><a href="checklist.jsp">Checklist</li>
            <li><a href="week.jsp">Calendar</li>
        </ul>1
    </body>   
</html>
