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

<!DOCTYPE html>
<html>
    
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
        for(int j = 0; j < workFields.length/5; j++){
            wIds[j] = (String) workFields[j*5];
            workFields[j] = workFields[j*5 + 1] + "- Sets: " + workFields[j*5+2] + " Reps: " + workFields[j*5+3] + " One Rep Max: " + workFields[j*5+4] + "%";
        }
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Workout Search Results</title>
    </head>
    <body>
        <h1>Thank your for building a workout. Here are your input values: </h1>
        <br>
        <%if(workFields.length == 0){%>
            <p1>There were no results for your search. Try something else!</p1>
            <br>
            <li><a href="build.jsp">Return to Search</li>
        <%}else{%>
            
        <form action="calendar.jsp" method="get">
            <label for="date">Pick a Date:</label>
            <select name="type" id="date">
                <%for(int j = 0; j < 7; j++){%>
                <option value="<%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DATE)%>"><%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DATE)%></option>
                    <%cal.add(Calendar.DATE, 1);
                }%>
            </select>
            <br>
            <label for="time">Pick a Time:</label>
            hr:<select name="type" id="date">
                <%for(int j = 0; j < 24; j++){%>
                    <option value="<%=j%>"><%=j%></option>
                <%}%>
            </select>
            min:<select name="type" id="date">
                <%for(int j = 0; j < 60; j++){%>
                    <option value="<%=j%>"><%=j%></option>
                <%}%>
            </select>
            <br>
            
            <%for(int j = 0; j < workFields.length/5; j++){%>
            <p><input type="checkbox" name="type" id="core" value="<%=wIds[j]%>"><%=workFields[j]%></p>
                <br>
            <%}%>
            
            <br>
            <input type = "submit" value="Add to Your Workout Calendar!">
        </form>       
            
        <%}%>
        
        <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Workout Builder</li>
            <li><a href="calendar.jsp">Calendar</li>
            <li><a href="information.jsp">Information</li> 
        </ul>
        


    </body>
     
</html>
