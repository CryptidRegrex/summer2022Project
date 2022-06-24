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
        <form action="results.jsp" method="get">
            <p>Are you training for Strength or Conditioning?</p>
            <label for="st">Strength: </label>
            <input type="radio" name="SorC" id="st" value="1">
            <label for="end">Conditioning: </label>
            <input type="radio" name="SorC" id="end" value="0">
            <br>
            <p>Are you training Upper Body, Lower Body, Core or All?</p>
            <label for="upp">Upper Body</label>
            <input type="checkbox" name="type" id="upp" value="Upper Body">
            <label for="low">Lower Body</label>
            <input type="checkbox" name="type" id="low" value="Lower Body">
            <label for="core">Core</label>
            <input type="checkbox" name="type" id="core" value="Core">
            <label for="all">All</label>
            <input type="checkbox" name="type" id="all" value="*">
            <br>
            <p>Would you like a low, moderate, or intense workout?</p>
            <label for="l">Low </label>
            <input type="radio" name="intense" id="l" value="Low">
            <label for="m">Moderate </label>
            <input type="radio" name="intense" id="m" value="Moderate">
            <label for="i">Intense </label>
            <input type="radio" name="intense" id="i" value="High">
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

