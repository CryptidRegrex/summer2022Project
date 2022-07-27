<%-- 
    Document   : schedule
    Created on : Jul 21, 2022, 7:58:16 PM
    Author     : mcmtr
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@ page import = "java.util.Calendar"%>
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
            
                String [] test = new String[3];
                int [] iTest = new int[3];
                
                DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                for(int u = 0; u < g.length; u++)
                {
                    if(g[u] == "")
                    {
                        continue;
                    }
                    Calendar c = Calendar.getInstance();
                    test = g[0].split("-");
                    test[2] = test[2].substring(0,2);
                    //c.setTime();
                    for(int i = 0; i < 3; i++){
                        iTest[i] = Integer.valueOf(test[i]);
                    }
                    
                    Date t = new Date(iTest[0], iTest[1], iTest[2]);
                    String dOW = t.toString();
                    dOW = dOW.substring(0, 3);
                    LocalDateTime d = LocalDateTime.parse(g[u], f);%>
                    <%=dOW%>
                    
                <li><%out.println(k2[u]); out.println(d);}%></li>              
        </ul>
    </body>
</html>
