<%-- 
    Document   : schedule
    Created on : Jul 21, 2022, 7:58:16 PM
    Author     : mcmtr
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Schedule</title>
    </head>
    <body>
        <h1>Schedule</h1>
        <ul>
            <%String [] k2 = (String[])session.getAttribute("a");%>
            <%String [] g = request.getParameterValues("d");
                DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                for(int u = 0; u < g.length; u++)
                {
                    if(g[u] == "")
                    {
                        continue;
                    }
                    LocalDateTime d = LocalDateTime.parse(g[u], f);%>     
                <li><%out.println(k2[u]); out.println(d);}%></li>              
        </ul>
    </body>
</html>
