<%-- 
    Document   : calendar
    Created on : Jun 13, 2022, 11:54:56 AM
    Author     : Travis McMahon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Calendar</title>
    </head>
    <body>
        <h1>Calendar</h1>
        <%String [] k = (String[])session.getAttribute("a");%>
        <form action="schedule.jsp" method="get">
        <ul>
        <%for(int i = 0; i < k.length; i++){%>
        <li><label for="e">Exercise: </label>
            <input type="text" name="e" value="<%=k[i]%>" disabled/>
            <label for="d">Date: </label>
            <input type="date" name="d" min="2022-07-25"/>
        </li>
        <%}%>
        </ul>
            <input type="submit" value="Submit"/>
        </form>       
    <br>  
     <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Workout Builder</li>
            <li><a href="information.jsp">Information</li> 
        </ul>
     </body>
</html>
