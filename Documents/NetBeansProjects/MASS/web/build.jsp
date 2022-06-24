<%-- 
    Document   : build
    Created on : Jun 13, 2022, 11:54:01 AM
    Author     : Travis McMahon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Workout Builder</title>
    </head>
    <body>
        <h1>Workout Builder</h1>
        <form action="Request.jsp" method="get">
            <p>Are you training for Strength or Conditioning?</p>
            <label for="st">Strength: </label>
            <input type="radio" name="SorC" id="st">
            <label for="end">Conditioning: </label>
            <input type="radio" name="SorC" id="end">
            <br>
            <p>Are you training Upper Body, Lower Body, Core or All?</p>
            <label for="upp">Upper Body</label>
            <input type="checkbox" name="type" id="upp">
            <label for="low">Lower Body</label>
            <input type="checkbox" name="type" id="low">
            <label for="core">Core</label>
            <input type="checkbox" name="type" id="core">
            <label for="all">All</label>
            <input type="checkbox" name="type" id="all">
            <br>
            <p>Would you like a low, moderate, or intense workout?</p>
            <label for="l">Low </label>
            <input type="radio" name="l" id="l">
            <label for="m">Conditioning </label>
            <input type="radio" name="m" id="m">
            <label for="i">Intense </label>
            <input type="radio" name="i" id="i">
            <br>
            <p>How long of a workout would you like?</p>
            <label for="sh">Short </label>
            <input type="radio" name="lon" id="sh">
            <label for="me">Medium </label>
            <input type="radio" name="lon" id="me">
            <label for="lo">Long </label>
            <input type="radio" name="lon" id="lo">
            <input type="submit"> 
        </form>
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

