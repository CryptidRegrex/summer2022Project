/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package calendar;

/**
 *
 * @author JDTobiason
 */
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.lang.Math;

public class Calender {
    
    /**
     * This class takes information from the user via our webpage and 
     * uses the information to return an array of exercises given with a 
     * workoutID. 
     *
     * @return workoutFields An array of workoutIds based on the user input
     */
    public static ArrayList<String> wNames(String[] wIDs) {
        
        ArrayList<String> workoutNames = new ArrayList<String>();
        
        try {
            //lines for Justin Kenney's version to run
            Class.forName("com.mysql.cj.jdbc.Driver");
            //String url = "jdbc:mysql://localhost:3306/workouts?allowPublicKeyRetrieval=true&useSSL=false";
            
            
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            
            ResultSet rs;
            String sqlquery;
            PreparedStatement sqlSelect;
            
            sqlquery = "SELECT Workout FROM workouts";
            for(int i = 0; i < wIDs.length;i++){
                if(i == 0){
                    sqlquery += " WHERE WorkoutID='" + wIDs[i] + "'";
                }
                else{
                    sqlquery += " OR WorkoutID='" + wIDs[i] + "'";
                }
            }
            //WHERE WorkoutID=?
            sqlSelect = con.prepareStatement(sqlquery);
            
        
            rs = sqlSelect.executeQuery();
            
            if (rs == null) {
                System.out.println("There was nothing!!!! >:(");
            }
            
            //Grab all the fields from the query
            while(rs.next()) {
                workoutNames.add(rs.getString(1));
                
            }
            con.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        } 
        
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            
        } 

        return workoutNames;
    }
    
}