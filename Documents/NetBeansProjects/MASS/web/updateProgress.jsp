<%-- 
    Document   : updateProgress
    Created on : Jul 27, 2022, 2:58:19 PM
    Author     : JDTobiason
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "java.util.ArrayList"%>
<%@page import = "login.Login"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import = "java.util.Calendar"%>
<%@ page import = "calendar.Calender" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "checklist.Checklist" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        public String[] updating(String u, String day) {
            String[] workoutIDs = Checklist.updateChecklistProgress(u, day);
            Boolean check = false;
            Boolean re = false;
            return workoutIDs;
        }
    %>
    
    <% 
        String [] progress = request.getParameterValues("prog");
        String user = (String)session.getAttribute("user");
        String day = request.getParameter("days");
        String [] aWorkout = updating(user, day); 
        System.out.println(aWorkout);
    %>
    <% 
        if (aWorkout.length > 0) {
            String redURL = "checklist.jsp";
            response.sendRedirect(redURL);
        } 
    %>
    <%!
        public Object[] getNames(String [] workouts) {
            
            ArrayList<String> result = new ArrayList<String>();
            result = calendar.Calendar.wNames(workouts);
            return result.toArray();
        }    
    %>
    
    <%
        Object [] userDayWorkouts = (String[])getNames(aWorkout);
    %>
</html>
