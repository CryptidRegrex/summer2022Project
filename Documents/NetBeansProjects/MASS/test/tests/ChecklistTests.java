/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package tests;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import checklist.Checklist;

/**
 *
 * @author JDTobiason
 */
public class ChecklistTests {
    
    //NOTE This requires MySQL access to a precreated record
    //If not established the test will not work
    
    @Test
    public void checkReturnMondayDefaultUser() {
        String user = "default";
        String day = "Monday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
        assertEquals("8", results[1]);
    }
    
    @Test
    public void checkReturnTuesdayDefaultUser() {
        String user = "default";
        String day = "Tuesday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
        assertEquals("8", results[1]);
    }
    
    @Test
    public void checkReturnWednesdayDefaultUser() {
        String user = "default";
        String day = "Wednesday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
        assertEquals("8", results[1]);
        assertEquals("11", results[2]);
        assertEquals("12", results[3]);
        assertEquals("14", results[4]);
        assertEquals("16", results[5]);
        assertEquals("22", results[6]);
        assertEquals("24", results[7]);
        assertEquals("27", results[8]);
    }
    
    @Test
    public void checkReturnThursdayDefaultUser() {
        String user = "default";
        String day = "Thursday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
    }
    
    @Test
    public void checkReturnFridayDefaultUser() {
        String user = "default";
        String day = "Friday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
    }
    
    @Test
    public void checkReturnSaturdayDefaultUser() {
        String user = "default";
        String day = "Saturday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("1", results[0]);
        assertEquals("16", results[1]);
        assertEquals("22", results[2]);
    }
    
    
    @Test
    public void checkReturnSundayDefaultUser() {
        String user = "default";
        String day = "Sunday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("0", results[0]);
    }
    
    @Test
    public void nullDayAndUser() {
        String user = null;
        String day = null;
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("0", results[0]);
    }
    
    @Test
    public void nullDayGoodUser() {
        String user = "default";
        String day = null;
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("0", results[0]);
    }
    
    @Test
    public void goodDayNullUser() {
        String user = null;
        String day = "Monday";
        String[] results = Checklist.checklistItems(user, day);
        assertEquals("0", results[0]);
    }
    
    /*@BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }*/

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
