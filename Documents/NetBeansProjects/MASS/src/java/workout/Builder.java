/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package workout;

/**
 *
 * @author JDTobiason
 */

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.lang.Math;

/**
 * This class does all the logic for determine what exercises to serve the user
 * based on the user's input
 * @author JDTobiason
 */
public class Builder {
    
    /**
     * This class takes information from the user via our webpage and 
     * uses the information to return an array of exercises given with a 
     * workoutID. 
     * @param wType This is the workout type
     * @param wInt This is the workout intensity
     * @param equ This is the workout equipment
     * @param workouts This is the types of workouts like lower, upper, all...
     * @return workoutFields An array of workoutIds based on the user input
     */
    public static ArrayList<String> returnExercises(String wType, String wInt, String equ, String[] workouts) {
        
        ArrayList<String> workoutFields = new ArrayList<String>();
        
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
            
            //Check if "All" has been selected for muscle groups
            boolean allCheck = false;
            for(String test :workouts){
                if(test.equals("*")){
                    allCheck = true;
                    break;
                }
            }
            String tempEquBol = " AND EquipmentBol='0'";
            
            //Setup the appropriate query
            if(allCheck || workouts.length>2){
                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=?";

                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=?";

                if(equ.equals("0")){
                    sqlquery = sqlquery + tempEquBol;
                }
                sqlSelect = con.prepareStatement(sqlquery);
            }else if(workouts.length == 2){
                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=? AND (Mgroup=? OR Mgroup=?)";
                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=? AND (Mgroup=? OR Mgroup=?)";

                if(equ.equals("0")){
                    sqlquery = sqlquery + tempEquBol;
                }
                sqlSelect = con.prepareStatement(sqlquery);
                sqlSelect.setString(3, workouts[0]);
                sqlSelect.setString(4, workouts[1]);
            }else{
                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=? AND Mgroup=?";

                sqlquery = "SELECT WorkoutID, Workout, Sets, Reps, MaxReps FROM workouts WHERE WType=? AND Intensity=? AND Mgroup=?";
                if(equ.equals("0")){
                    sqlquery = sqlquery + tempEquBol;
                }
                sqlSelect = con.prepareStatement(sqlquery);
                sqlSelect.setString(3, workouts[0]);
            }
            
            
            sqlSelect.setString(1, wType);
            sqlSelect.setString(2, wInt);
        
            rs = sqlSelect.executeQuery();
            
            if (rs == null) {
                System.out.println("There was nothing!!!! >:(");
            }
            
            //Grab all the fields from the query
            while(rs.next()) {
                workoutFields.add(String.valueOf(rs.getInt(1)));
                workoutFields.add(rs.getString(2));
                workoutFields.add(String.valueOf(rs.getInt(3)));
                workoutFields.add(String.valueOf(rs.getInt(4)));
                workoutFields.add(String.valueOf(Math.round(rs.getFloat(5)*100)));
                
            }
            con.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        } 
        
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            
        } 

        return workoutFields;
    }
    
}
