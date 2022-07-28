<%-- 
    Document   : schedule
    Created on : Jul 21, 2022, 7:58:16 PM
    Author     : mcmtr
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@ page import = "java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import = "java.util.Calendar"%>
<%@ page import = "calendar.Calender" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
        public Object[] getNames(String [] workouts) {
            
            ArrayList<String> result = new ArrayList<String>();
            result = calendar.Calendar.wNames(workouts);
            return result.toArray();
        }    
    %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="theme.css"/>
        <title>Schedule</title>
    </head>
    <body>
        <h1>Schedule</h1>
        <c:redirect url="noResults.jsp"></c:redirect>
        <ul>
            <%
                String [] k2 = (String[])session.getAttribute("a");%>
            <%String [] g = request.getParameterValues("d");
            String[] testArray;
            
            
           
            %>
           <%testArray = request.getParameterValues("ids"); 
           
            
            //System.out.print(testArray);
            if(testArray.length <= 0){%>
                
                <c:redirect url="noResults.jsp"></c:redirect>
                
           <% }
            else{
                System.out.println("Hi");
            }
            java.util.Calendar c = java.util.Calendar.getInstance();
            
            String [] test = new String[3];
            int [] iTest = new int[3];
            test = g[0].split("-");
        
            for(int i = 0; i < 3; i++){
                iTest[i] = Integer.valueOf(test[i]);
            }
            
            c.clear();
            c.set(iTest[0], iTest[1] - 1, iTest[2]);
            String day = "Sun";
           
                Date d = new Date();
                
                for(int u = 0; u < g.length; u++)
                {
                    if(g[u].equals(""))
                    {
                        continue;
                    }
                    
                    
                    int dOW = c.get(java.util.Calendar.DAY_OF_WEEK);
                    
                    switch(dOW){
                        case 1:
                            day = "Sun";
                            break;
                        case 2:
                            day = "Mon";
                            break;
                        case 3:
                            day = "Tue";
                            break;
                        case 4:
                            day = "Wed";
                            break;
                        case 5:
                            day = "Thu";
                            break;
                        case 6:
                            day = "Fri";
                            break;
                        case 7:
                            day = "Sat";
                            break;
                        
                    }
                    
                    //lines for Justin Kenney's version to run
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    //String url = "jdbc:mysql://localhost:3306/workouts?allowPublicKeyRetrieval=true&useSSL=false";


                    String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
                    Connection con = DriverManager.getConnection(url,"root","1234");
                    Statement createCon = con.createStatement();

                    ResultSet rs;
                    String sqlquery;
                    PreparedStatement sqlSelect;

                    sqlquery = "UPDATE userworkouts SET " + day + " ='";
                    
                    String temp = " Where userID='3'";
                    
                    
            
                    
                    String idString = "";
                    for(int i = 0; i < testArray.length; i++){
                        if(i == 0){
                            idString += testArray[i];
                        }else{
                            idString += "," + testArray[i];
                        }
                    }
                    
                    
                    sqlquery += idString + "'" + temp;
                    
                    System.out.println(sqlquery);
                    
                    sqlSelect = con.prepareStatement(sqlquery);
                    //sqlSelect.setString(1, day);
                    sqlSelect.executeUpdate();
                    
                    
                    
                    Calender.wNames(testArray);
                    
                    
                        
                    String sch = "Select * FROM userworkouts WHERE userID='3'";
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
                    
                    
                    
                    
                    
                    
                <%}%>           
        </ul>
    </body>
    <h3>Sunday</h3>
    <h3>Monday</h3>
    <h3>Tuesday</h3>
    <h3>Wednesday</h3>
    <h3>Thursday</h3>
    <h3>Friday</h3>
    <h3>Saturday</h3>
</html>
