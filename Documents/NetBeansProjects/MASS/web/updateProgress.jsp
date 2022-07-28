<%-- 
    Document   : updateProgress
    Created on : Jul 27, 2022, 2:58:19 PM
    Author     : JDTobiason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "checklist.Checklist" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        public Boolean updating(String u) {
            Checklist.updateChecklistProgress(u);
            Boolean check = false;
            Boolean re = false;
            return true;
        }
    %>
    
    <% 
        String [] progress = request.getParameterValues("prog");
        String user = (String)session.getAttribute("user");
        Boolean a = updating(user); 
        System.out.println(a);
        String b = request.getParameter("username");
        String c = request.getParameter("password");
    %>
    <% 
        if (a) {
            String redURL = "schedule.jsp";
            response.sendRedirect(redURL);
        } 
    %>
</html>
