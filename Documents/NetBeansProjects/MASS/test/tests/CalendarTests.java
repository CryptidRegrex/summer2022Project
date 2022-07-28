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
}
