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
            <p>Do you have equipment?</p>
            <label for="st">Yes: </label>
            <input type="radio" name="equ" id="st" value="1" checked="checked">
            <label for="end">No: </label>
            <input type="radio" name="equ" id="end" value="0">
            <p>Are you training for Strength or Conditioning?</p>
            <label for="st">Strength: </label>
            <input type="radio" name="SorC" id="st" value="1" checked="checked">
            <label for="end">Conditioning: </label>
            <input type="radio" name="SorC" id="end" value="0">
            <p>Are you training Upper Body, Lower Body, Core or All?</p>
            <label for="upp">Upper Body</label>
            <input type="checkbox" name="type" id="upp" value="Upper Body">
            <label for="low">Lower Body</label>
            <input type="checkbox" name="type" id="low" value="Lower Body">
            <label for="core">Core</label>
            <input type="checkbox" name="type" id="core" value="Core">
            <label for="all">All</label>
            <input type="checkbox" name="type" id="all" value="*" checked="checked">
            <p>Would you like a low, moderate, or intense workout?</p>
            <label for="l">Low </label>
            <input type="radio" name="intense" id="l" value="Low">
            <label for="m">Moderate </label>
            <input type="radio" name="intense" id="m" value="Moderate"  checked="checked">
            <label for="i">Intense </label>
            <input type="radio" name="intense" id="i" value="High">
            <input type="submit"> 
        </form>
        <br>
     <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="calendar.jsp">Calendar</li>
            <li><a href="information.jsp">Information</li>
            <li><a href="checklist.jsp">Checklist</li>
        </ul>
     </body>
</html>

