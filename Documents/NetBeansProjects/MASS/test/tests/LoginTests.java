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
import login.Login;

/**
 *
 * @author JDTobiason
 */
public class LoginTests {
    /*
    public LoginTests() {
    }
    
    @BeforeClass
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
    }
    */
    @Test
    public void loginCheckUserNullInput() {
        String user = null;
        String password = null;
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void loginCheckUserOnlyUsernameNoPass() {
        String user = "test";
        String password = null;
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void loginCheckUserOnlyPassNoUsername() {
        String user = null;
        String password = "test";
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void loginCheckUserGoodUserNameAndPass() {
        String user = "test";
        String password = "test";
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, true);
    }
    
    @Test
    public void loginCheckUserLongUsernameGoodPass() {
        String user = "ThisIsTooLongOfAUserNameThatShouldReturnFalseFromTheCheck";
        String password = "test";
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void loginCheckUserLongPassGoodUsername() {
        String user = "test";
        String password = "ThisIsTooLongOfAPasswordThatShouldReturnFalseFromTheCheck";
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void loginCheckUserLongUsernameLongPass() {
        String user = "ThisIsTooLongOfAUserNameThatShouldReturnFalseFromTheCheck";
        String password = "ThisIsTooLongOfAPasswordThatShouldReturnFalseFromTheCheck";
        Boolean test = Login.checkUser(user, password);
        assertEquals(test, false);
    }
    
    @Test
    public void testSQLCreateNewUser() {
        String user = "Good";
        String pass1 = "Good";
        String pass2 = "Good";
        Boolean actual = false;
        Login.createNewUser(user, pass1, pass2);
        try {
            String url = "jdbc:mysql://localhost:3306/mass?allowPublicKeyRetrieval=true&useSSL=false";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement createCon = con.createStatement();
            ResultSet rs;
            rs = createCon.executeQuery("SELECT user_name, pass FROM user_database");
            while(rs.next()) {
                if (user.compareTo(rs.getString("user_name")) == 0 && pass1.compareTo(rs.getString("pass")) == 0) {
                    actual = true;
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        
        assertEquals(actual, true);
        
    }
    
    @Test
    public void testCreateNewUserNull() {
        String user = null;
        String password = null;
        String password2 = null;
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }
    
    @Test
    public void testCreateNewUserNullUser() {
        String user = null;
        String password = "test";
        String password2= "test";
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }
    
    @Test
    public void testCreateNewUserNullPassOne() {
        String user = "test";
        String password = null;
        String password2= "test";
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }
    
    @Test
    public void testCreateNewUserNullPassTwo() {
        String user = "test";
        String password = "test";
        String password2= null;
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }
    
    @Test
    public void testCreateNewUserTooLongUser() {
        String user = "ThisIsTooLongOfAUserNameThatShouldReturnFalseFromTheCheck";
        String password = "test";
        String password2= "test";
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }

    
    @Test
    public void testCreateNewUserTooLongPassword() {
        String user = "test";
        String password = "ThisIsTooLongOfAUserNameThatShouldReturnFalseFromTheCheck";
        String password2= "ThisIsTooLongOfAUserNameThatShouldReturnFalseFromTheCheck";
        Boolean test = Login.createNewUser(user, password, password2);
        assertEquals(test, false);
    }
}
