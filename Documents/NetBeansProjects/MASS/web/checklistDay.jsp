<%-- 
    Document   : checklistDay
    Created on : Jul 28, 2022, 8:56:25 AM
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
<%@ page import = "checklist.Checklist" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%!
        public String[] updating(String u, String day) {
            String[] workoutIDs = Checklist.checklistItems(u, day);
            return workoutIDs;
        }
    %>
    
    <% 
        String [] progress = request.getParameterValues("prog");
        String user = (String)session.getAttribute("user");
        String day = request.getParameter("days");
        String [] aWorkout = updating(user, day); 
        System.out.println(day);
        System.out.println(aWorkout[0]);
        int i = 0;
    %>

    
    

    <h3><%=day%></h3>
    <progress name="workoutProgress" id="workoutProgress" value="0" max="100" style="width:100%; height:100%"> </progress>
    <ul>
        <% for(String t: Calender.wNames(aWorkout)) { %>
        <li><%=i++%>
            <%=t%>
        <input type="checkbox" id="complete<%=i%>" name="complete" class="prog">
        </li>
        <%}%>
    </ul>
    
    <script>
        function test() {
            let pro = document.querySelector("progress");
            const check = [];
            var full = 100;
            var points = 0;
            var total = 0;
            var len = "<%=i%>";
            var divisor = full / len;
            console.log(len);
            //let check = document.querySelector("#complete").checked;
            console.log(check);
            for (var ne = 1; ne <= len; ne++) {
                check[ne] = document.querySelector("#complete" + ne).checked;
                console.log(check[ne]);
                if (check[ne] === true) {
                    points++;
                }
            }
            
            total = points * divisor;
            console.log(total);
            pro.setAttribute("value",total);
            
            if (total >= 100) {
                alert("You did it!!!");
            }
        }
    </script>
    
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Checklist</title>
    </head>
    <body>
        <br>
        <input type="button" value="Update Progress" onclick="test()">
        <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Build-A-Workout</li>
            <li><a href="information.jsp">Information</li>
            <li><a href="checklist.jsp">Checklist</li>
        </ul>
    </body>
</html>
