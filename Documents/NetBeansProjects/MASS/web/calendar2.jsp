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
        <%String [] wIDs = (String[])session.getAttribute("w");%>
        <form action="schedule.jsp" method="get">
        <ul>
            <label for="d">Date: </label>
            <input type="date" name="d" min="<%=java.time.LocalDate.now()%>" required/>
        
            
            <%for(int i = 0; i < k.length; i++){%>
            <li><label for="e">Exercise: </label>
                <input type="text" name="e" value="<%=k[i]%>" disabled/>
                <input type="checkbox" name="ids" id="checks<%=i%>" value="<%=wIDs[i]%>" />
            </li>
            <%}%>
        
        
        </ul>
        

            <input type="submit" value="Submit"/>
        </form>       
    <br>  
     <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="information.jsp">Information</li> 
            <li><a href="build.jsp">Build-A-Workout</li>
            <li><a href="week.jsp">Calendar</li>
        </ul>
     </body>
</html>
