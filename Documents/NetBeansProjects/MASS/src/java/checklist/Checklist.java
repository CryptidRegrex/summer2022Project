/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package checklist;
import calendar.Calender;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author JDTobiason
 */
public class Checklist {
    
    public static String[] checklistItems(String user, String day) {
        String[] workouts = new String[30];
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            String sch = "Select * FROM userworkouts Where userID='" + user + "'";
            PreparedStatement sqlSch = con.prepareStatement(sch);
            ResultSet rs;
            rs = sqlSch.executeQuery();
            
            String dOW = day;
            int queryColumn = 1;

            switch(dOW){
                case "Sunday":
                    queryColumn = 2;
                    break;
                case "Monday":
                    queryColumn = 3;
                    break;
                case "Tuesday":
                    queryColumn = 4;
                    break;
                case "Wednesday":
                    queryColumn = 5;
                    break;
                case "Thursday":
                    queryColumn = 6;
                    break;
                case "Friday":
                    queryColumn = 7;
                    break;
                case "Saturday":
                    queryColumn = 8;
                    break;

            }

            while(rs.next()){
                if(!rs.getString(queryColumn).equals(null)){
                    workouts = rs.getString(queryColumn).split(",");
                }
            }
            
            con.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException a) {
            a.printStackTrace();
        }
        
        
        return workouts;
    }
}
