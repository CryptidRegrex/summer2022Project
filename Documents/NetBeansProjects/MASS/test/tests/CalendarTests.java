/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tests;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.junit.Test;
import java.util.ArrayList;
import static org.junit.Assert.*;
import calendar.Calender;

/**
 *
 * @author justi
 */

//NOTE This requires access to the workouts database to run correctly

public class CalendarTests {
    @Test
    public void checkCorrectName() {
        String[] wIDs = {"1"};
        ArrayList<String> result;
        result = Calender.wNames(wIDs);
        
        assertEquals(result.isEmpty(), false);
        assertEquals(result.size(), 1);
        assertEquals(result.get(0), "Bench");
    }
    
    @Test
    public void checkCorrectNames() {
        String[] wIDs = new String[3];
        wIDs[0] = "29";
        wIDs[1] = "15";
        wIDs[2] = "8";
        
        ArrayList<String> result;
        result = Calender.wNames(wIDs);
        
        assertEquals(result.isEmpty(), false);
        assertEquals(result.size(), 3);
        //0 and 2 needed to be switched
        assertEquals(result.get(0), "Bicep Curls");
        assertEquals(result.get(1), "Pushups");
        assertEquals(result.get(2), "Lunges");
    }
    
    @Test
    public void incorrectWorkoutIDs() {
        String[] wIDs = {"100"};
        ArrayList<String> result;
        result = Calender.wNames(wIDs);
        assertEquals(result.isEmpty(), true);
        assertEquals(result.size(), 0);
    }
    
    @Test
    public void incorrectAndCorrectWorkoutIDs() {
        String[] wIDs = new String[2];
        wIDs[0] = "100";
        wIDs[1] = "1";
        
        ArrayList<String> result;
        result = Calender.wNames(wIDs);
        
        assertEquals(result.isEmpty(), false);
        assertEquals(result.size(), 1);
        assertEquals(result.get(0), "Bench");
    }
    
    @Test
    public void nullWorkoutIDArray() {
        String[] wIDs = {null};
        ArrayList<String> result;
        result = Calender.wNames(wIDs);
        assertEquals(result.isEmpty(), false);
        assertEquals(result.size(), 1);
        assertEquals(result.get(0), "Nothing Scheduled");
    }
}
