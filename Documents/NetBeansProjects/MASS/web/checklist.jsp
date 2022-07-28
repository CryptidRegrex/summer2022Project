<%-- 
    Document   : checklist
    Created on : Jul 27, 2022, 9:32:57 PM
    Author     : JDTobiason
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
        <h1>Choose a day:</h1>
        <form action="checklistDay.jsp">
            <select name="days" id="days" required>
                <option value="Sunday">Sunday</option>
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
            </select>
            <input type="submit">
        </form>
    </body>
</html>
