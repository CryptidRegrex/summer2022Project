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

    
    
    <progress name="workoutProgress" id="workoutProgress" value="10" max="100"> </progress>
    <h3><%=day%></h3>
    <ul>
        <% for(String t: Calender.wNames(aWorkout)) { %>
        <li><%=t%>
            <%=i++%>
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
            //let check = document.querySelector("#complete").checked;
            console.log(check);
            for (var ne = 1; ne <= 5; ne++) {
                check[ne] = document.querySelector("#complete" + ne).checked;
                console.log(check[ne]);
                if (check[ne] === true) {
                    points++;
                }
            }
            total = points * 20;
            pro.setAttribute("value",total);
            
            if (total === 100) {
                alert("You did it!!!");
            }
            //document.getElementByID("workoutProgress").value = 100;
            /*if (check === true) {
                pro.setAttribute("value",total);
            }
            else {
                pro.setAttribute("value","0");
            }*/
            //document.getElementById("checks").required = true; 
        }
    </script>
    <input type="button" value="Update Progress" onclick="test()">
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
