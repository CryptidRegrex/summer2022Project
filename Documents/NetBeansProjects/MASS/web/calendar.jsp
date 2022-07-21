<%-- 
    Document   : calendar
    Created on : Jun 13, 2022, 11:54:56 AM
    Author     : Travis McMahon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String workoutSessionValues[] = request.getParameterValues("type");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <link rel="stylesheet" href="calendar.css"/>
        <title>Calendar</title>
    </head>
    <body>
        <h1>Calendar</h1>
        <p id="calendar"></p>
        <script lang="JavaScript">
        //const calendar = document.querySelector("#app-calendar");
        
        for (var day = 1; day <= 7; day++) {
            
            
            calendar.insertAdjacentHTML("beforeend",
            '<div class="day">${day}</div>');
            
            document.writeln(day);
        }
        </script>
    </body>
    <br>
    <!-- Code for iterating through our returned DB information from build a workout
    -->
    <br>

    

    <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Workout Builder</li>
            <li><a href="calendar.jsp">Calendar</li>
            <li><a href="information.jsp">Information</li> 
        </ul>
</html>
