<%-- 
    Document   : s
    Created on : Jul 20, 2022, 4:55:03 PM
    Author     : mcmtr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Workout Schedule</h1>
        <ul>
            <li><%out.println(request.getParameter("bob"));%>
                <%out.println(request.getParameter("    jon"));%></li>
        </ul>
    </body>
</html>
