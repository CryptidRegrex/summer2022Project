/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package workout;

/**
 *
 * @author JDTobiason
 */


import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Connection;
import java.sql.DriverManager;



public class Builder {
    
    
    public static int[] returnExercises(String... workouts) {
        
        for (int i = 0;i < 3; i++) {
            System.out.println(workouts[i]);
        }
        
        /*if (workouts[2].compareTo("Lower Body") == 0) {

        }*/
        
        /*if (workouts[0].compareTo("1") == 0) {
            workouts[0] = "true";
        }
        else {
            workouts[0] = "false";
        }*/
        
        
        
        int[] wIds = new int[5];
        
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            ResultSet rs;
            String sqlquery = "SELECT WorkoutID FROM workouts WHERE WType=? AND Mgroup=? AND Intensity=?";
            PreparedStatement sqlSelect = con.prepareStatement(sqlquery);
            sqlSelect.setString(1, workouts[0]);
            sqlSelect.setString(2, workouts[1]);
            sqlSelect.setString(3, workouts[2]);
            // AND Intensity=? AND Mgroup=?
            // WType=? AND 
            rs = sqlSelect.executeQuery();
            if (rs == null) {
                System.out.println("There was nothing!!!! >:(");
            }
            //rs = createCon.executeQuery("SELECT WorkoutID, WHERE Wtype=?, Intesity=?, Mgroup=? pass FROM workouts");
            //Check to see if the user exists and they have the right password to return true
            int x = 0;
            while(rs.next()) {
                wIds[x] = rs.getInt("WorkoutID");
                System.out.println(rs.getInt("WorkoutID"));
                x++;
                if (x == 5) {
                    break;
                }
            }
            con.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            
        }

        return wIds;
    }
    
}
