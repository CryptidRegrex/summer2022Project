<%-- 
    Document   : week
    Created on : Jul 27, 2022, 7:04:38 PM
    Author     : justi
--%>
<%@ page import = "calendar.Calender" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul>
    
    
<%                  
    
                    String user = (String)session.getAttribute("user"); 
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    //String url = "jdbc:mysql://localhost:3306/workouts?allowPublicKeyRetrieval=true&useSSL=false";
                    

                    String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
                    Connection con = DriverManager.getConnection(url,"root","1234");
                    Statement createCon = con.createStatement();

                    ResultSet rs;
                    String sch = "Select * FROM userworkouts Where userID='" + user + "'";
                    PreparedStatement sqlSch = con.prepareStatement(sch);
                    rs = sqlSch.executeQuery();
                    
                    String[] wForSun = new String[30];
                    String[] wForMon = new String[30];
                    String[] wForTue = new String[30];
                    String[] wForWed = new String[30];
                    String[] wForThu = new String[30];
                    String[] wForFri = new String[30];
                    String[] wForSat = new String[30];
                    
                    while(rs.next()){
                        if(!rs.getString(2).equals(null)){
                            wForThu = rs.getString(2).split(",");
                        }
                        if(!rs.getString(3).equals(null)){
                            wForMon = rs.getString(3).split(",");
                        }
                        if(!rs.getString(4).equals(null)){
                            wForTue = rs.getString(4).split(",");
                        }
                        if(!rs.getString(5).equals(null)){
                            wForWed = rs.getString(5).split(",");
                        }
                        
                        if(!rs.getString(6).equals(null)){
                            wForThu = rs.getString(6).split(",");
                        }
                        if(!rs.getString(7).equals(null)){
                            wForFri = rs.getString(7).split(",");
                        }
                        if(!rs.getString(8).equals(null)){
                            wForSat = rs.getString(8).split(",");
                        }
                    }
                    
                    %>
                    
                    <h3>Sunday</h3>
                    <% for(String t: Calender.wNames(wForSun)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Monday</h3>
                    <% for(String t: Calender.wNames(wForMon)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Tuesday</h3>
                    <% for(String t: Calender.wNames(wForTue)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Wednesday</h3>
                    <% for(String t: Calender.wNames(wForWed)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Thursday</h3>
                    <% for(String t: Calender.wNames(wForThu)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Friday</h3>
                    <% for(String t: Calender.wNames(wForFri)){ %>
                        <li><%=t%></li>
                    <%}%>
                    <h3>Saturday</h3>
                    <% for(String t: Calender.wNames(wForSat)){ %>
                        <li><%=t%></li>
                    <%}%>
</ul>
                    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Week Schedule</title>
    </head>
    <body>
        <h3>Navigation</h2>
        <ul>
            <li><a href="home.jsp">Home</li> 
            <li><a href="build.jsp">Build-A-Workout</li>
            <li><a href="checklist.jsp">Checklist</li>
        </ul>
    </body>
</html>
